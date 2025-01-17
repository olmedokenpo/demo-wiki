#!/bin/bash

# Nombre del archivo _Sidebar.md
sidebar_file="_Sidebar.md"

# Crear o limpiar el contenido del archivo _Sidebar.md
> "$sidebar_file"

# Agregar el título principal para el archivo Home.md
echo "# PROPAMAP Users' Manual" >> "$sidebar_file"

# Incluir el archivo Home.md desde el subdirectorio 01-home si existe
if [ -f "01-home/Home.md" ]; then
  echo "- [Home](Home)" >> "$sidebar_file"
  echo "" >> "$sidebar_file" # Línea en blanco para separación
fi

# Filtrar solo los subdirectorios que comienzan con un número (01, 02, etc.)
subdirs=$(find . -mindepth 1 -maxdepth 1 -type d -name "[0-9]*" | sort)

# Iterar sobre los subdirectorios seleccionados
for subdir in $subdirs; do
  # Obtener el nombre base del subdirectorio
  subdir_name=$(basename "$subdir")

  # Eliminar el prefijo numérico del nombre para formatearlo como título
  subdir_title=$(echo "$subdir_name" | sed -E 's/^[0-9]+-//g' | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')

  # Agregar el título del subdirectorio
  echo "# ${subdir_title}" >> "$sidebar_file"

  # Encontrar y ordenar los archivos .md que comienzan con un número dentro del subdirectorio
  files=$(find "$subdir" -maxdepth 1 -type f -name "[0-9]*.md" | sort)

  # Iterar sobre los archivos seleccionados
  while IFS= read -r file; do
    # Obtener el nombre base del archivo con prefijo
    filename_with_prefix=$(basename "$file" .md)

    # Generar el nombre limpio sin prefijo
    filename=$(echo "$filename_with_prefix" | sed -E 's/^[0-9]+-//g')

    # Eliminar el prefijo numérico para mostrar el nombre en el sidebar
    display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')

    # Agregar el archivo al índice (enlace sin prefijo)
    echo "- [${display_name}](${filename})" >> "$sidebar_file"
  done <<< "$files"

  # Agregar una línea en blanco para separación
  echo "" >> "$sidebar_file"
done
