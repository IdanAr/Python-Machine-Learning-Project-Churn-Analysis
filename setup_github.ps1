# ============================================================
# setup_github.ps1
# Run this script once to initialize git, commit all files,
# and push to a new public GitHub repository.
# ============================================================

$ErrorActionPreference = "Stop"
$repoName = "Python-Machine-Learning-Project-Churn-Analysis"
$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "==> Working directory: $projectDir" -ForegroundColor Cyan
Set-Location $projectDir

# --- Remove any stale .git folder from previous attempts ---
if (Test-Path ".git") {
    Write-Host "==> Removing existing .git folder..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".git"
}

# --- Init ---
Write-Host "==> Initializing git repository..." -ForegroundColor Cyan
git init
git branch -M main

# --- Identity (update if needed) ---
git config user.name "Idan Arbel"
git config user.email "idan.rbel@gmail.com"

# --- Stage & commit ---
Write-Host "==> Staging files..." -ForegroundColor Cyan
git add .
git status
git commit -m "Initial commit: Churn ML project - EDA, modelling, MongoDB integration"

Write-Host ""
Write-Host "==> Local commit done!" -ForegroundColor Green
Write-Host ""

# --- Create GitHub repo and push (requires GitHub CLI: gh) ---
$ghAvailable = $null
try { $ghAvailable = Get-Command gh -ErrorAction Stop } catch {}

if ($ghAvailable) {
    Write-Host "==> Creating public GitHub repository '$repoName'..." -ForegroundColor Cyan
    gh repo create $repoName --public --description "Machine Learning churn prediction project for Telco customers. EDA, Decision Tree, Random Forest, KNN, MongoDB integration." --source . --remote origin --push
    Write-Host ""
    Write-Host "==> Done! Repository pushed to GitHub." -ForegroundColor Green
    Write-Host "    URL: https://github.com/$(gh api user --jq .login)/$repoName" -ForegroundColor Green
} else {
    Write-Host "==> GitHub CLI (gh) not found. Pushing manually..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please create the repository manually at:" -ForegroundColor Yellow
    Write-Host "  https://github.com/new" -ForegroundColor White
    Write-Host "  Name: $repoName" -ForegroundColor White
    Write-Host "  Visibility: Public" -ForegroundColor White
    Write-Host "  Do NOT initialize with README, .gitignore or license." -ForegroundColor White
    Write-Host ""
    Write-Host "Then run these two commands in this folder:" -ForegroundColor Yellow
    Write-Host "  git remote add origin https://github.com/idanarbel/$repoName.git" -ForegroundColor White
    Write-Host "  git push -u origin main" -ForegroundColor White
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
