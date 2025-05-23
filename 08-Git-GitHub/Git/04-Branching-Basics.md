# Branching Basics

Branches allow you to develop features, fix bugs, or safely experiment with new ideas in isolated environments without affecting the main codebase.

## Key Branching Concepts:
- **Main branch**: Default branch (traditionally called `master`, now often `main`)
- **Feature branches**: Temporary branches for new features
- **Isolation**: Changes in one branch don't affect others until merged

## Essential Branching Commands

### 1. `git branch` - List/Create Branches

```bash
# List all local branches
git branch

# Create a new branch
git branch feature/login

# List all branches (local and remote)
git branch -a
```

### 2. `git checkout` - Switch Branches

```bash
# Switch to an existing branch
git checkout feature/login

# Create and switch to new branch (shortcut)
git checkout -b feature/checkout
```

### 3. `git merge` - Combine Branches

```bash
# First switch to the target branch
git checkout main

# Merge changes from feature branch
git merge feature/login
```

### 4. `git switch` - Newer Way to Change Branches (Git 2.23+)

```bash
# Switch to existing branch
git switch main

# Create and switch to new branch
git switch -c hotfix/bug-123
```

## Common Branching Workflow

1. Start from updated main branch:
```bash
git checkout main
```

2. Create feature branch:
```bash
git checkout -b feature/new-button
```

3. Make changes and commit:
```bash
git add .
git commit -m "Add new submit button"
```

4. Merge back to main:
```bash
git checkout main
git merge feature/new-button
```

## Viewing Branch Structure

Visualize your branch history:
```bash
git log --oneline --graph --all
```

Example output:
```
* 1a2b3c4 (feature/new-button) Add new submit button
| * 4d5e6f7 (hotfix/bug-123) Fix login error
|/
* 7g8h9i0 (main) Initial commit
```

## Deleting Branches

```bash
# Delete local branch (safe - won't delete if unmerged)
git branch -d feature/login

# Force delete local branch
git branch -D feature/experimental

```

---

<div style="display: flex; justify-content: space-between; margin-top: 2rem;">
  <a href="basic-commands.md" style="padding: 8px 16px; background-color: #f0f0f0; color: #333; text-decoration: none; border-radius: 4px;">← Previous: Basic Commands</a>
  <a href="remote-repositories.md" style="padding: 8px 16px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 4px;">Next: Remote Repositories →</a>
</div>
