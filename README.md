# Installation Instructions

This guide will help you set up the scripts for easy access from anywhere on your system.

## Steps to Install

1. **Move the Scripts to `~/.local/bin`**  
   Ensure the `~/.local/bin` directory exists. If it doesn't, create it:

   ```bash
   mkdir -p ~/.local/bin
   ```

   Then move the scripts to this directory. For example:

   ```bash
   mv /path/to/your/scripts/*.sh ~/.local/bin/
   ```

2. **Make the Scripts Executable**  
   Grant execute permissions to all the scripts:

   ```bash
   chmod +x ~/.local/bin/*.sh
   ```

3. **Add `~/.local/bin` to Your PATH (if not already)**  
   Check if `~/.local/bin` is in your PATH:

   ```bash
   echo $PATH
   ```

   If it's not, add it to your shell configuration file (e.g., `~/.bashrc`, `~/.zshrc`):

   ```bash
   echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
   ```

   Then reload your shell configuration:

   ```bash
   source ~/.bashrc
   ```

4. **Verify Installation**  
   Test if the scripts are accessible. For example, if you have a script named `connect.sh`:

   ```bash
   connect.sh
   ```

   Repeat this for other scripts to ensure they are accessible.

5. **Remove the git repo**
   remove this git repo

   ```bash
   rm -rf scripts
   ```

## Notes

- Ensure all scripts have unique and descriptive names before moving them to `~/.local/bin`.
- If you encounter any issues, double-check the file permissions and PATH configuration.
