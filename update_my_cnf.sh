#!/bin/bash

# Define the path to the my.cnf file
MY_CNF="/etc/sohag/my.cnf"

# Define the section or keyword to search for
SEARCH_TERM="[mysqld]"

# Define the new line to add
NEW_LINE=" sql mode = "" "


# Check if the file exists
if [[ -f "$MY_CNF" ]]; then
    # Check if the SEARCH_TERM exists in the file
    if grep -q "$SEARCH_TERM" "$MY_CNF"; then
        # Add the new line under the SEARCH_TERM
        sed -i "/$SEARCH_TERM/a $NEW_LINE" "$MY_CNF"
	
        echo "Updated $MY_CNF with '$NEW_LINE' under '$SEARCH_TERM'."
    else
        echo "Section '$SEARCH_TERM' not found in $MY_CNF. Adding it."
        # If the section doesn't exist, append it to the file
        echo -e "\n$SEARCH_TERM\n$NEW_LINE" >> "$MY_CNF"
        echo "Added new section and line to $MY_CNF."
    fi
else
    echo "File $MY_CNF does not exist. Please check the path."
fi