# CodeCat4AI (ccat)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-blue.svg)](https://www.gnu.org/software/bash/)
[![Twitter Follow](https://img.shields.io/twitter/follow/unclecode?style=social)](https://twitter.com/unclecode)

A lightning-fast tool to concatenate entire repositories into markdown files for AI processing.

## Why CodeCat4AI?

I noticed people keep looking for tools to convert a repo into one file to attach to their favorite LLM. Finding no simple solution, I created this 5-line bash script to do the job efficiently!

## Features

- **Fast**: Quickly processes repositories of any size
- **Simple**: Just a 5-line bash script - no complex dependencies
- **Flexible**: Works with both remote and local repositories
- **Smart**: Automatically detects text files
- **Dual Output**: Generates both full and compact versions
- **Clean**: Handles temporary files and cleanup automatically

## Installation

```bash
# Clone the repository
git clone https://github.com/unclecode/ccat4ai.git

# Make the script executable
chmod +x ccat4ai/ccat.sh

# Add to your PATH (optional)
sudo ln -s $(pwd)/ccat4ai/ccat.sh /usr/local/bin/ccat
```

## Uninstallation

```bash
# If you cloned the repository
cd ccat4ai
chmod +x uninstall.sh
./uninstall.sh

# Or run the uninstaller directly
curl -s https://raw.githubusercontent.com/unclecode/ccat4ai/main/uninstall.sh | bash
```

## Usage

```bash
# Basic usage - output defaults to "codebase"
ccat [repository_url_or_path] [output_name]
```

The second parameter `[output_name]` is optional and defaults to `codebase` if not provided.

### Examples

```bash
# Process a remote repository with custom output name
ccat https://github.com/unclecode/crawl4ai crawl4ai

# Process a remote repository with default output name
# Creates codebase.md and mini.codebase.md
ccat https://github.com/unclecode/crawl4ai

# Process a local repository by name (if in current directory)
ccat crawl4ai

# Process a local repository by path
ccat ~/projects/crawl4ai
```

### Output

The tool generates two files:
- `[output_name].md` - Full version with all text files concatenated
- `mini.[output_name].md` - Compact version with only function/class definitions

Both files include a directory tree structure at the end.

## Local vs Remote Repositories

- If a URL is provided (starts with http://, https://, or git@), the tool clones the repository temporarily
- If just a name is provided (like "crawl4ai"), the tool assumes it's a local directory in the current path
- If a path is provided, the tool uses that local repository

## About the Author

Created by [Unclecode](https://github.com/unclecode), author of the popular [Crawl4AI](https://github.com/unclecode/crawl4ai) library.

If you find this tool useful, please ⭐ [CodeCat4AI](https://github.com/unclecode/ccat4ai) and [Crawl4AI](https://github.com/unclecode/crawl4ai) on GitHub!

## License

MIT