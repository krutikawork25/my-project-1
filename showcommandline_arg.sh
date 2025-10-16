#!/bin/bash

# Check if exactly 4 arguments are passed
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 name surname place gender "
    exit 1
fi

echo "You passed 5 arguments: $1, $2, $3, $4 $5"
echo

# Accept details from user
#read -p "Enter your name: " name
#read -p "Enter your surname: " surname
#read -p "Enter your place: " place
#read -sp "Enter your password: " password
#echo
#read -sp "Confirm your password: " confirm_password
#echo
#read -p "Enter your gender (M/F/O): " gender

# Check if passwords match
#if [ "$password" != "$confirm_password" ]; then
  #  echo "❌ Passwords do not match. Try again."
   # exit 1
#fi

# Display all details
echo
echo "✅ User details collected successfully!"
echo "---------------------------------------"
echo "Name      : $1"
echo "Surname   : $2"
echo "Place     : $3"
echo "Gender    : $4"
echo "Password  : $5"
