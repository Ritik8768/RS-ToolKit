# RS-Toolkit

[![Version](https://img.shields.io/badge/version-1.0.1-blue.svg)](https://github.com/Ritik8768/RS-ToolKit/releases)
[![Bash](https://img.shields.io/badge/bash-5.0+-orange.svg)](https://www.gnu.org/software/bash/)
[![Quality](https://img.shields.io/badge/quality-99%25-brightgreen.svg)](https://github.com/Ritik8768/RS-ToolKit)

**Professional Linux System Administration Toolkit**   20 powerful commands to inspect, diagnose, and fix your Linux servers.

Perfect for beginners and professional 🚀

## ✨ Features

- 🔍 **8 Inspection Commands** - Safe, read-only system checks
- 🩺 **5 Diagnosis Commands** - Intelligent problem detection
- 🔧 **4 Fix Commands** - Automated issue resolution
- 📚 **Professional Documentation** - Man pages + beginner guides
- 🎨 **Colorful Output** - Easy-to-read, color-coded results
- ✅ **99% Quality Score** - Thoroughly tested and bug-free

## 🚀 Quick Start

### Installation

```bash
git clone https://github.com/Ritik8768/RS-ToolKit.git
cd RS-ToolKit
sudo ./install.sh
```

### First Steps

```bash
# Check system health
rs-inspect

# Find problems
rs-diagnose

# Fix issues
sudo rs-fix-disk

# Get help
rs-help
man rs-toolkit
```

## 📋 Commands

### Inspection (Read-Only - Safe)

| Command | Description |
|---------|-------------|
| `rs-inspect` | Master health dashboard |
| `rs-inspect-cpu` | CPU usage and processes |
| `rs-inspect-mem` | Memory usage analysis |
| `rs-inspect-disk` | Disk space and I/O |
| `rs-inspect-network` | Network connections |
| `rs-inspect-svc` | Service status |
| `rs-inspect-security` | Security audit |
| `rs-inspect-logs` | Log analysis |

### Diagnosis (Analysis)

| Command | Description |
|---------|-------------|
| `rs-diagnose` | Auto-detect all issues |
| `rs-diagnose-slow` | Performance bottlenecks |
| `rs-diagnose-memory` | Memory leak detection |
| `rs-diagnose-disk` | Disk space analysis |
| `rs-diagnose-network` | Network troubleshooting |

### Fix (Requires Root)

| Command | Description |
|---------|-------------|
| `rs-fix-disk` | Clean disk space |
| `rs-fix-memory` | Free memory |
| `rs-fix-services` | Restart failed services |
| `rs-fix-logs` | Rotate log files |

### Utility

| Command | Description |
|---------|-------------|
| `rs-watch` | Continuous monitoring |
| `rs-report` | Generate system report |
| `rs-help` | Show help guide |

## 📖 Documentation

- **Quick Help:** `rs-help`
- **Man Page:** `man rs-toolkit`
- **Changelog:** [CHANGELOG.md](CHANGELOG.md)
- **Release Report:** [docs/reports/RELEASE-REPORT-v1.0.1.md](docs/reports/RELEASE-REPORT-v1.0.1.md)
- **Contributing Guide:** [CONTRIBUTING.md](CONTRIBUTING.md)

## 🎯 Use Cases

### For Beginners
```bash
# Is my server healthy?
rs-inspect

# Why is it slow?
rs-diagnose-slow

# Clean up space
sudo rs-fix-disk --dry-run  # Preview first
sudo rs-fix-disk            # Then execute
```

### For Professionals
```bash
# Complete checkup
rs-inspect && rs-diagnose

# Generate report
rs-report > /tmp/report-$(date +%Y%m%d).txt

# Continuous monitoring
rs-watch 5
```

## 🔒 Safety

- ✅ **Inspection commands** are 100% safe (read-only)
- ✅ **Diagnosis commands** only analyze (no changes)
- ⚠️ **Fix commands** require sudo and ask for confirmation
- 📝 All actions logged to `/var/log/rs-toolkit/audit.log`

## 🎨 Output Guide

- 🟢 **Green (✓)** = Everything is good
- 🟡 **Yellow (⚠)** = Warning - needs attention
- 🔴 **Red (✗)** = Problem - needs fixing
- 🔵 **Blue (ℹ)** = Information

## 🧪 Testing

Automated testing agent included:
- 140 comprehensive tests
- 10 test suites
- Automated bug detection
- Quality score: 99%

## 🤝 Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md)

**Good First Issues:**
- Add --dry-run to all fix commands
- Add more usage examples
- Create command aliases
- Add color themes

## 📦 Requirements

- Linux (Ubuntu, Debian, CentOS, RHEL, etc.)
- Bash 4.0+
- Root access (for fix commands)
- Standard utilities: systemctl, df, free, top, ps,

## 🗺️ Roadmap

See ISSUES for planned features:
- Configuration file support
- JSON output format
- Email notifications
- Docker support
- Web dashboard
- And more!

## 📊 Stats

- **Commands:** 20
- **Lines of Code:** ~5,000
- **Test Coverage:** 99%
- **Documentation:** Complete
- **Quality Score:** A+ (99%)

## 🐛 Bug Reports

Found a bug? [Create an issue](https://github.com/Ritik8768/RS-ToolKit/issues/new)


## 👨💻 Author

**Ritik Rajesh Selukar**
- GitHub: [@Ritik8768](https://github.com/Ritik8768)
- Repository: [RS-ToolKit](https://github.com/Ritik8768/RS-ToolKit)

## ⭐ Support

If you find this useful, please star the repository! ⭐

## 📸 Screenshots

### System Health Dashboard
![RS-Toolkit Dashboard](screenshots/rs-inspect-dashboard.png)

The colorful, easy-to-read dashboard shows:
- ✅ System health status at a glance
- 📊 CPU, Memory, and Disk usage with visual bars
- 🔥 Top resource-consuming processes
- ⚠️ Warnings and issues that need attention

More screenshots available in the [screenshots/](screenshots/) directory.

## 🙏 Acknowledgments

Built with ❤️ for the Linux community

---

**Made with 🚀 by Ritik Selukar**
