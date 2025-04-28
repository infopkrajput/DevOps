# 📘 Chapter 1 - Introduction and Basics

## 🔹 What is Shell and Bash?

- **Shell** is a command-line interface that lets users interact with the OS.
- **Bash (Bourne Again SHell)** is the most popular Unix shell used in Linux.

```bash
echo "Hello, Bash!"
```

---

## 🔹 Running Your First Bash Script

1. Create a file:
```bash
nano hello.sh
```

2. Add this content:
```bash
#!/bin/bash
echo "Welcome to Bash Scripting!"
```

3. Save and exit (`Ctrl+O`, `Enter`, then `Ctrl+X`).

---

## 🔹 Shebang (`#!/bin/bash`)

- The **shebang** at the top of the script tells the system which interpreter to use.

Example:
```bash
#!/bin/bash
```

---

## 🔹 Making Scripts Executable

To run a script directly:
```bash
chmod +x hello.sh
./hello.sh
```

You can also run without making executable:
```bash
bash hello.sh
```

---

## 🔹 Running Scripts in Different Ways

```bash
./script.sh     # If script is executable
bash script.sh  # Using bash explicitly
sh script.sh    # Using sh shell (may not support all bash features)
```

---

## 🔹 Comments in Bash

- Use `#` for single-line comments.

```bash
# This is a comment
echo "This line will execute"
```

---

## ✅ Practice Tasks

1. Create a script named `greet.sh` that prints:
   ```
   Hello, My name is Pushpendra Kumar!
   ```

2. Make it executable and run it.

---

## 📝 Mini Quiz

**Q1.** What does `#!/bin/bash` mean in a script?  
**Q2.** How do you make a script executable?  
**Q3.** Write a one-line bash command to print your current username.

---

Let me know once you're done with this chapter. Then I’ll share `chapter-02-variables.md`. Happy scripting! 🚀