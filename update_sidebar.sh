#!/bin/bash

# Nombre del archivo _Sidebar.md
sidebar_file="_Sidebar.md"

# Crear o limpiar el contenido del archivo _Sidebar.md
> "$sidebar_file"

# Iterar sobre cada subdirectorio
for dir in */; do
  # Quitar la barra al final del nombre del subdirectorio
  subdir=$(basename "$dir")

  # Obtener todos los archivos .md dentro del subdirectorio
  files=$(find "$dir" -maxdepth 1 -name "*.md" -type f)

  # Si hay archivos .md en el subdirectorio
  if [ -n "$files" ]; then
    # Agregar el encabezado con el nombre del subdirectorio
    echo "# ${subdir^}" >> "$sidebar_file"

    # Iterar sobre cada archivo .md en el subdirectorio
    while IFS= read -r file; do
      # Obtener el nombre del archivo sin extensión
      filename=$(basename "$file" .md)

      # Reemplazar guiones por espacios y capitalizar palabras
      display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')

      # Agregar el enlace al archivo _Sidebar.md
      echo "- [$display_name](${filename})" >> "$sidebar_file"
    done <<< "$files"

    # Agregar una línea en blanco para separación
    echo "" >> "$sidebar_file"
  fi
done

# Procesar los archivos .md en la raíz
root_files=$(find . -maxdepth 1 -name "*.md" -type f ! -name "_Sidebar.md")

if [ -n "$root_files" ]; then
  echo "# Root Files" >> "$sidebar_file"
  while IFS= read -r file; do
    filename=$(basename "$file" .md)
    display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')
    echo "- [$display_name](${filename})" >> "$sidebar_file"
  done <<< "$root_files"
fi
