import os
import sys

try:
    import pyperclip
    CLIPBOARD_AVAILABLE = True
except ImportError:
    CLIPBOARD_AVAILABLE = False
    print("Note: Install 'pyperclip' for clipboard support: pip install pyperclip")

# Set console encoding to UTF-8 for Windows
if sys.platform == 'win32':
    sys.stdout.reconfigure(encoding='utf-8')
    sys.stderr.reconfigure(encoding='utf-8')

# Files and directories to include
ROOT_FILES = ['init.lua']
INCLUDE_DIRS = ['lua', 'doc']
OUTPUT_FILE = 'repo.txt'

def write_file_content(file_path, output_file):
    """Write file content to output with file markers"""
    try:
        relative_path = os.path.relpath(file_path, start=os.getcwd())
        output_file.write(f"\n[File: {relative_path}]\n")
        
        with open(file_path, 'r', encoding='utf-8') as f:
            output_file.write(f.read())
            
        output_file.write(f"\n[End: {relative_path}]\n")
    except Exception as e:
        print(f"Error processing {file_path}: {e}")

def process_directory(dir_path, output_file):
    """Process all files in a directory recursively"""
    try:
        for root, dirs, files in os.walk(dir_path):
            for file in files:
                file_path = os.path.join(root, file)
                write_file_content(file_path, output_file)
    except Exception as e:
        print(f"Error walking directory {dir_path}: {e}")

def main():
    try:
        # Open output file
        with open(OUTPUT_FILE, 'w', encoding='utf-8') as output:
            # First process root files
            for root_file in ROOT_FILES:
                if os.path.exists(root_file):
                    write_file_content(root_file, output)
                else:
                    print(f"Warning: Root file {root_file} not found")

            # Then process included directories
            for dir_name in INCLUDE_DIRS:
                dir_path = os.path.join(os.getcwd(), dir_name)
                if os.path.exists(dir_path) and os.path.isdir(dir_path):
                    process_directory(dir_path, output)
                else:
                    print(f"Warning: Directory {dir_name} not found")

        # Copy to clipboard if available
        if CLIPBOARD_AVAILABLE:
            try:
                with open(OUTPUT_FILE, 'r', encoding='utf-8') as f:
                    content = f.read()
                pyperclip.copy(content)
                print("Content copied to clipboard")
            except Exception as e:
                print(f"Failed to copy to clipboard: {e}")

        print(f"Documentation generated at: {OUTPUT_FILE}")

    except Exception as e:
        print(f"Error generating documentation: {e}")

if __name__ == "__main__":
    main()
