## What?
Test all commands or API's in a file or directory with this script.
This script extracts command from lines starting with ///// or ##### from the provided file(s).
It runs each command and prints the input command and output result one by one.

## Why?
I like to keep my curl commands commented alongside my endpoints, so this makes it easy to test everything at once. I recommend setting it as a start script so you can run all at once with `npm run apitest` or something similar.

## How?
Prepare your files to use this script by adding ///// or ##### at start of a line.
###### Example: `/////` or `#####`
- `///// curl -X GET /api/endpoint`
- `##### curl -X POST /api/endpoint`

### Usage: 
```bash
./runapi.sh .
```

### Required Syntax
At the beginning of a line:
- `/////`
- `#####`
