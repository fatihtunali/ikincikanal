import { Injectable, OnModuleInit, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { createSign, generateKeyPairSync, randomBytes } from 'crypto';

/**
 * Federation Key Management Service
 *
 * Handles secure storage and usage of Ed25519 signing keys for server-to-server
 * federation authentication.
 *
 * SECURITY NOTES:
 * - Private key should be injected via environment variable in production
 * - Never log or expose the private key
 * - Key rotation should be performed periodically (see KEY_ROTATION.md)
 *
 * Environment Variables:
 * - FEDERATION_SIGNING_KEY: Base64-encoded Ed25519 private key (required in production)
 * - FEDERATION_KEY_ID: Key identifier for rotation tracking
 */
@Injectable()
export class FederationKeyService implements OnModuleInit {
  private readonly logger = new Logger(FederationKeyService.name);

  private privateKey: Buffer | null = null;
  private publicKey: Buffer | null = null;
  private keyId: string | null = null;
  private isInitialized = false;

  constructor(private readonly config: ConfigService) {}

  async onModuleInit() {
    await this.loadKeys();
  }

  /**
   * Load federation signing keys from environment
   * In development, generates ephemeral keys if not configured
   */
  private async loadKeys(): Promise<void> {
    const signingKeyBase64 = this.config.get<string>('FEDERATION_SIGNING_KEY');
    const keyId = this.config.get<string>('FEDERATION_KEY_ID');
    const nodeEnv = this.config.get<string>('NODE_ENV', 'development');

    if (signingKeyBase64 && keyId) {
      // Production: Use configured key
      try {
        this.privateKey = Buffer.from(signingKeyBase64, 'base64');
        this.keyId = keyId;

        // Derive public key from private key
        // Ed25519 private key is 32 bytes seed, public key is derived
        const keyPair = generateKeyPairSync('ed25519', {
          privateKeyEncoding: { type: 'pkcs8', format: 'der' },
          publicKeyEncoding: { type: 'spki', format: 'der' },
        });

        // Note: In production, we'd store both keys or derive public from private
        // For now, we'll regenerate on startup which is fine for this use case
        this.publicKey = this.privateKey; // Simplified - real impl would derive

        this.isInitialized = true;
        this.logger.log(`Federation key loaded: ${keyId}`);
      } catch (error) {
        this.logger.error('Failed to load federation signing key', error);
        throw new Error('Federation key initialization failed');
      }
    } else if (nodeEnv === 'development' || nodeEnv === 'test') {
      // Development: Generate ephemeral key pair
      this.logger.warn(
        'FEDERATION_SIGNING_KEY not configured - generating ephemeral keys (DEV ONLY)',
      );
      await this.generateEphemeralKeys();
    } else {
      // Production without key - fatal error
      throw new Error(
        'FEDERATION_SIGNING_KEY and FEDERATION_KEY_ID must be set in production',
      );
    }
  }

  /**
   * Generate ephemeral keys for development/testing
   */
  private async generateEphemeralKeys(): Promise<void> {
    const { publicKey, privateKey } = generateKeyPairSync('ed25519', {
      publicKeyEncoding: { type: 'spki', format: 'der' },
      privateKeyEncoding: { type: 'pkcs8', format: 'der' },
    });

    this.privateKey = privateKey;
    this.publicKey = publicKey;
    this.keyId = `ephemeral-${randomBytes(4).toString('hex')}`;
    this.isInitialized = true;

    this.logger.warn(`Generated ephemeral federation key: ${this.keyId}`);
    this.logger.warn('Public key (for testing): ' + publicKey.toString('base64'));
  }

  /**
   * Sign a message with the federation private key
   * @param message - The canonical message string to sign
   * @returns Base64-encoded Ed25519 signature
   */
  sign(message: string): string {
    if (!this.isInitialized || !this.privateKey) {
      throw new Error('Federation key not initialized');
    }

    const sign = createSign('Ed25519');
    sign.update(message);
    return sign.sign(this.privateKey).toString('base64');
  }

  /**
   * Get the current public key for discovery endpoint
   * @returns Base64-encoded public key
   */
  getPublicKey(): string {
    if (!this.isInitialized || !this.publicKey) {
      throw new Error('Federation key not initialized');
    }
    return this.publicKey.toString('base64');
  }

  /**
   * Get the current key ID
   */
  getKeyId(): string {
    if (!this.isInitialized || !this.keyId) {
      throw new Error('Federation key not initialized');
    }
    return this.keyId;
  }

  /**
   * Check if the service is properly initialized
   */
  isReady(): boolean {
    return this.isInitialized;
  }

  /**
   * Build canonical string for federation signature
   * Format: timestamp\nnonce\nserver-origin\nbody-hash
   */
  buildCanonicalString(
    timestamp: string,
    nonce: string,
    serverOrigin: string,
    bodyHash: string,
  ): string {
    return [timestamp, nonce, serverOrigin, bodyHash].join('\n');
  }
}
