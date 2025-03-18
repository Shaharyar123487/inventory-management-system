@echo off
echo ===================================================
echo        INVENTORY MANAGEMENT SYSTEM CLEANUP
echo ===================================================
echo.
echo This will delete:
echo  - node_modules (all dependencies)
echo  - .next (build files)
echo  - prisma/dev.db (database)
echo  - public/uploads/* (uploaded files)
echo  - public/downloads/* (downloadable files)
echo  - backups/* (database backups)
echo.
echo All data will be lost!
echo.

set /p confirm=Are you sure you want to continue? (y/n): 
if /i not "%confirm%"=="y" (
    echo.
    echo Cleanup cancelled.
    exit /b
)

echo.
echo Cleaning up...

:: Stop any running Node.js processes
taskkill /f /im node.exe >nul 2>&1

:: Remove node_modules
if exist node_modules (
    echo Removing node_modules...
    rmdir /s /q node_modules
)

:: Remove .next folder
if exist .next (
    echo Removing .next folder...
    rmdir /s /q .next
)

:: Remove database
if exist prisma\dev.db (
    echo Removing database...
    del /f /q prisma\dev.db
)

:: Clean uploads directory
if exist public\uploads (
    echo Cleaning uploads directory...
    del /f /q public\uploads\* 2>nul
)

:: Clean downloads directory
if exist public\downloads (
    echo Cleaning downloads directory...
    del /f /q public\downloads\* 2>nul
)

:: Clean backups directory
if exist backups (
    echo Cleaning backups directory...
    del /f /q backups\* 2>nul
)

echo.
echo Cleanup completed successfully!
echo.
echo You can now run launch-app.bat to set up the application again.
echo.
pause

echo Cleaning up deployment files...

:: Remove deployment files
if exist "deploy_temp.zip" del /F /Q "deploy_temp.zip"
if exist "glitch_temp.zip" del /F /Q "glitch_temp.zip"
if exist "deploy_temp" rmdir /S /Q "deploy_temp"
if exist "glitch_temp" rmdir /S /Q "glitch_temp"
if exist "prepare-deploy.bat" del /F /Q "prepare-deploy.bat"
if exist "prepare-glitch.bat" del /F /Q "prepare-glitch.bat"
if exist "setup-database.bat" del /F /Q "setup-database.bat"
if exist "glitch.json" del /F /Q "glitch.json"
if exist "render.yaml" del /F /Q "render.yaml"

:: Create .gitignore file
echo Creating .gitignore file...
(
echo node_modules/
echo .env
echo *.log
echo deploy_temp.zip
echo glitch_temp.zip
echo deploy_temp/
echo glitch_temp/
echo .DS_Store
echo Thumbs.db
) > .gitignore

:: Create README.md
echo Creating README.md...
(
echo # Inventory Management System
echo.
echo A comprehensive inventory management system built with Node.js, Express, and Prisma.
echo.
echo ## Features
echo.
echo - User authentication with JWT
echo - Dashboard with key statistics
echo - Sales management
echo - Inventory tracking
echo - Customer management
echo - Worker management
echo - Supplier management
echo - Reports and analytics
echo - Print functionality for reports
echo - CSV export for data
echo.
echo ## Tech Stack
echo.
echo - Node.js
echo - Express.js
echo - Prisma ORM
echo - SQLite
echo - EJS Templates
echo - Bootstrap 5
echo - JWT Authentication
echo.
echo ## Setup Instructions
echo.
echo 1. Clone the repository
echo 2. Install dependencies:
echo    ```bash
echo    npm install
echo    ```
echo 3. Set up the database:
echo    ```bash
echo    npm run prisma:generate
echo    npm run prisma:migrate
echo    ```
echo 4. Start the application:
echo    ```bash
echo    npm start
echo    ```
echo.
echo ## Default Login
echo.
echo - Username: admin
echo - Password: admin123
echo.
echo ## Environment Variables
echo.
echo Create a `.env` file with the following variables:
echo.
echo ```env
echo DATABASE_URL="file:./dev.db"
echo JWT_SECRET="your-secret-key"
echo NODE_ENV="development"
echo PORT=3000
echo ```
echo.
echo ## License
echo.
echo ISC
) > README.md

echo.
echo Project cleaned up and prepared for GitHub.
echo.
echo Next steps:
echo 1. Create a new repository on GitHub
echo 2. Initialize git and push your code:
echo    git init
echo    git add .
echo    git commit -m "Initial commit"
echo    git remote add origin YOUR_GITHUB_REPO_URL
echo    git push -u origin main
echo.
pause 