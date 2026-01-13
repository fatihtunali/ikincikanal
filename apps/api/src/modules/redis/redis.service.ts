import { Injectable, OnModuleDestroy } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import Redis from 'ioredis';

@Injectable()
export class RedisService implements OnModuleDestroy {
  private readonly client: Redis;
  private readonly subscriber: Redis;

  constructor(private readonly config: ConfigService) {
    const redisUrl = this.config.get<string>('REDIS_URL', 'redis://localhost:6379');
    this.client = new Redis(redisUrl);
    this.subscriber = new Redis(redisUrl);
  }

  async onModuleDestroy() {
    await this.client.quit();
    await this.subscriber.quit();
  }

  /**
   * Health check ping
   */
  async ping(): Promise<string> {
    return this.client.ping();
  }

  // ==========================================================================
  // Rate Limiting
  // ==========================================================================

  /**
   * Increment rate limit counter for IP-based login attempts
   * @returns current count after increment
   */
  async incrementLoginRateByIp(ip: string): Promise<number> {
    const key = `rate:ip:login:${ip}`;
    const count = await this.client.incr(key);
    if (count === 1) {
      await this.client.expire(key, 15 * 60); // 15 minutes TTL
    }
    return count;
  }

  /**
   * Increment rate limit counter for handle-based login attempts
   * @returns current count after increment
   */
  async incrementLoginRateByHandle(handle: string): Promise<number> {
    const key = `rate:handle:login:${handle}`;
    const count = await this.client.incr(key);
    if (count === 1) {
      await this.client.expire(key, 60 * 60); // 1 hour TTL
    }
    return count;
  }

  /**
   * Get lockout status for a handle
   */
  async getLockout(handle: string): Promise<{ count: number; until: number } | null> {
    const data = await this.client.get(`lockout:${handle}`);
    return data ? JSON.parse(data) : null;
  }

  /**
   * Set lockout for a handle
   */
  async setLockout(handle: string, count: number, until: number): Promise<void> {
    const key = `lockout:${handle}`;
    await this.client.set(key, JSON.stringify({ count, until }), 'EX', 24 * 60 * 60);
  }

  /**
   * Increment TURN credentials rate limit
   */
  async incrementTurnRate(userId: string): Promise<number> {
    const key = `rate:turn:${userId}`;
    const count = await this.client.incr(key);
    if (count === 1) {
      await this.client.expire(key, 60 * 60); // 1 hour TTL
    }
    return count;
  }

  /**
   * Increment user resolve rate limit by IP
   */
  async incrementResolveRateByIp(ip: string): Promise<number> {
    const key = `rate:resolve:ip:${ip}`;
    const count = await this.client.incr(key);
    if (count === 1) {
      await this.client.expire(key, 60); // 1 minute TTL
    }
    return count;
  }

  /**
   * Increment user resolve rate limit by user
   */
  async incrementResolveRateByUser(userId: string): Promise<number> {
    const key = `rate:resolve:user:${userId}`;
    const count = await this.client.incr(key);
    if (count === 1) {
      await this.client.expire(key, 60); // 1 minute TTL
    }
    return count;
  }

  // ==========================================================================
  // Nonce Cache (Federation Replay Protection)
  // ==========================================================================

  /**
   * Check if nonce exists (replay detection)
   * @returns true if nonce is a replay (already used)
   */
  async isNonceReplay(serverOrigin: string, nonce: string): Promise<boolean> {
    const key = `nonce:${serverOrigin}:${nonce}`;
    const exists = await this.client.exists(key);
    return exists === 1;
  }

  /**
   * Store nonce to prevent replay
   */
  async storeNonce(serverOrigin: string, nonce: string): Promise<void> {
    const key = `nonce:${serverOrigin}:${nonce}`;
    await this.client.set(key, '1', 'EX', 5 * 60); // 5 minutes TTL
  }

  // ==========================================================================
  // WebAuthn Challenges
  // ==========================================================================

  /**
   * Store login challenge for passkey authentication
   */
  async storeLoginChallenge(
    handle: string,
    challenge: string,
    timeout: number,
  ): Promise<void> {
    const key = `challenge:login:${handle}`;
    await this.client.set(
      key,
      JSON.stringify({ challenge, timeout }),
      'EX',
      5 * 60,
    );
  }

  /**
   * Get and delete login challenge (single-use)
   */
  async getAndDeleteLoginChallenge(
    handle: string,
  ): Promise<{ challenge: string; timeout: number } | null> {
    const key = `challenge:login:${handle}`;
    const data = await this.client.get(key);
    if (data) {
      await this.client.del(key);
      return JSON.parse(data);
    }
    return null;
  }

  /**
   * Store registration challenge for passkey registration
   */
  async storeRegisterChallenge(
    userId: string,
    challenge: string,
    timeout: number,
  ): Promise<void> {
    const key = `challenge:register:${userId}`;
    await this.client.set(
      key,
      JSON.stringify({ challenge, timeout }),
      'EX',
      5 * 60,
    );
  }

  /**
   * Get and delete registration challenge (single-use)
   */
  async getAndDeleteRegisterChallenge(
    userId: string,
  ): Promise<{ challenge: string; timeout: number } | null> {
    const key = `challenge:register:${userId}`;
    const data = await this.client.get(key);
    if (data) {
      await this.client.del(key);
      return JSON.parse(data);
    }
    return null;
  }

  // ==========================================================================
  // Nuke Tokens
  // ==========================================================================

  /**
   * Store nuke token for emergency account deletion
   */
  async storeNukeToken(userId: string, token: string): Promise<void> {
    const key = `nuke:${userId}`;
    const expiresAt = Date.now() + 30 * 1000; // 30 seconds
    await this.client.set(key, JSON.stringify({ token, expiresAt }), 'EX', 30);
  }

  /**
   * Verify and consume nuke token (single-use)
   */
  async verifyAndConsumeNukeToken(
    userId: string,
    token: string,
  ): Promise<boolean> {
    const key = `nuke:${userId}`;
    const data = await this.client.get(key);
    if (!data) return false;

    const { token: storedToken, expiresAt } = JSON.parse(data);
    if (storedToken !== token || Date.now() > expiresAt) {
      return false;
    }

    await this.client.del(key);
    return true;
  }

  // ==========================================================================
  // Long-Poll Notification (Pub/Sub)
  // ==========================================================================

  /**
   * Publish message arrival notification
   */
  async publishMessageArrival(deviceId: string): Promise<void> {
    await this.client.publish(`channel:messages:${deviceId}`, 'new');
  }

  /**
   * Subscribe to message arrival notifications
   */
  async subscribeToMessages(
    deviceId: string,
    callback: () => void,
  ): Promise<() => void> {
    const channel = `channel:messages:${deviceId}`;
    await this.subscriber.subscribe(channel);
    this.subscriber.on('message', (ch, _msg) => {
      if (ch === channel) callback();
    });
    return () => {
      this.subscriber.unsubscribe(channel);
    };
  }

  /**
   * Publish call event notification
   */
  async publishCallEvent(deviceId: string): Promise<void> {
    await this.client.publish(`channel:calls:${deviceId}`, 'new');
  }

  /**
   * Subscribe to call event notifications
   */
  async subscribeToCallEvents(
    deviceId: string,
    callback: () => void,
  ): Promise<() => void> {
    const channel = `channel:calls:${deviceId}`;
    await this.subscriber.subscribe(channel);
    this.subscriber.on('message', (ch, _msg) => {
      if (ch === channel) callback();
    });
    return () => {
      this.subscriber.unsubscribe(channel);
    };
  }

  // ==========================================================================
  // Idempotency Keys
  // ==========================================================================

  /**
   * Check if idempotency key exists and get the message ID
   */
  async getIdempotencyResult(key: string): Promise<string | null> {
    return this.client.get(`idempotency:${key}`);
  }

  /**
   * Store idempotency result
   */
  async storeIdempotencyResult(
    key: string,
    serverMessageId: string,
  ): Promise<void> {
    await this.client.set(
      `idempotency:${key}`,
      serverMessageId,
      'EX',
      24 * 60 * 60,
    ); // 24 hours
  }

  // ==========================================================================
  // Session Blacklist (JWT Logout)
  // ==========================================================================

  /**
   * Blacklist a JWT ID for logout
   */
  async blacklistJti(jti: string, remainingTtlSeconds: number): Promise<void> {
    if (remainingTtlSeconds > 0) {
      await this.client.set(`blacklist:jti:${jti}`, '1', 'EX', remainingTtlSeconds);
    }
  }

  /**
   * Check if JWT ID is blacklisted
   */
  async isJtiBlacklisted(jti: string): Promise<boolean> {
    const exists = await this.client.exists(`blacklist:jti:${jti}`);
    return exists === 1;
  }

  // ==========================================================================
  // Privacy / Export / Deletion
  // ==========================================================================

  /**
   * Generic get for privacy operations
   */
  async get(key: string): Promise<string | null> {
    return this.client.get(key);
  }

  /**
   * Generic set with TTL for privacy operations
   */
  async setex(key: string, ttl: number, value: string): Promise<void> {
    await this.client.setex(key, ttl, value);
  }

  /**
   * Generic delete for privacy operations
   */
  async del(key: string): Promise<void> {
    await this.client.del(key);
  }

  /**
   * Delete multiple keys for privacy operations
   */
  async delMultiple(keys: string[]): Promise<void> {
    if (keys.length > 0) {
      await this.client.del(...keys);
    }
  }
}
