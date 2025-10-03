#!/bin/bash
set -e

echo "🚀 Starting Docker services (Postgres, Redis, MeiliSearch)..."
docker compose -f docker-compose.dev.yml up -d

echo "✔ Backend: run in another terminal →"
echo "cd medusa && yarn dev"
echo ""
echo "✔ Storefront: run in another terminal →"
echo "cd storefront && yarn dev"
echo ""
echo "✅ All services are up!"
