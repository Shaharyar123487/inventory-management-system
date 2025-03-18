@echo off
echo Checking for Git installation...

:: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo Git is not installed on your system.
    echo.
    echo Installing Git:
    echo 1. Opening Git download page in your browser...
    start https://git-scm.com/download/win
    echo.
    echo 2. Download and install Git:
    echo    - Click "Click here to download"
    echo    - Run the downloaded installer
    echo    - Use default settings during installation
    echo    - After installation, close and reopen this script
    echo.
    echo 3. Once Git is installed, run this script again.
    echo.
    pause
    exit /b 1
)

echo Git is installed. Proceeding with setup...
echo.

:: Initialize git repository
git init

:: Add all files
git add .

:: Create initial commit
git commit -m "Initial commit"

echo.
echo Git repository initialized and files committed.
echo.
echo Opening GitHub in your browser...
echo 1. Sign in to GitHub if you haven't already
echo 2. Create a new repository:
echo    - Name: inventory-management-system
echo    - Description: Inventory Management System
echo    - Make it Public
echo    - Don't initialize with README (we already have one)
echo 3. After creating the repository, copy the repository URL
echo.
start https://github.com/new?name=inventory-management-system^&description=Inventory%20Management%20System^&public=true^&auto_init=false

echo.
echo Please paste your GitHub repository URL here:
set /p repo_url=

:: Add remote repository
git remote add origin %repo_url%

:: Push to GitHub
git push -u origin main

echo.
echo Done! Your code has been pushed to GitHub.
echo You can now use this repository for deployment to Glitch or Render.
echo.
pause 