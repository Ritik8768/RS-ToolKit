# RS-Toolkit Screenshots

This directory contains screenshots demonstrating RS-Toolkit features and usage.

## Required Screenshots

To complete the documentation, please add the following screenshots:

1. **installation.png** - Installation process showing the colorful installer
2. **inspect-commands.png** - Output of inspection commands (rs-inspect, rs-inspect-cpu, etc.)
3. **diagnose-commands.png** - Output of diagnosis commands (rs-diagnose, rs-diagnose-slow, etc.)
4. **fix-commands.png** - Output of fix commands with confirmation prompts

## How to Capture Screenshots

### On Linux:
```bash
# Install screenshot tool if needed
sudo apt install gnome-screenshot  # Ubuntu/Debian
sudo yum install gnome-screenshot  # CentOS/RHEL

# Capture screenshots
gnome-screenshot -w  # Window capture
gnome-screenshot -a  # Area capture
```

### Recommended Commands to Screenshot:

```bash
# 1. Installation
sudo ./install.sh

# 2. Inspection
rs-inspect
rs-inspect-cpu
rs-inspect-mem

# 3. Diagnosis
rs-diagnose
rs-diagnose-slow

# 4. Fix commands
sudo rs-fix-disk --dry-run
```

## Screenshot Guidelines

- Use terminal with dark theme for better visibility
- Ensure colorful output is visible
- Capture full command output
- Use PNG format for best quality
- Recommended size: 1200x800 or larger

## Current Status

- [ ] installation.png
- [ ] inspect-commands.png
- [ ] diagnose-commands.png
- [ ] fix-commands.png

Once screenshots are added, they will automatically appear in the main README.md.
