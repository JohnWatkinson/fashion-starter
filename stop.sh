#!/bin/bash
set -e

echo "🛑 Stopping backend and storefront (Ctrl+C if running)..."
echo "🛑 Stopping Docker services..."
docker compose -f docker-compose.dev.yml down

echo "✅ All services stopped!"
