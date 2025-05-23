# Undoing Changes & Rollbacks

## 1. Discard Unstaged Changes
```bash
# Discard changes to specific file
git restore file.txt

# Discard all unstaged changes
git restore .
```

## 2. Unstage Files
```bash
git restore --staged file.txt
```

## 3. Amend Last Commit
```bash
git commit --amend
# Will open editor to modify commit message
```

## 4. Reset to Previous Commit (DANGEROUS)
```bash
# Soft reset (keeps changes staged)
git reset --soft HEAD~1

# Mixed reset (keeps changes unstaged - default)
git reset HEAD~1

# Hard reset (DANGEROUS - discards all changes)
git reset --hard HEAD~1
```

## 5. Revert a Commit (Safe Alternative)
```bash
git revert <commit-hash>
# Creates new commit undoing the changes
```

## Stashing Changes
Temporarily save uncommitted work:

```bash
# Stash changes
git stash

# List stashes
git stash list

# Apply last stash
git stash apply

# Apply specific stash
git stash apply stash@{1}

# Create a named stash
git stash push -m "Work in progress"
```

## Tagging Important Versions
Mark specific points in history:

```bash
# Create lightweight tag
git tag v1.0

# Create annotated tag
git tag -a v1.1 -m "Version 1.1 release"

# List tags
git tag

# Show tag details
git show v1.0
```
