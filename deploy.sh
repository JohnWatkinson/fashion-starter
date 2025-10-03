#!/bin/bash

# Fashion Starter Deployment Script
# Run this on your VPS after pushing to GitHub

set -e  # Exit on any error

echo "🚀 Starting deployment..."

# Check if we're in the right directory
if [ ! -f "medusa/package.json" ]; then
    echo "❌ Error: Run this from the fashion-starter root directory"
    exit 1
fi

# Pull latest changes
echo "📥 Pulling latest code..."
git pull origin main

# Update Medusa backend
echo "🔧 Updating Medusa backend..."
cd medusa
yarn install --production
yarn build

# Run migrations if needed
echo "🗄️  Running database migrations..."
yarn medusa db:migrate

cd ..

# Update Storefront
echo "🎨 Updating storefront..."
cd storefront
yarn install --production
yarn build

cd ..

# Restart services (uncomment when you set up PM2)
# echo "🔄 Restarting services..."
# pm2 restart medusa-backend
# pm2 restart storefront

echo "✅ Deployment complete!"
echo "📱 Frontend: http://your-domain.com"
echo "⚡ Backend: http://your-domain.com/api"
echo "🔐 Admin: http://your-domain.com/app"