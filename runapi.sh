#!/bin/bash

# Description:
# Test all commands or API's in a file or directory with this script.
# This script extracts command from lines starting with ///// or ##### from the provided file(s).
# It runs each command and prints the input command and output result one by one, optionally in markdown.

# Prepare your files to use this script by adding ///// or ##### at start of a line.
#   Example:
#   /////
#   ///// GET /api/endpoint
#   ///// POST /api/endpoint

# Usage: ./runapi.sh <file|directory> --markdown --responseType <type>

# Flags:
#   --markdown: Output results as file in markdown format.
#   --responseType: Response format type (json, yaml, xml, html, text)

api_md_file="api.md"

check_usage_argument() {
  # Check if a file or directory is provided as an argument
  if [ -z "$1" ]; then
    echo "Usage: $0 <file|directory> --markdown --responseType <type>"
    exit 1
  fi
}

parse_arguments() {
  while [[ "$#" -gt 0 ]]; do
    case $1 in
      --markdown) markdown=true ;;
      --responseType) responseType="$2"; shift ;;
      *) path="$1" ;;
    esac
    shift
  done
}

extract_lines() {
  grep -E '^(/////|#####)' "$1" | sed -E 's/^(\/\/\/\/\/ *|##### *)//' | while IFS= read -r line; do
    echo "$line"
    echo "Reponse:"
    echo '```'$responseType
    eval "$line"
    echo '```'
    echo ""
  done
}

process_file_or_directory() {
  if [ -d "$path" ]; then
    for file in "$path"/*; do
      extract_lines "$file"
    done
  else
    extract_lines "$path"
  fi
}

output_to_api_md() {
  if [ "$markdown" = true ]; then
    process_file_or_directory > "$api_md_file"
    cat "$api_md_file"
  else
    process_file_or_directory
  fi
}

check_usage_argument "$1"
parse_arguments "$@"
output_to_api_md