#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract data from JSON with better fallback handling
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')

# If we couldn't parse JSON or get required fields, show error
if [ -z "$current_dir" ] || [ -z "$model" ]; then
    printf "\e[48;5;196m\e[38;5;15m ERROR: Invalid JSON input \e[0m"
    exit 1
fi

# Get directory name
dir_name=$(basename "$current_dir")

# Use a triangle separator that works in most fonts
sep="▸"

# Get git branch if in a git repo
has_git=false
if [ -d "$current_dir/.git" ]; then
    cd "$current_dir" 2>/dev/null
    git_branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$git_branch" ]; then
        has_git=true
    fi
fi

# Build colored segments with separators
if [ "$has_git" = true ]; then
    # Directory segment (bright cyan text, no background)
    printf "\e[36;1m📁 $dir_name \e[0m"
    # Separator
    printf "\e[32;1m $sep \e[0m"
    # Git segment (green text, no background)
    printf "\e[32m🌿 $git_branch \e[0m"
    # Separator
    printf "\e[90m $sep \e[0m"
    # Model segment (gray text, no background)
    printf "\e[90m🤖 $model \e[0m"
else
    # Directory segment (bright cyan text, no background)
    printf "\e[36;1m📁 $dir_name \e[0m"
    # Separator
    printf "\e[90m $sep \e[0m"
    # Model segment (gray text, no background)
    printf "\e[90m🤖 $model \e[0m"
fi