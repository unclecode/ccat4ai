# CCAT Project Reference

## Commands
- Run script: `bash ccat.sh <git-repo-url> <output-filename>`
- Lint bash script: `shellcheck ccat.sh`
- Check script syntax: `bash -n ccat.sh`

## Code Style Guidelines
- **Bash**: Follow Google's Shell Style Guide
- **Naming**: Use lowercase with underscores for variables/functions
- **Error Handling**: Use proper exit codes and trap for cleanup
- **Comments**: Add comments for non-obvious logic sections
- **Formatting**: Indent with 2 spaces
- **Tool Requirements**: Requires git, tree, file, and grep tools
- **Script Structure**: 
  1. Clone repo
  2. Process text files
  3. Extract code structure
  4. Clean up

## Purpose
CCAT (Code Cat) is a utility that clones a git repository and:
1. Creates a markdown file with all text content concatenated
2. Creates a mini version with only class/function definitions
3. Adds a directory structure tree to both output files