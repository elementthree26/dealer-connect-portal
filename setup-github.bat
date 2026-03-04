@echo off
setlocal enabledelayedexpansion

echo ===============================================================
echo.
echo   Dealer Connect - GitHub Repository Setup
echo.
echo ===============================================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo [X] Git is not installed. Please install Git first:
    echo     https://git-scm.com/downloads
    pause
    exit /b 1
)

echo [OK] Git is installed
echo.

REM Get GitHub username
set /p GITHUB_USERNAME="Enter your GitHub username: "

if "!GITHUB_USERNAME!"=="" (
    echo [X] GitHub username cannot be empty
    pause
    exit /b 1
)

REM Get repository name
set /p REPO_NAME="Enter repository name (default: dealer-connect-portal): "
if "!REPO_NAME!"=="" set REPO_NAME=dealer-connect-portal

echo.
echo Repository will be created at:
echo https://github.com/!GITHUB_USERNAME!/!REPO_NAME!
echo.

set /p CONFIRM="Continue? (y/n): "
if /i not "!CONFIRM!"=="y" (
    echo Setup cancelled
    pause
    exit /b 0
)

echo.
echo Setting up Git repository...
echo.

REM Initialize git if not already initialized
if not exist ".git" (
    git init
    echo [OK] Git repository initialized
) else (
    echo [OK] Git repository already initialized
)

REM Add all files
git add .
echo [OK] Files staged

REM Create initial commit
git commit -m "Initial commit: Dealer Connect portal with Express API backend"
echo [OK] Initial commit created

REM Add remote
set REMOTE_URL=https://github.com/!GITHUB_USERNAME!/!REPO_NAME!.git

REM Remove existing origin if it exists
git remote remove origin >nul 2>&1

git remote add origin !REMOTE_URL!
echo [OK] Remote added: !REMOTE_URL!

REM Rename branch to main
git branch -M main
echo [OK] Branch renamed to main

echo.
echo ===============================================================
echo.
echo   Ready to Push!
echo.
echo ===============================================================
echo.
echo IMPORTANT: Before pushing, create the repository on GitHub:
echo.
echo 1. Go to: https://github.com/new
echo 2. Repository name: !REPO_NAME!
echo 3. Choose Public or Private
echo 4. DO NOT initialize with README
echo 5. Click 'Create repository'
echo.
pause

echo.
echo Pushing to GitHub...
git push -u origin main

if errorlevel 1 (
    echo.
    echo [X] Push failed. Common issues:
    echo.
    echo 1. Authentication failed:
    echo    - Use a Personal Access Token instead of password
    echo    - Generate one at: https://github.com/settings/tokens
    echo.
    echo 2. Repository doesn't exist:
    echo    - Make sure you created it on GitHub first
    echo.
    echo 3. Permission denied:
    echo    - Check if you have write access to the repository
    echo.
    pause
    exit /b 1
)

echo.
echo ===============================================================
echo.
echo   SUCCESS!
echo.
echo ===============================================================
echo.
echo Your repository is now live at:
echo    https://github.com/!GITHUB_USERNAME!/!REPO_NAME!
echo.
echo To clone and run elsewhere:
echo    git clone https://github.com/!GITHUB_USERNAME!/!REPO_NAME!.git
echo    cd !REPO_NAME!
echo    npm install
echo    node server.js
echo.
pause
