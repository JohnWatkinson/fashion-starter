# Fashion Starter - Development Guide

## Quick Overview
This is a **Medusa 2.0** e-commerce project with a **Next.js** storefront. Think of it as:
- **Backend (Medusa)**: API server, admin dashboard, database
- **Frontend (Storefront)**: Customer-facing website
- **Supporting services**: PostgreSQL, Redis, MeiliSearch

## Development Setup

### Prerequisites
- Node.js >= 20
- Docker & Docker Compose
- Yarn (v4 for Medusa, v1 for Storefront)

### 1. Start Infrastructure
```bash
cd medusa
docker-compose up -d  # Starts PostgreSQL, Redis, MeiliSearch, MinIO
```

### 2. Backend (Medusa) - Terminal 1
```bash
cd medusa
yarn dev  # Runs on http://localhost:9000
```

### 3. Frontend (Storefront) - Terminal 2
```bash
cd storefront
yarn dev  # Runs on http://localhost:8000
```

## Key URLs
- **Storefront**: http://localhost:8000 (Customer site)
- **Admin**: http://localhost:9000/app (Backend admin)
- **API**: http://localhost:9000 (REST API)
- **MeiliSearch**: http://localhost:7700 (Search dashboard)

## Project Structure

```
fashion-starter/
├── medusa/          # Backend API & Admin
│   ├── src/
│   │   ├── modules/     # Custom modules (fashion, meilisearch, resend)
│   │   └── scripts/     # Seed data, utilities
│   ├── medusa-config.js # Main configuration
│   └── docker-compose.yml
├── storefront/      # Frontend website
│   ├── src/
│   │   ├── app/         # Next.js pages (App Router)
│   │   ├── components/  # Reusable UI components
│   │   ├── modules/     # Feature-specific components
│   │   └── lib/         # Utilities, API calls
│   └── tailwind.config.js
└── README-dev.md    # This file
```

## Development Workflow

### Making Changes
1. **Backend changes**: Edit files in `medusa/src/`, auto-reload enabled
2. **Frontend changes**: Edit files in `storefront/src/`, hot-reload enabled
3. **Styling**: Uses Tailwind CSS, changes reflect immediately

### Database Operations
```bash
cd medusa
yarn medusa db:migrate  # Run migrations
yarn seed              # Reset with sample data
```

### Admin Access
- URL: http://localhost:9000/app
- Create user: `yarn medusa user -e "admin@test.com" -p "password"`

### Common Tasks

#### Add Products
1. Go to admin → Products → Create
2. Add title, description, images
3. Set materials/colors (custom feature)
4. Assign to collections

#### Customize Appearance
- **Colors/Styles**: Edit `storefront/tailwind.config.js`
- **Components**: Files in `storefront/src/components/`
- **Pages**: Files in `storefront/src/app/`

#### Search Setup
1. Products auto-index to MeiliSearch
2. Get API key: `http GET localhost:7700/keys`
3. Update `NEXT_PUBLIC_SEARCH_API_KEY` in `storefront/.env.local`

## Useful Commands

### Medusa (Backend)
```bash
yarn build          # Build for production
yarn medusa --help  # See all CLI commands
```

### Storefront (Frontend)
```bash
yarn build          # Build for production
yarn lint           # Check code quality
yarn test-e2e       # Run end-to-end tests
```

### Docker
```bash
docker-compose ps           # Check running services
docker-compose logs -f      # View logs
docker-compose down         # Stop all services
```

## Key Concepts

### Materials & Colors System
- Products can have multiple materials (leather, fabric, etc.)
- Each material can have multiple colors
- Pricing varies by material/color combination
- Configured in Admin → Product Types

### Collections
- Group products together (sofas, chairs, etc.)
- Each has custom banner image and description
- Configured in Admin → Collections

### Next.js App Router
- File-based routing in `storefront/src/app/`
- Server components by default
- Client components marked with `'use client'`

## Development Tips

1. **Use the admin first** - Add products, collections before coding
2. **Check browser console** - React/Next.js errors show here
3. **Hot reload** - Save files to see changes instantly
4. **Database reset** - Run `yarn seed` if data gets messy
5. **Environment variables** - Don't commit real API keys to git

## Next Steps for Production
- [ ] Set up real Stripe keys
- [ ] Configure Resend for emails
- [ ] Add SSL certificate
- [ ] Set up production database
- [ ] Configure domain/hosting

---
*This is a development guide. See main README.md for full project info.*