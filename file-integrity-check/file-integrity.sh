#!/bin/bash

# This script does-

# 1. Initialize a directory and its files with cryptographic hashing [SHA-256]
# 2. Check if the Hash for a given file matches with existing hash [ie check tampered/corrupted of a file]
# 3. Update the Hash for existing file which is hashed previously



init(){

  echo "-----------------------------------"
  echo "    Initializing the HASH          "
  echo "-----------------------------------"


  # checking if the input filename is directory
  if ! [ -d "$file_name" ]; then
    echo "'$file_name' is not a directory."
    exit 1
  fi

  # Creating hash for each file in a directory
  for file in "$file_name"/* ; do
    echo "Hashing file: $file"
    shasum $file >> hashes.txt
  done

  echo "Hashes stored successfully."


}

check(){

  echo "-----------------------------------"
  echo "    Checking the HASH          "
  echo "-----------------------------------"

  # checking if the input filename is file
  if ! [ -f "$file_name" ]; then
    echo "'$file_name' is not a file."
    exit 1
  fi

  # Get the Hash for input file from saved file
  STORED_HASH=$(grep $file_name  hashes.txt | awk '{print $1}')

  # Get the Hash for input file using SHASUM
  CALCULATED_HASH=$(shasum $file_name | awk '{print $1}')

  # echo "$STORED_HASH"
  # echo "$CALCULATED_HASH"

  # Compare the two hashes
  if [[ "$STORED_HASH" == "$CALCULATED_HASH" ]]; then

      echo "Status: ✅ Unmodified"
  else
      echo "Status: ❌ Modified (Hash mismatch)"
      echo "Reporting the file since Hash mismatched..."
  fi

    
}

update(){

  echo "-----------------------------------"
  echo "    Updating the HASH          "
  echo "-----------------------------------"
    
}


# The main execution part of the script

# Check if the correct number of parameters were passed to the script
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 action filename"
    exit 1
fi

# Assign the parameters to variables for clarity
action=$1
file_name=$2

# Use a 'case' statement or 'if' statement to call the specified function
case "$action" in
    init)
        init "$file_name"
        ;;

    check)
        check "$file_name"
        ;;

    update)
        update "$file_name"
        ;;

    *)
        echo "Error: Unknown function '$action'"
        exit 1
        ;;
esac



