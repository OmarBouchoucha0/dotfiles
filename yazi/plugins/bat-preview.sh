#!/usr/bin/env bash

# Yazi passes the file path as the first argument
file="$1"

# Don't preview directories
[ -d "$file" ] && exit 1

# Use bat to preview text files
bat --style=plain --color=always --paging=never "$file"
