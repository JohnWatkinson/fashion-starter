#!/bin/bash
set -e

echo "🔄 Restarting Docker services (Postgres, Redis, MeiliSearch)..."

# Stop containers if running
docker compose -f docker-compose.dev.yml down

# Start fresh
docker compose -f docker-compose.dev.yml up -d

echo "✅ Services restarted!"
echo ""
echo "✔ Backend: run in another terminal →"
echo "cd medusa && yarn dev"
echo ""
echo "✔ Storefront: run in another terminal →"
echo "cd storefront && yarn dev"
