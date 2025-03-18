@echo off
echo Starting the application...

:: Check if node_modules exists
if not exist "node_modules" (
    echo Installing dependencies...
    call npm install
)

:: Generate Prisma client
echo Generating Prisma client...
call npm run prisma:generate

:: Run Prisma migrations
echo Running database migrations...
call npm run prisma:migrate

:: Start the application in a new window
echo Starting the server...
start cmd /k "npm start"

:: Wait for server to start
timeout /t 5 /nobreak

:: Open browser
echo Opening browser...
start http://localhost:3000

pause 