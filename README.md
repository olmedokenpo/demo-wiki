
# Guía para la gestión y estructuración del contenido de la Wiki

Esta guía explica cómo generar, sincronizar y estructurar el contenido de la wiki utilizando scripts automatizados y flujos de trabajo de GitHub Actions. El objetivo es mantener una organización clara y permitir la fácil actualización de los archivos y directorios.


## Estructura general de la Wiki

La wiki utiliza los archivos `_Sidebar.md` y `Home.md`, ubicados en la raíz del directorio `docs`:

1. **`Home.md`:** Contiene el contenido inicial que se mostrará en la página principal de la wiki.  
2. **`_Sidebar.md`:** Define la estructura del panel lateral de navegación. Se genera automáticamente con base en la estructura del directorio `docs` donde estarán los subdirectorios y sus respectivos archivos con extensión `.md`

### Ejemplo de la estructura del directorio `docs/`

```
docs/
├── _Sidebar.md
├── Home.md
├── 01-introduction/
│   ├── 01-Overview.md
│   ├── 02-Getting-Started.md
├── 02-main-features/
│   ├── 01-Feature1.md
│   ├── 02-Feature2.md
```


El archivo `_Sidebar.md` reflejará esta estructura según los títulos extraídos de los nombres de los subdirectorios y archivos con extensión `.md`.


## Pasos para agregar y estructurar nuevo contenido a la Wiki

### 1. Crear nuevos Subdirectorios y Archivos con extensión `.md`
- **Subdirectorios:**  
  Crea un nuevo subdirectorio dentro de `docs/` y usa un prefijo numérico para definir su orden. Por ejemplo: 

```
docs/
├── 03-new-section/
```

- **Archivos `.md`:**  
Dentro del subdirectorio, crea archivos `.md` con prefijos numéricos para definir el orden en el panel lateral. Por ejemplo:

```
docs/
├── 03-new-section/
│   ├── 01-NewTopic.md
│   ├── 02-AnotherTopic.md
```

Al agregar nuevo contenido el directorio final `docs` quedará como sigue:

```
docs/
├── _Sidebar.md
├── Home.md
├── 01-introduction/
│   ├── 01-Overview.md
│   ├── 02-Getting-Started.md
├── 02-main-features/
│   ├── 01-Feature1.md
│   ├── 02-Feature2.md
├── 03-new-section/
│   ├── 01-NewTopic.md
│   ├── 02-AnotherTopic.md
```
La adición de nuevos cambios en la estructura del directorio `docs/` permitirá que _Sidebar.md se actualice automaticamente al hacer un push a la rama `main`.


### 2. Actualizar el contenido de `Home.md`
Edita el archivo `Home.md` en la raíz de `docs/` para incluir un resumen o introducción relevante al contenido de la wiki. Recuerda que aquí estará el contenido inicial que se mostrará en la página principal de la wiki.


### 3. Actualizar o reordenar el contenido existente
- **Renombrar Directorios o Archivos:**  
Si necesitas reorganizar el orden, ajusta los prefijos numéricos de los directorios o archivos.
- **Editar Archivos:**  
Actualiza los archivos `.md` con nueva información o corrige el contenido según sea necesario.


## Sincronización de la Wiki

El proceso de sincronización utiliza un script y un flujo de trabajo de GitHub Actions para automatizar la generación y actualización del contenido en la wiki.

### Herramientas Utilizadas
1. **`update_sidebar.sh`:**  
 Genera automáticamente el archivo `_Sidebar.md` basándose en la estructura de subdirectorios y archivos con extensión `.md`.
2. **Flujo de trabajo `sync-wiki`:**  
 Sincroniza los cambios del repositorio principal con el repositorio de la wiki cada vez que se realizan cambios en la rama `main`.

### Cómo Activar la Sincronización
1. Realiza cambios en la estructura de directorios o en los archivos `.md`.
2. Realiza un commit y push a la rama `main`.
3. El flujo de trabajo `sync-wiki` se ejecutará automáticamente para:
 - Generar un nuevo archivo `_Sidebar.md`.
 - Sincronizar los cambios con el repositorio de la wiki.
