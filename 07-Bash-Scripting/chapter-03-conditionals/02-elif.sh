#!/bin/bash

marks=70

if [ $marks -ge 90 ]; then
  echo "Grade A"
elif [ $marks -ge 75 ]; then
  echo "Grade B"
else
  echo "Grade C"
fi
