#!/bin/bash

get_curl_commands() {
  
    extract_lines() {
        local file=$1
        grep -E '^(#####|/////)[[:space:]]*curl' "$file" | sed 's/^[#\/]*[[:space:]]*//'
    }

    process_directory() {
        local directory=$1
        for file in "$directory"/*; do
            if [ -d "$file" ]; then
                process_directory "$file"
            elif [ -f "$file" ]; then
                extract_lines "$file"
            fi
        done
    }

    if [ -z "$1" ]; then
        echo "Usage: $0 <directory>"
        exit 1
    fi

    process_directory "$1" | while read -r line; do
        echo "$line"
    done
}

run_curl_commands() {
    while read -r line; do
        response=$(eval "$line" 2>/dev/null)
        echo "Request:"
        echo $line
        echo "Response:"
        echo $response
        echo ""
    done
}

get_curl_commands "$@" | run_curl_commands
