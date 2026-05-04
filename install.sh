#!/bin/bash
# RS-Toolkit Installer v1.0.1

set -e

# Color Palette
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD_BLUE='\033[1;34m'
BOLD_GREEN='\033[1;32m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m'

KEY="rs-toolkit-2026"

clear
echo ""
echo -e "${BOLD_BLUE}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD_BLUE}║                                                               ║${NC}"
echo -e "${BOLD_BLUE}║${WHITE}         🚀 RS-TOOLKIT v1.0.1 - Production Installer 🚀       ${BOLD_BLUE}║${NC}"
echo -e "${BOLD_BLUE}║                                                               ║${NC}"
echo -e "${BOLD_BLUE}║${CYAN}           Enterprise-Grade System Administration             ${BOLD_BLUE}║${NC}"
echo -e "${BOLD_BLUE}║                                                               ║${NC}"
echo -e "${BOLD_BLUE}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""

if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}✗ Please run as root: ${YELLOW}sudo ./install.sh${NC}"
    exit 1
fi

echo -e "${MAGENTA}🔐 Decrypting and installing...${NC}"
echo ""

# Decrypt and install commands
mkdir -p /tmp/rs-toolkit-install
for enc_file in bin/*.enc; do
    filename=$(basename "$enc_file" .enc)
    openssl enc -aes-256-cbc -d -pbkdf2 -in "$enc_file" -out "/tmp/rs-toolkit-install/$filename" -k "$KEY" 2>/dev/null
    install -m 755 "/tmp/rs-toolkit-install/$filename" /usr/local/bin/
done
echo -e "${GREEN}✓${NC} Commands installed to ${CYAN}/usr/local/bin/${NC}"

# Decrypt and install library
mkdir -p /usr/local/lib/rs-toolkit
openssl enc -aes-256-cbc -d -pbkdf2 -in lib/common.sh.enc -out /usr/local/lib/rs-toolkit/common.sh -k "$KEY" 2>/dev/null
chmod 644 /usr/local/lib/rs-toolkit/common.sh
echo -e "${GREEN}✓${NC} Library installed to ${CYAN}/usr/local/lib/rs-toolkit/${NC}"

# Install man page
if [ -f "rs-toolkit.1" ]; then
    mkdir -p /usr/share/man/man1
    cp rs-toolkit.1 /usr/share/man/man1/
    mandb -q 2>/dev/null || true
    echo -e "${GREEN}✓${NC} Man page installed (access with: ${CYAN}man rs-toolkit${NC})"
fi

# Create log directory
mkdir -p /var/log/rs-toolkit
chmod 755 /var/log/rs-toolkit
echo -e "${GREEN}✓${NC} Log directory created"

# Cleanup
rm -rf /tmp/rs-toolkit-install

echo ""
echo -e "${BOLD_GREEN}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD_GREEN}║                                                               ║${NC}"
echo -e "${BOLD_GREEN}║${WHITE}                  ✅ Installation Complete! ✅                 ${BOLD_GREEN}║${NC}"
echo -e "${BOLD_GREEN}║                                                               ║${NC}"
echo -e "${BOLD_GREEN}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BOLD}🚀 Quick Start:${NC}"
echo -e "  ${CYAN}rs-inspect${NC}     - Check system health"
echo -e "  ${CYAN}rs-diagnose${NC}    - Diagnose issues"
echo -e "  ${CYAN}rs-help${NC}        - Show all commands"
echo ""
echo -e "${BOLD}📚 Documentation:${NC}"
echo -e "  ${CYAN}man rs-toolkit${NC} - Detailed manual"
echo -e "  ${CYAN}rs-help${NC}        - Quick reference"
echo ""
