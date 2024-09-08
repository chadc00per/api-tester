## Description:
Test all commands or API's in a file or directory with this script.
This script extracts command from lines starting with ///// or ##### from the provided file(s).
It runs each command and prints the input command and output result one by one, optionally in markdown.

Prepare your files to use this script by adding ///// or ##### at start of a line.
###### Example: `/////` or `#####`
- `///// curl -X GET /api/endpoint`
- `##### curl -X POST /api/endpoint`

## Usage: 
```bash
./runapi.sh <file|directory> --markdown --responseType <type>
```
**Flags:**
- `--markdown: Output results as file in markdown format.`
- `--responseType: Response format type (json, yaml, xml, html, text)`
