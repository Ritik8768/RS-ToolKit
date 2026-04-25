#!/bin/bash
# Local Test Installer (simulates GitHub download)
# Tests the encoded files before pushing to GitHub

set -e

VERSION="1.0.0"
BASE_DIR="/home/ritik/rs-toolkit-release"
INSTALL_DIR="/usr/local/bin"
LIB_DIR="/usr/local/lib/rs-toolkit"
CONFIG_DIR="/etc/rs-toolkit"

echo "╔════════════════════════════════════════════════════════════════════════════╗"
echo "║              RS-TOOLKIT TEST INSTALLER v$VERSION                           ║"
echo "╚════════════════════════════════════════════════════════════════════════════╝"
echo ""

# Check root
if [ "$EUID" -ne 0 ]; then 
    echo "✗ Error: Please run as root (use sudo)"
    exit 1
fi

echo "✓ Running as root"
echo "✓ Installing from local encoded files..."

# Create directories
mkdir -p $INSTALL_DIR $LIB_DIR $CONFIG_DIR /var/log/rs-toolkit /var/lib/rs-toolkit/{metrics,backups,cache}

# Install library
echo "  Installing library..."
base64 -d "$BASE_DIR/lib/common.sh.enc" > "$LIB_DIR/common.sh"
chmod 644 "$LIB_DIR/common.sh"

# Install commands
echo "  Installing commands..."
for enc_file in "$BASE_DIR/bin/"*.enc; do
    cmd=$(basename "$enc_file" .enc)
    base64 -d "$enc_file" > "$INSTALL_DIR/$cmd"
    chmod 755 "$INSTALL_DIR/$cmd"
    
    # Update library path
    sed -i "s|source \"\$SCRIPT_DIR/../lib/common.sh\"|source \"$LIB_DIR/common.sh\"|g" "$INSTALL_DIR/$cmd"
    
    echo "    ✓ $cmd"
done

# Create config
cat > $CONFIG_DIR/config.conf << 'EOF'
VERSION=1.0.0
DISK_WARNING=80
DISK_CRITICAL=90
MEMORY_WARNING=80
MEMORY_CRITICAL=90
CPU_WARNING=70
CPU_CRITICAL=90
LOG_RETENTION_DAYS=7
TEMP_RETENTION_DAYS=3
JOURNAL_RETENTION_DAYS=7
BACKUP_ENABLED=true
BACKUP_DIR=/var/lib/rs-toolkit/backups
EOF

# Create uninstaller
cat > $INSTALL_DIR/rs-uninstall << 'UNINSTALL'
#!/bin/bash
if [ "$EUID" -ne 0 ]; then echo "Please run as root"; exit 1; fi
echo "Uninstalling RS-Toolkit..."
rm -f /usr/local/bin/rs-*
rm -rf /usr/local/lib/rs-toolkit /etc/rs-toolkit /var/lib/rs-toolkit /var/log/rs-toolkit
echo "✓ Uninstalled successfully"
UNINSTALL
chmod 755 $INSTALL_DIR/rs-uninstall

INSTALLED=$(ls -1 $INSTALL_DIR/rs-* 2>/dev/null | wc -l)

echo ""
echo "╔════════════════════════════════════════════════════════════════════════════╗"
echo "║                    ✅ INSTALLATION COMPLETE!                               ║"
echo "╚════════════════════════════════════════════════════════════════════════════╝"
echo ""
echo "📊 Installed: $INSTALLED commands"
echo ""
echo "🚀 Quick Start:"
echo "   rs-inspect          - Check server health"
echo "   rs-diagnose         - Analyze issues"
echo "   rs-fix-disk         - Clean disk space"
echo ""
echo "📚 Available Commands:"
ls -1 $INSTALL_DIR/rs-* | xargs -n1 basename | grep -v uninstall | sed 's/^/   /'
echo ""
echo "🗑️  Uninstall: sudo rs-uninstall"
echo ""
