# Basic Commands

## Core Git Commands Every Developer Should Know

### 1. `git init` - Initialize a Repository
Creates a new Git repository in your current directory.

```bash
# Create a new project directory
mkdir my-project
cd my-project

# Initialize Git repository
git init
```

What happens:
- Creates a hidden `.git` directory that stores all version control data
- Sets up the basic Git structure for your project
- Prepares the directory to start tracking file changes

### 2. `git status` - Check Repository Status
Shows the current state of your working directory and staging area.

```bash
git status
```

Example output:
```
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md
        index.html

nothing added to commit but untracked files present (use "git add" to track)
```

Key information:
- Which branch you're on
- Changes staged for commit
- Changes not staged for commit
- Untracked files

### 3. `git add` - Stage Changes
Prepares changes to be committed.

```bash
# Stage a specific file
git add README.md

# Stage all changes in current directory
git add .

# Stage all .js files
git add *.js
```

What it does:
- Moves changes from working directory to staging area
- Allows you to selectively choose which changes to commit

### 4. `git commit` - Save Changes
Records your staged changes in the repository history.

```bash
# Basic commit with message
git commit -m "Add initial project files"

# Commit with multi-line message (opens editor)
git commit
```

Best practices:
- Make commits atomic (one logical change per commit)
- Write clear, descriptive commit messages
- Commit often to create a detailed history

### 5. `git log` - View Commit History
Shows the commit history of your repository.

```bash
# Basic log
git log

# One-line format
git log --oneline

# Show changes in each commit
git log -p

# Filter by number of commits
git log -n 3
```

Example output (--oneline):
```
d3b0738 (HEAD -> main) Update README with installation
0a1b2c3 Add initial project structure
```

### 6. `git diff` - View Changes
Shows differences between versions.

```bash
# Show unstaged changes
git diff

# Show staged changes
git diff --staged

# Compare with last commit
git diff HEAD
```

Example output:
```
diff --git a/README.md b/README.md
index 1234567..89abcde 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,3 @@
 # My Project
+
+This project demonstrates basic Git usage.
```

---

<div style="display: flex; justify-content: space-between; margin-top: 2rem;">
  <a href="git-installation-configuration.md" style="padding: 8px 16px; background-color: #f0f0f0; color: #333; text-decoration: none; border-radius: 4px;">← Previous: Installation & Configuration</a>
  <a href="./04-Branching-Basics.md" style="padding: 8px 16px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 4px;">Next: Branching Basics →</a>
</div>