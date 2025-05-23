# Git Learning Roadmap - Installation & Configuration

## Table of Contents
1. [Installing Git](#installing-git)
2. [Initial Configuration](#initial-configuration)
3. [Checking Your Setup](#checking-your-setup)
4. [Getting Help](#getting-help)

## Installing Git

### Windows
1. Download the installer from [git-scm.com](https://git-scm.com/download/win)
2. Run the installer with default options (recommended)
3. Verify installation:
```bash
git --version
```

### macOS
#### Using Homebrew:
```bash
brew install git
```

#### Or download from:
[git-scm.com/download/mac](https://git-scm.com/download/mac)

### Linux (Debian/Ubuntu)
```bash
sudo apt-get update
sudo apt-get install git
```

## Initial Configuration

Set up your identity (required before making commits):
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Common configuration options:
```bash
# Set default editor (VSCode example)
git config --global core.editor "code --wait"

# Enable colorful output
git config --global color.ui true

# Set default branch name to 'main'
git config --global init.defaultBranch main
```

View your configuration:
```bash
git config --list
```

## Checking Your Setup
Verify everything is working:
```bash
git --version
git config --get user.name
git config --get user.email
```

## Getting Help
Git has excellent built-in documentation:
```bash
# General help
git help

# Help on specific command
git help <command>
# Example:
git help commit
```

---

<div style="display: flex; justify-content: space-between; margin-top: 2rem;">
  <a href="./01-Introduction.md" style="padding: 8px 16px; background-color: #f0f0f0; color: #333; text-decoration: none; border-radius: 4px;">← Previous: Introduction</a>
  <a href="./03-Basic-Commands.md" style="padding: 8px 16px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 4px;">Next: Basic Commands →</a>
</div>
