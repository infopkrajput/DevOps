Nice! You're moving fast, Pushpendra. 🔥  
Here’s your **`chapter-03-conditionals.md`** file for Chapter 3: Conditional Statements.

---

### 📘 `chapter-03-conditionals.md`

# Chapter 3 - Conditional Statements

---

## 🔹 if-else Statement

Basic structure:

```bash
if [ condition ]; then
  # commands
else
  # commands
fi
```

Example:

```bash
num=10

if [ $num -gt 5 ]; then
  echo "Number is greater than 5"
else
  echo "Number is 5 or less"
fi
```

---

## 🔹 elif (else-if) Statement

Used for multiple conditions:

```bash
marks=85

if [ $marks -ge 90 ]; then
  echo "Grade A"
elif [ $marks -ge 75 ]; then
  echo "Grade B"
else
  echo "Grade C or below"
fi
```

---

## 🔹 Comparison Operators

### 🧮 Integer Comparison

| Operator | Meaning             |
|----------|---------------------|
| `-eq`    | equal to            |
| `-ne`    | not equal to        |
| `-gt`    | greater than        |
| `-lt`    | less than           |
| `-ge`    | greater or equal to |
| `-le`    | less or equal to    |

Example:
```bash
if [ $a -gt 5 ]; then
  echo "a is greater than 5"
fi
```

---

### 🔠 String Comparison

| Operator | Meaning             |
|----------|---------------------|
| `=`      | equal to            |
| `!=`     | not equal to        |
| `-z`     | string is empty     |
| `-n`     | string is not empty |

Example:
```bash
if [ "$name" = "Pushpendra" ]; then
  echo "Welcome, Pushpendra!"
fi
```

---

### 📁 File Tests

| Operator | Checks if...           |
|----------|------------------------|
| `-e`     | file exists            |
| `-f`     | regular file           |
| `-d`     | directory              |
| `-r`     | readable               |
| `-w`     | writable               |
| `-x`     | executable             |

Example:

```bash
if [ -d "/etc" ]; then
  echo "/etc is a directory"
fi
```

---

## 🔹 Nested Conditions

```bash
if [ $age -ge 18 ]; then
  if [ $citizen = "yes" ]; then
    echo "You can vote"
  fi
fi
```

---

## ✅ Practice Tasks

1. Write a script `grade.sh` that takes marks as input and prints Grade A/B/C.
2. Write a script `filecheck.sh` that checks if a file exists and whether it’s readable and writable.
3. Write a script to check whether a number is even or odd.
