#!/bin/bash

# Usage: ./convert_xlf_to_json.sh input.xlf

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input.xlf>"
  exit 1
fi

INPUT="$1"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT="translation_${TIMESTAMP}.json"

# check for xmlstarlet and input file
command -v xmlstarlet &>/dev/null || { echo "xmlstarlet is not installed. install via 'brew install xmlstarlet' ";  exit 1; }
[ -f "$INPUT" ] || { echo "Input file not found."; exit 1; }

CONTENT=$(xmlstarlet sel -N x="urn:oasis:names:tc:xliff:document:2.0" \
  -t -m "//x:unit" \
    -o '  "' -v "substring-before(substring-after(@name, \"\$['\"), \"']\")" -o '": {' -n \
    -o '    "defaultMessage": "' -m "x:segment" -v "normalize-space(x:target)" -o " " -b \
    -o '"' -n -o "  }," -n "$INPUT" \
  | sed '$s/,$//' | sed 's/<mrk[^>]*>//g' | sed 's|</mrk>||g' | sed 's/[[:space:]]*$//')

if [ -z "$CONTENT" ]; then
  echo "No translations found."
  exit 1
fi

{
  echo "{"
  echo "$CONTENT"
  echo "}"
} > "$OUTPUT"

echo "Conversion complete! Translations saved in '$OUTPUT'."
