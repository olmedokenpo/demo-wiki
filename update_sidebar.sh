#!/bin/bash

sidebar_file="_Sidebar.md"
> "$sidebar_file"

echo "# PROPAMAP Users' Manual" >> "$sidebar_file"

if [ -f "01-home/Home.md" ]; then
  echo "- [Home](Home)" >> "$sidebar_file"
  echo "" >> "$sidebar_file"
fi

subdirs=$(find . -mindepth 1 -maxdepth 1 -type d -name "[0-9]*" | sort)

for subdir in $subdirs; do
  if [[ $(basename "$subdir") == "01-home" ]]; then
    continue
  fi

  subdir_name=$(basename "$subdir")
  subdir_title=$(echo "$subdir_name" | sed -E 's/^[0-9]+-//g' | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')
  echo "# ${subdir_title}" >> "$sidebar_file"

  files=$(find "$subdir" -maxdepth 1 -type f -name "[0-9]*.md" | sort)

  while IFS= read -r file; do
    filename_with_prefix=$(basename "$file" .md)
    filename=$(echo "$filename_with_prefix" | sed -E 's/^[0-9]+-//g')
    display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')
    echo "- [${display_name}](${filename})" >> "$sidebar_file"
  done <<< "$files"

  echo "" >> "$sidebar_file"
done

