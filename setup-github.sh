#!/bin/bash

# Dealer Connect - GitHub Repository Setup Script
# This script helps you quickly set up and push to GitHub

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║                                                           ║"
echo "║  Dealer Connect - GitHub Repository Setup                ║"
echo "║                                                           ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first:"
    echo "   https://git-scm.com/downloads"
    exit 1
fi

echo "✓ Git is installed"
echo ""

# Get GitHub username
read -p "Enter your GitHub username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ GitHub username cannot be empty"
    exit 1
fi

# Get repository name (with default)
read -p "Enter repository name (default: dealer-connect-portal): " REPO_NAME
REPO_NAME=${REPO_NAME:-dealer-connect-portal}

echo ""
echo "Repository will be created at:"
echo "https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""

# Confirm
read -p "Continue? (y/n): " CONFIRM
if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "Setup cancelled"
    exit 0
fi

echo ""
echo "Setting up Git repository..."
echo ""

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    git init
    echo "✓ Git repository initialized"
else
    echo "✓ Git repository already initialized"
fi

# Add all files
git add .
echo "✓ Files staged"

# Create initial commit
git commit -m "Initial commit: Dealer Connect portal with Express API backend"
echo "✓ Initial commit created"

# Add remote
REMOTE_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# Remove existing origin if it exists
git remote remove origin 2>/dev/null

git remote add origin $REMOTE_URL
echo "✓ Remote added: $REMOTE_URL"

# Rename branch to main
git branch -M main
echo "✓ Branch renamed to main"

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║                                                           ║"
echo "║  Ready to Push!                                           ║"
echo "║                                                           ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""
echo "⚠️  IMPORTANT: Before pushing, create the repository on GitHub:"
echo ""
echo "1. Go to: https://github.com/new"
echo "2. Repository name: $REPO_NAME"
echo "3. Choose Public or Private"
echo "4. DO NOT initialize with README"
echo "5. Click 'Create repository'"
echo ""
read -p "Press Enter when repository is created on GitHub..."

echo ""
echo "Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║                                                           ║"
    echo "║  ✅ SUCCESS!                                              ║"
    echo "║                                                           ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo ""
    echo "🎉 Your repository is now live at:"
    echo "   https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo ""
    echo "To clone and run elsewhere:"
    echo "   git clone https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    echo "   cd $REPO_NAME"
    echo "   npm install"
    echo "   node server.js"
    echo ""
else
    echo ""
    echo "❌ Push failed. Common issues:"
    echo ""
    echo "1. Authentication failed:"
    echo "   - Use a Personal Access Token instead of password"
    echo "   - Generate one at: https://github.com/settings/tokens"
    echo ""
    echo "2. Repository doesn't exist:"
    echo "   - Make sure you created it on GitHub first"
    echo ""
    echo "3. Permission denied:"
    echo "   - Check if you have write access to the repository"
    echo ""
fi
