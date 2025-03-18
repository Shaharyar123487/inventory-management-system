# Inventory Management System

A comprehensive inventory management system built with Node.js, Express, and Prisma.

## Features

- User authentication with JWT
- Dashboard with key statistics
- Sales management
- Inventory tracking
- Customer management
- Worker management
- Supplier management
- Reports and analytics
- Print functionality for reports
- CSV export for data

## Tech Stack

- Node.js
- Express.js
- Prisma ORM
- SQLite
- EJS Templates
- Bootstrap 5
- JWT Authentication

## Setup Instructions

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```
3. Set up the database:
   ```bash
   npm run prisma:generate
   npm run prisma:migrate
   ```
4. Start the application:
   ```bash
   npm start
   ```

## Default Login

- Username: admin
- Password: admin123

## Environment Variables

Create a `.env` file with the following variables:

```env
DATABASE_URL="file:./dev.db"
JWT_SECRET="your-secret-key"
NODE_ENV="development"
PORT=3000
```

## License

ISC
