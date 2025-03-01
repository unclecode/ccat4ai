#!/bin/bash

VERSION="0.1.0"

# Display version if requested
if [ "$1" = "--version" ]; then
  echo "ccat version $VERSION"
  exit 0
fi

# Check if we have enough arguments
if [ -z "$1" ]; then
  echo "Usage: $(basename "$0") <repo-url-or-path> [output-name] [subdir] [include-patterns] [exclude-patterns]"
  echo "Example: $(basename "$0") https://github.com/user/repo myproject src \"*.py,*.js\" \"node_modules,venv\""
  exit 1
fi

output="${2:-codebase}"
home="${3:-.}"
incl="${4:-}"
excl="${5:-}" 
orig_dir=$(pwd)
repo=$(basename "$1" .git)

# Clone if needed
if [ ! -d "$repo" ]; then
  git clone -q "$1" || exit 1
  trap "cd '$orig_dir' && rm -rf '$repo'" EXIT
fi

cd "$repo" || exit 1
set -f

# Build find commands for include/exclude patterns
find_cmd_incl=""
if [ -n "$incl" ]; then
  find_cmd_incl="( -name ${incl//,/ -o -name } )"
fi

find_cmd_excl=""
if [ -n "$excl" ]; then
  find_cmd_excl="! -name ${excl//,/ -a ! -name }"
fi

# Generate full content file
find "$home" -type f $find_cmd_incl $find_cmd_excl -exec sh -c 'file --mime-type -b "$1" | grep -q text && cat "$1"' sh {} \; > "../$output.md" && tree -a "$home" >> "../$output.md"

# Generate mini content file (function/class definitions only)
find "$home" -type f $find_cmd_incl $find_cmd_excl -exec sh -c 'file --mime-type -b "$1" | grep -q text && grep -Eh "^[[:space:]]*(class|def|module|function|struct|enum|interface)[[:space:]]+" "$1"' sh {} \; > "../mini.$output.md" && tree -a "$home" >> "../mini.$output.md"

set +f

echo "Done! Files created: $output.md, mini.$output.md"