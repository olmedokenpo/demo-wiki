# Guide to Generate and Synchronize Wiki Content

This project includes scripts and workflows to automate the generation of the `_Sidebar.md` file and synchronize the wiki repository with the main repository. These tools allow the organized rendering of a right-hand panel in the wiki with links to `.md` files from various subdirectories, using numerical prefixes for sorting.

## How It Works

The system uses a combination of:
1. **`update_sidebar.sh`:** A script that generates the `_Sidebar.md` file based on the directory and file structure in the project.
2. **`sync-wiki`:** A GitHub Actions workflow that synchronizes the `_Sidebar.md` file and content from the main repository to the wiki repository.

## Steps to Add New Content to the Wiki

### 1. Create or Register Directories and `.md` Files
- **Create new subdirectories:**  
  - Use numerical prefixes (e.g., `01-introduction`, `02-main-features`) for ordering in the sidebar.  
- **Create or update `.md` files within these directories:**  
  - Use numerical prefixes for filenames (e.g., `01-Overview.md`, `02-Details.md`) to control their order.  

### 2. Update the `update_sidebar.sh` Script
- No manual edits are needed; the script automatically processes directories and files based on their prefixes.  
- The script extracts titles from filenames by removing prefixes and formatting them for display.

### 3. Push Changes to the Repository
- After making changes, commit and push them to the main branch.  

### 4. Trigger the Workflow
- When a push to the `main` branch occurs, the `sync-wiki` workflow:
  - Runs `update_sidebar.sh` to generate `_Sidebar.md`.  
  - Synchronizes the wiki repository with the updated content.

## Example Configuration for `update_sidebar.sh`

### Subdirectory and File Naming Rules
- Use numerical prefixes for ordering (e.g., `01-introduction`, `02-main-features`).
- Filenames should also include numerical prefixes for ordering (e.g., `01-Overview.md`, `02-Details.md`).

### Generated `_Sidebar.md` Example
For a directory structure like this:

## Directory Structure

The directory structure for organizing `.md` files is as follows:

docs/
├── 01-introduction/
│   ├── 01-Overview.md
│   ├── 02-Getting-Started.md
├── 02-main-features/
│   ├── 01-Feature1.md
│   ├── 02-Feature2.md


The `_Sidebar.md` will look like:



