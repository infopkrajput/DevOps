# Undoing Changes & Rollbacks

## 1. Discard Unstaged Changes
```bash
# Discard changes to specific file
git restore file.txt

# Discard all unstaged changes
git restore .
```
or

```bash
# Discard changes to specific file
git checkout file.txt

# Discard all unstaged changes
git checkout .
```

## 2. Unstage Files
```bash
# Unstaged any specific file
git restore --staged file.txt

# Unstaged all staged files
git restore --staged .
```

## 3. Amend Last Commit
This will include current changes in the last commit.
```bash
git commit --amend
# Will open editor to modify commit message
```

### ⚠️ Caution:
- Only use --amend if you haven’t pushed the commit yet.
- If you already pushed it to a remote repository (like GitHub), amending and pushing again can cause issues for others.

## 4. Reset to Previous Commit (DANGEROUS)
```bash
# Soft reset (keeps changes staged)
git reset --soft HEAD~1

# Mixed reset (keeps changes unstaged - default)
git reset HEAD~1

# Hard reset (DANGEROUS - discards all changes)
git reset --hard HEAD~1
```