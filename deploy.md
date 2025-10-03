# Deployment Workflow

## Development Cycle

### Local Development
```bash
# 1. Work locally (VSCode terminals)
cd fashion-starter
git checkout -b feature/new-feature
# Make changes...

# 2. Test locally
cd medusa && yarn dev        # Terminal 1
cd storefront && yarn dev    # Terminal 2
# Verify everything works

# 3. Commit & push
git add .
git commit -m "Add new feature"
git push origin feature/new-feature

# 4. Merge to main (via GitHub PR or directly)
git checkout main
git merge feature/new-feature
git push origin main
```

### VPS Deployment
```bash
# On VPS (SSH in)
cd /path/to/your/site
git pull origin main        # Get latest code
./deploy.sh                 # Run deployment script
```

## VPS Setup (One-time)

### 1. Clone from GitHub (not local)
```bash
# On VPS
cd /var/www  # or wherever you want it
git clone https://github.com/yourusername/fashion-starter.git
cd fashion-starter
```

### 2. Environment Setup
```bash
# Copy and edit production configs
cp medusa/.env.template medusa/.env
cp storefront/.env.template storefront/.env.local

# Edit with production values:
# - Database URLs
# - Domain names
# - Real API keys
```

### 3. Production Install
```bash
# Install dependencies
cd medusa && yarn install --production
cd ../storefront && yarn install --production
```

## Deployment Scripts

### Create deploy.sh (on VPS)
```bash
#!/bin/bash
echo "🚀 Deploying Fashion Starter..."

# Pull latest code
git pull origin main

# Update backend
cd medusa
yarn install
yarn build
yarn medusa db:migrate

# Update frontend
cd ../storefront
yarn install
yarn build

# Restart services
pm2 restart medusa-backend
pm2 restart storefront

echo "✅ Deployment complete!"
```

## Benefits of This Approach

✅ **Clean separation**: Local = development, VPS = production
✅ **Version control**: All changes tracked in git
✅ **Rollback ability**: Can revert to any previous version
✅ **Team ready**: Others can contribute via GitHub
✅ **Backup**: Your code is safe on GitHub
✅ **CI/CD ready**: Can add automated testing/deployment later

## Production Considerations

- Use **PM2** or **Docker** to run services on VPS
- Set up **reverse proxy** (Nginx) for domains
- Use **production databases** (not Docker containers)
- Configure **SSL certificates** (Let's Encrypt)
- Set up **monitoring** and **backups**