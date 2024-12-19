#!/bin/bash 

# Nombre del archivo _Sidebar.md
sidebar_file="_Sidebar.md"

# Orden deseado para los subdirectorios
declare -a subdir_order=("introduction" "main-features" "common-symbols" "objects")

# Orden deseado para los archivos dentro de cada subdirectorio
declare -A file_order=(
  ["introduction"]="Introduction.md Registration-and-Access.md Technical-Support-Information.md"
  ["main-features"]="Terrain-Elevation-Analyzer.md Coverage-Planning-Tool.md Raytracing-Simulator.md"
  ["common-symbols"]="Symbols.md"
  ["objects"]="Point.md"
)

# Crear o limpiar el contenido del archivo _Sidebar.md
> "$sidebar_file"

# Agregar primero el título para los archivos raíz
echo "# PROPAMAP Users' Manual" >> "$sidebar_file"

# Procesar los archivos .md en la raíz del wiki
root_files=$(find . -maxdepth 1 -name "*.md" -type f ! -name "_Sidebar.md")

if [ -n "$root_files" ]; then
  while IFS= read -r file; do
    filename=$(basename "$file" .md)
    display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')
    echo "- [$display_name](${filename})" >> "$sidebar_file"  # Sin la extensión .md para enlaces
  done <<< "$root_files"

  # Agregar una línea en blanco para separación
  echo "" >> "$sidebar_file"
fi

# Iterar sobre los subdirectorios en el orden definido
for subdir in "${subdir_order[@]}"; do
  if [ -d "$subdir" ]; then
    # Obtener el nombre del subdirectorio y formatearlo como título
    subdir_title=$(echo "$subdir" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')

    # Agregar el título del subdirectorio
    echo "# ${subdir_title}" >> "$sidebar_file"

    # Verificar si hay un orden específico para los archivos en este subdirectorio
    if [[ -n "${file_order[$subdir]}" ]]; then
      # Usar el orden definido en file_order
      for file in ${file_order[$subdir]}; do
        # Verificar que el archivo exista antes de agregarlo
        if [ -f "$subdir/$file" ]; then
          filename=$(basename "$file" .md)
          display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')
          echo "- [$display_name](${filename})" >> "$sidebar_file"  # Sin la ruta del subdirectorio
        fi
      done
    else
      # Si no hay un orden definido, listar los archivos alfabéticamente
      files=$(find "$subdir" -maxdepth 1 -name "*.md" -type f | sort)
      while IFS= read -r file; do
        filename=$(basename "$file" .md)
        display_name=$(echo "$filename" | sed -E 's/-/ /g' | sed -E 's/\b./\U&/g')
        echo "- [$display_name](${filename})" >> "$sidebar_file"  # Sin la ruta del subdirectorio
      done <<< "$files"
    fi

    # Agregar una línea en blanco para separación
    echo "" >> "$sidebar_file"
  fi
done
