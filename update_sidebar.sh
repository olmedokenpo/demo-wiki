#!/bin/bash

# Nombre del archivo _Sidebar.md
sidebar_file="_Sidebar.md"

# Crear o limpiar el contenido del archivo _Sidebar.md
> "$sidebar_file"

# Agregar primero el título para los archivos raíz
echo "# PROPAMAP Users' Manual" >> "$sidebar_file"

# Procesar el archivo Home.md en la raíz del directorio
if [ -f "Home.md" ]; then
  echo "- [Home](Home)" >> "$sidebar_file"
  echo "" >> "$sidebar_file" # Línea en blanco para separación
fi

# Ordenar los subdirectorios por prefijos
subdirs=$(find . -mindepth 1 -maxdepth 1 -type d | sort)

# Iterar sobre los subdirectorios en orden
for subdir in $subdirs; do
  # Eliminar el prefijo del nombre del subdirectorio para mostrarlo como título
  subdir_name=$(basename "$subdir")
  subdir_title=$(echo "$subdir_name" | sed -E 's/^[0-9]+-//g' | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')

  # Agregar el título del subdirectorio
  echo "# ${subdir_title}" >> "$sidebar_file"

  # Ordenar los archivos dentro del subdirectorio por prefijos
  files=$(find "$subdir" -maxdepth 1 -name "*.md" -type f | sort)

  # Iterar sobre los archivos del subdirectorio
  while IFS= read -r file; do
    # Eliminar el prefijo del nombre del archivo para mostrarlo
    filename=$(basename "$file" .md)
    display_name=$(echo "$filename" | sed -E 's/^[0-9]+-//g' | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')

    # Agregar el archivo al índice
    echo "- [${display_name}](${filename})" >> "$sidebar_file"
  done <<< "$files"

  # Agregar una línea en blanco para separación
  echo "" >> "$sidebar_file"
done
