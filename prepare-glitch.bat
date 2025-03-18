@echo off
echo Preparing application for Glitch deployment...

:: Create deployment directory
mkdir glitch_temp

:: Copy necessary files
xcopy /E /I /Y "public" "glitch_temp\public"
xcopy /E /I /Y "prisma" "glitch_temp\prisma"
xcopy /E /I /Y "routes" "glitch_temp\routes"
xcopy /E /I /Y "utils" "glitch_temp\utils"
xcopy /E /I /Y "views" "glitch_temp\views"
copy "package.json" "glitch_temp\"
copy "package-lock.json" "glitch_temp\"
copy "server.js" "glitch_temp\"
copy "glitch.json" "glitch_temp\"
copy ".env.example" "glitch_temp\.env"

:: Create zip file
powershell Compress-Archive -Path "glitch_temp\*" -DestinationPath "glitch_temp.zip" -Force

echo.
echo Deployment package created successfully!
echo.
echo Next steps:
echo 1. Go to https://glitch.com
echo 2. Sign up or log in
echo 3. Click "New Project" and select "Import from GitHub"
echo 4. Select your repository: inventory-management-system
echo 5. Once imported, click on "Tools" and select "Terminal"
echo 6. Run these commands in the terminal:
echo    npm install
echo    npx prisma generate
echo    npx prisma db push
echo 7. Add your environment variables in the .env file
echo 8. Click "Share" to get your project URL
echo.
pause 