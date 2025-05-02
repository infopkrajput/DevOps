Great going, Pushpendra! 🚀  
Here’s the next file **`chapter-02-variables.md`** for Chapter 2: Variables and User Input.

---

### 📘 `chapter-02-variables.md`

# Chapter 2 - Variables and User Input

---

## 🔹 Creating and Using Variables

- In Bash, variables are created without any keyword.
- No space between the variable name, `=`, and value.

```bash
name="Pushpendra"
echo "My name is $name"
```

---

## 🔹 System-Defined Variables

Some variables are already set by the system:

| Variable | Description |
|:---------|:------------|
| `$HOME`  | Home directory path |
| `$USER`  | Current logged-in username |
| `$PWD`   | Current working directory |
| `$HOSTNAME` | System’s hostname |

Example:

```bash
echo "You are logged in as $USER"
echo "Your home directory is $HOME"
```

---

## 🔹 Reading User Input

Use the `read` command:

```bash
#!/bin/bash

echo "Enter your name:"
read username
echo "Welcome, $username!"
```

- You can also read without showing input (good for passwords):
  
```bash
read -sp "Enter your password: " userpass
echo
echo "Password has been recorded."
```

---

## 🔹 Command Substitution

You can store the output of a command in a variable:

```bash
today=$(date)
echo "Today's date is: $today"
```

Or using backticks (older method):

```bash
today=`date`
```

*(Recommended to use `$(command)` syntax.)*

---

## ✅ Practice Tasks

1. Create a script `userinfo.sh` that asks for your **Name**, **Age**, and **City** and then prints them nicely.
   
Example:
```
Enter your Name: Pushpendra
Enter your Age: 25
Enter your City: Lucknow

Hello Pushpendra, you are 25 years old and live in Lucknow.
```

2. Write a script to display your system’s hostname and current working directory using system variables.
