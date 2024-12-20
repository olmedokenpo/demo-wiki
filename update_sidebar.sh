#!/bin/bash 

sidebar_file="_Sidebar.md"

# Desired order for the subdirectories
declare -a subdir_order=("introduction" "main-features" "common-symbols" "objects")

# Desired order for the files within each subdirectory
declare -A file_order=(
  ["introduction"]="Technical-Support-Information.md Introduction.md Registration-and-Access.md"
  ["main-features"]="Terrain-Elevation-Analyzer.md Coverage-Planning-Tool.md Raytracing-Simulator.md"
  ["common-symbols"]="Symbols.md"
  ["objects"]="Point.md Area.md"
)

> "$sidebar_file"

# Title added to the right-hand panel
echo "# PROPAMAP Users' Manual" >> "$sidebar_file"


root_files=$(find . -maxdepth 1 -name "*.md" -type f ! -name "_Sidebar.md")

if [ -n "$root_files" ]; then
  while IFS= read -r file; do
    filename=$(basename "$file" .md)
    display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')
    echo "- [$display_name](${filename})" >> "$sidebar_file"  # Sin la extensión .md para enlaces
  done <<< "$root_files"

  
  echo "" >> "$sidebar_file"
fi


for subdir in "${subdir_order[@]}"; do
  if [ -d "$subdir" ]; then
    
    subdir_title=$(echo "$subdir" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')

    
    echo "# ${subdir_title}" >> "$sidebar_file"

    
    if [[ -n "${file_order[$subdir]}" ]]; then
      
      for file in ${file_order[$subdir]}; do
        
        if [ -f "$subdir/$file" ]; then
          filename=$(basename "$file" .md)
          display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')
          echo "- [$display_name](${filename})" >> "$sidebar_file"  
        fi
      done
    else
      
      files=$(find "$subdir" -maxdepth 1 -name "*.md" -type f | sort)
      while IFS= read -r file; do
        filename=$(basename "$file" .md)
        display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')
        echo "- [$display_name](${filename})" >> "$sidebar_file"  
      done <<< "$files"
    fi
  
    echo "" >> "$sidebar_file"
  fi
done
