#!/bin/bash
# RS-Toolkit Installer v1.0.1

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

KEY="rs-toolkit-2026"

echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║         RS-TOOLKIT v1.0.1 - Production Installer              ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════╝${NC}\n"

if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}✗ Please run as root: sudo ./install.sh${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Decrypting and installing..."

# Decrypt and install commands
mkdir -p /tmp/rs-toolkit-install
for enc_file in bin/*.enc; do
    filename=$(basename "$enc_file" .enc)
    openssl enc -aes-256-cbc -d -pbkdf2 -in "$enc_file" -out "/tmp/rs-toolkit-install/$filename" -k "$KEY" 2>/dev/null
    install -m 755 "/tmp/rs-toolkit-install/$filename" /usr/local/bin/
done
echo -e "${GREEN}✓${NC} Commands installed to /usr/local/bin/"

# Decrypt and install library
mkdir -p /usr/local/lib/rs-toolkit
openssl enc -aes-256-cbc -d -pbkdf2 -in lib/common.sh.enc -out /usr/local/lib/rs-toolkit/common.sh -k "$KEY" 2>/dev/null
chmod 644 /usr/local/lib/rs-toolkit/common.sh
echo -e "${GREEN}✓${NC} Library installed to /usr/local/lib/rs-toolkit/"

# Create log directory
mkdir -p /var/log/rs-toolkit
chmod 755 /var/log/rs-toolkit
echo -e "${GREEN}✓${NC} Log directory created"

# Cleanup
rm -rf /tmp/rs-toolkit-install

echo -e "\n${GREEN}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║              ✅ Installation Complete!                        ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════╝${NC}\n"

echo -e "Quick Start:"
echo -e "  ${BLUE}rs-inspect${NC}     - Check system health"
echo -e "  ${BLUE}rs-diagnose${NC}    - Diagnose issues"
echo -e "  ${BLUE}rs-help${NC}        - Show all commands\n"
