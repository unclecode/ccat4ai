#!/bin/bash
output="${2:-codebase}"; orig_dir=$(pwd); repo=$(basename "$1" .git); [ ! -d "$repo" ] && git clone -q "$1" && trap "cd '$orig_dir' && rm -rf '$repo'" EXIT
cd "$repo" || exit
git ls-files -z | xargs -0 sh -c 'for f; do file --mime-type -b "$f" | grep -q text && cat "$f"; done' sh > "../$output.md" && tree -a >> "../$output.md"
git ls-files -z | xargs -0 sh -c 'for f; do file --mime-type -b "$f" | grep -q text && grep -Eh "^[[:space:]]*(class|def|module|function|struct|enum|interface)[[:space:]]+" "$f"; done' sh > "../mini.$output.md" && tree -a >> "../mini.$output.md"
echo "Done! Files created: $output.md, mini.$output.md"