#!/bin/bash
# RS-Toolkit Quick Installer
# Download and install from GitHub

set -e

VERSION="1.0.0"
GITHUB_URL="https://raw.githubusercontent.com/Ritik8768/RS-ToolKit/main"
INSTALL_DIR="/usr/local/bin"
LIB_DIR="/usr/local/lib/rs-toolkit"
CONFIG_DIR="/etc/rs-toolkit"

echo "╔════════════════════════════════════════════════════════════════════════════╗"
echo "║              RS-TOOLKIT INSTALLER v$VERSION                                   ║"
echo "╚════════════════════════════════════════════════════════════════════════════╝"
echo ""

# Check root
if [ "$EUID" -ne 0 ]; then 
    echo "✗ Error: Please run as root (use sudo)"
    exit 1
fi

echo "✓ Running as root"
echo "✓ Downloading from GitHub..."

# Create directories
mkdir -p $INSTALL_DIR $LIB_DIR $CONFIG_DIR /var/log/rs-toolkit /var/lib/rs-toolkit/{metrics,backups,cache}

# Download and decode files
download_and_install() {
    local file=$1
    local dest=$2
    local perm=$3
    
    curl -sL "$GITHUB_URL/$file" | base64 -d > "$dest"
    chmod $perm "$dest"
}

# Install library
download_and_install "lib/common.sh.enc" "$LIB_DIR/common.sh" 644

# Install commands
echo "  Installing commands..."
for cmd in rs-inspect rs-diagnose rs-fix-disk rs-inspect-cpu rs-inspect-mem rs-inspect-svc rs-help; do
    download_and_install "bin/${cmd}.enc" "$INSTALL_DIR/$cmd" 755
    echo "  ✓ $cmd"
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

echo ""
echo "╔════════════════════════════════════════════════════════════════════════════╗"
echo "║                    ✅ INSTALLATION COMPLETE!                               ║"
echo "╚════════════════════════════════════════════════════════════════════════════╝"
echo ""
echo "🚀 Quick Start:"
echo "   rs-inspect          - Check server health"
echo "   rs-diagnose         - Analyze issues"
echo "   rs-fix-disk         - Clean disk space"
echo ""
