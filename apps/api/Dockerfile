# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Copy workspace files
COPY package*.json ./
COPY apps/api/package*.json ./apps/api/

# Install dependencies
RUN npm ci --workspace=@ikinci-kanal/api

# Copy source files
COPY prisma ./prisma
COPY apps/api ./apps/api

# Generate Prisma client
RUN npm run db:generate

# Build the application
RUN npm run build --workspace=@ikinci-kanal/api

# Production stage
FROM node:20-alpine AS production

WORKDIR /app

# Create non-root user
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nestjs -u 1001

# Copy necessary files from builder
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/apps/api/node_modules ./apps/api/node_modules
COPY --from=builder /app/apps/api/dist ./apps/api/dist
COPY --from=builder /app/prisma ./prisma

# Set user
USER nestjs

# Expose port
EXPOSE 3000

# Start the application
CMD ["node", "apps/api/dist/main.js"]
