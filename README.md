# Guide to Generate Wiki Content

This project includes scripts and workflows to automate the generation of the `_Sidebar.md` file. This file enables rendering a right-hand panel in the wiki with organized links to various `.md` files within the registered subdirectories.

## Steps to Register Directories and `.md` Files

1. **Create or Register Directories and `.md` Files**

   - In the project root:
     - **Register a new directory** along with the associated `.md` files, or
     - **Add `.md` files** to an existing directory, containing the content to be published in the wiki.

2. **Update the `update_sidebar.sh` Script**

   - **This step is essential:**
     - Register the new directory and its corresponding `.md` files in `update_sidebar.sh`.
     - If only a new file is added, it must be registered under the corresponding directory.

   This ensures that the elements are correctly included in the `_Sidebar.md` file.

3. **Automatically Generate `_Sidebar.md` on Pull Request**
   - When a pull request containing changes to directories or `.md` files is made, and the configured workflow is triggered, the `_Sidebar.md` file will be automatically generated.
   - This process follows the order defined in `update_sidebar.sh` and renders the content in the right-hand panel of the wiki.

## Example Configuration in update_sidebar.sh

### Subdirectory Order

Define the desired order for the subdirectories in the panel:

```bash
declare -a subdir_order=("introduction" "main-features" "common-symbols" "objects" "example_directory")
```

### File Order per Subdirectory

Specify the desired order of the files within each directory:

```bash
declare -A file_order=(
  ["introduction"]="Technical-Support-Information.md Introduction.md Registration-and-Access.md"
  ["main-features"]="Terrain-Elevation-Analyzer.md Coverage-Planning-Tool.md Raytracing-Simulator.md"
  ["common-symbols"]="Symbols.md"
  ["objects"]="Point.md Area.md Lines.md"
  ["example_directory"]="example_file.md"
)
```

## Final Output

When the pull request that triggers the workflow is approved, \_Sidebar.md will be automatically generated.
The registered .md files will appear organized and ready to render in the wiki.

## Important Notes

Registering in update_sidebar.sh is mandatory.
Without this step, directories and files will not appear in \_Sidebar.md.
It is important to follow the defined structure and order to maintain an organized and functional wiki.
