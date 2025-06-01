#!/bin/bash

read -p "Enter the name: " name
read -p "Enter the age: " age
read -p "Is $name a citizen of India (yes/no): " citizen

if [ "$age" -ge 18 ]; then
  if [ "$citizen" = "yes" ]; then
    echo "You can vote."
  else
    echo "You are not a citizen of India, so you cannot vote."
  fi
else
  echo "Your age is below 18, so you cannot vote."
fi
