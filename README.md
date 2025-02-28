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
git clone https://github.com/unclecode/codecat4ai.git

# Make the script executable
chmod +x codecat4ai/ccat.sh

# Add to your PATH (optional)
sudo ln -s $(pwd)/codecat4ai/ccat.sh /usr/local/bin/ccat
```

## Usage

```bash
# If installed to PATH
ccat [repository_url_or_path] [output_name]

# Or run directly
./ccat.sh [repository_url_or_path] [output_name]
```

### Examples

```bash
# Process a remote repository
ccat https://github.com/unclecode/crawl4ai crawl4ai

# Process a local repository
ccat ~/projects/my-project my-project
```

### Output

The tool generates two files:
- `[output_name].md` - Full version with all text files concatenated
- `mini.[output_name].md` - Compact version with only function/class definitions

Both files include a directory tree structure at the end.

## About the Author

Created by [Unclecode](https://github.com/unclecode), author of the popular [Crawl4AI](https://github.com/unclecode/crawl4ai) library.

If you find this tool useful, please ⭐ [CodeCat4AI](https://github.com/unclecode/codecat4ai) and [Crawl4AI](https://github.com/unclecode/crawl4ai) on GitHub!

## License

MIT