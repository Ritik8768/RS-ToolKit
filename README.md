# RS-Toolkit
**Professional Linux Server Management & Monitoring Toolkit**

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/YOUR_USERNAME/rs-toolkit)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)](https://www.linux.org/)

## 🚀 Quick Install

```bash
curl -sL https://raw.githubusercontent.com/Ritik8768/RS-ToolKit/main/install.sh | sudo bash
```

Or manual installation:

```bash
wget https://raw.githubusercontent.com/Ritik8768/RS-ToolKit/main/install.sh
chmod +x install.sh
sudo ./install.sh
```

## 📊 Features

- ✅ Real-time system monitoring
- ✅ Intelligent issue detection
- ✅ Safe disk cleanup (dry-run mode)
- ✅ CPU, Memory, Services analysis
- ✅ Root cause analysis
- ✅ Zero dependencies
- ✅ Works on all Linux distributions

## 🎯 Commands

```bash
rs-inspect          # Master health dashboard
rs-inspect-cpu      # CPU detailed analysis
rs-inspect-mem      # Memory detailed analysis
rs-inspect-svc      # Services status
rs-diagnose         # Intelligent issue detection
rs-fix-disk         # Safe disk cleanup
```

## 📋 Requirements

- Linux (any distribution)
- Bash 4.0+
- Root access for installation
- systemd (for service monitoring)

## 🔧 Usage Examples

### Check Server Health
```bash
rs-inspect
```

### Diagnose Issues
```bash
rs-diagnose
```

### Clean Disk Space
```bash
# Preview cleanup (safe)
rs-fix-disk

# Execute cleanup
rs-fix-disk --execute
```

## 🗑️ Uninstall

```bash
sudo rs-uninstall
```

## 📚 Documentation

- Installation: See install.sh
- Commands: Run any command to see usage
- Configuration: /etc/rs-toolkit/config.conf

## 🛡️ Security

All scripts are encoded for distribution. Source code is available for review.

## 📝 License

MIT License - See LICENSE file

## 👤 Author

**Ritik Rajesh Selukar**
- GitHub: [@Ritik8768](https://github.com/Ritik8768)

## 🤝 Contributing

Contributions welcome! Please open an issue or submit a pull request.

## ⭐ Support

If you find this useful, please star the repository!
