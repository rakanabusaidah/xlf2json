# XLIFF to JSON Converter

This Bash script converts an XLIFF file into a JSON file for use with applications like React-Intl. It extracts the translation keys and their corresponding translated text from `<unit>` elements in the XLIFF file, and outputs a JSON file with a timestamped filename.

## Prerequisites

- **Bash:** This script is written for Bash.
- **xmlstarlet:** Make sure [xmlstarlet](http://xmlstar.sourceforge.net/) is installed on your system.

### Installing xmlstarlet

#### macOS (with Homebrew):
```bash
brew install xmlstarlet
```

## How to Use

1. **Download or clone the repository** containing the script.

2. **Make the script executable:**
   ```bash
   chmod +x convert_xlf_to_json.sh
   ```

3. **Run the script with your XLIFF file as an argument:**
   ```bash
   ./convert_xlf_to_json.sh your_file.xlf
   ```
   Replace `your_file.xlf` with the path to your XLIFF file.

4. **Output:**
   The script will create a JSON file in the same directory with a name like `translation_YYYYMMDD_HHMMSS.json`. This file contains the extracted translations in the following JSON structure:

   ```json
   {
     "Some.Key": {
       "defaultMessage": "Translated text here"
     },
     "Another.Key": {
       "defaultMessage": "Another translation here"
     }
   }
   ```



