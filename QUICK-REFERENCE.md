# GitHub Quick Reference

## Method 1: Automated Setup (Easiest)

### Mac/Linux:
```bash
./setup-github.sh
```

### Windows:
```batch
setup-github.bat
```

---

## Method 2: Manual Setup (Copy & Paste)

### 1. Create Repository on GitHub
Go to: https://github.com/new
- Name: `dealer-connect-portal`
- **DO NOT** check "Initialize with README"
- Click "Create repository"

### 2. Push Your Code (Replace YOUR_USERNAME)
```bash
cd /mnt/user-data/outputs

git init
git add .
git commit -m "Initial commit: Dealer Connect portal with Express API backend"
git remote add origin https://github.com/YOUR_USERNAME/dealer-connect-portal.git
git branch -M main
git push -u origin main
```

---

## Method 3: Using GitHub CLI

```bash
cd /mnt/user-data/outputs

# Login (first time only)
gh auth login

# Create and push in one command
git init
git add .
git commit -m "Initial commit: Dealer Connect portal with Express API backend"
gh repo create dealer-connect-portal --public --source=. --remote=origin --push
```

---

## After Repository is Created

### Clone to Another Machine
```bash
git clone https://github.com/YOUR_USERNAME/dealer-connect-portal.git
cd dealer-connect-portal
npm install
node server.js
```

### View on GitHub
```
https://github.com/YOUR_USERNAME/dealer-connect-portal
```

---

## Common Git Commands

### Check Status
```bash
git status
```

### Make Changes and Push
```bash
git add .
git commit -m "Description of changes"
git push
```

### Pull Latest Changes
```bash
git pull
```

### View Commit History
```bash
git log --oneline
```

### Create a Branch
```bash
git checkout -b feature-name
git push -u origin feature-name
```

---

## Troubleshooting

### "Authentication failed"
Use a Personal Access Token:
1. Go to: https://github.com/settings/tokens
2. Generate new token (classic)
3. Select scopes: `repo`
4. Use token as password when pushing

### "Repository not found"
Make sure you created the repository on GitHub first!

### "Permission denied"
Check that you have write access to the repository

---

## Files Included in Repository

✅ Server code: `server.js`
✅ Frontend: `dealer-connect.html`  
✅ Dependencies: `package.json`
✅ Data files: `data/*.json`
✅ Documentation: `README.md`
✅ Git config: `.gitignore`

---

## Repository URL Format

```
https://github.com/YOUR_USERNAME/dealer-connect-portal
```

Replace `YOUR_USERNAME` with your actual GitHub username!
