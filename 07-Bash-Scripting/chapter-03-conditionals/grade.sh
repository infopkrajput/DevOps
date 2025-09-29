#!/bin/bash

read -p "Enter the name : " name

read -p "Enter marks : " marks

if [ $marks -ge 90 ]; then
  echo "$name You got Grade A"
elif [ $marks -ge 70 ]; then
  echo "$name You got Grade B"
else
  echo "$name You got Grade C"
fi
  
