# GitHub Issues for RS-Toolkit

## Enhancement Issues

### Issue #1: Add --dry-run support to all fix commands
**Labels:** enhancement, good first issue
**Priority:** Medium

**Description:**
Currently only some fix commands support `--dry-run` flag. Add this feature to all fix commands for safety.

**Commands to update:**
- rs-fix-memory
- rs-fix-services
- rs-fix-logs

**Expected behavior:**
```bash
sudo rs-fix-memory --dry-run  # Shows what will be done
sudo rs-fix-services --dry-run  # Preview service restarts
```

---

### Issue #2: Add configuration file support
**Labels:** enhancement, feature
**Priority:** Medium

**Description:**
Allow users to customize thresholds and behavior via `/etc/rs-toolkit/config.conf`

**Features needed:**
- Custom warning/critical thresholds
- Color theme selection (light/dark)
- Enable/disable specific checks
- Custom log retention periods

**Example config:**
```bash
DISK_WARNING=75
DISK_CRITICAL=85
COLOR_THEME=dark
```

---

### Issue #3: Add JSON output format
**Labels:** enhancement, api
**Priority:** Low

**Description:**
Add `--json` flag to output results in JSON format for automation/scripting.

**Example:**
```bash
rs-inspect --json > report.json
rs-diagnose --json | jq '.issues'
```

**Use cases:**
- Integration with monitoring tools
- Automated reporting
- API consumption

---

### Issue #4: Create web dashboard
**Labels:** enhancement, feature, help wanted
**Priority:** Low

**Description:**
Build a simple web interface to view system status remotely.

**Features:**
- Real-time monitoring
- Historical data graphs
- Alert notifications
- Mobile-friendly design

**Tech stack suggestions:**
- Backend: Python Flask or Node.js
- Frontend: Simple HTML/CSS/JS
- Data: SQLite for history

---

### Issue #5: Add email notifications
**Labels:** enhancement, feature
**Priority:** Medium

**Description:**
Send email alerts when critical issues are detected.

**Configuration:**
```bash
EMAIL_ENABLED=true
EMAIL_TO=admin@example.com
EMAIL_THRESHOLD=critical
```

**Triggers:**
- Disk usage > 90%
- Memory usage > 90%
- Service failures
- Security issues

---

## Bug Reports Template

### Issue #6: Command list colors not displaying in installer
**Labels:** bug, cosmetic
**Priority:** Low

**Description:**
The command list at the end of installation shows literal escape codes instead of colors.

**Current output:**
```
33[0;36mrs-inspect33[0m
```

**Expected output:**
```
rs-inspect (in cyan color)
```

**Location:** `install/install.sh` line ~130

**Fix:** Replace sed chain with while loop for proper color rendering.

---

## Documentation Issues

### Issue #7: Add video tutorial
**Labels:** documentation, help wanted
**Priority:** Low

**Description:**
Create a video tutorial showing:
- Installation process
- Basic usage for beginners
- Common troubleshooting
- Advanced features

**Platform:** YouTube
**Duration:** 5-10 minutes

---

### Issue #8: Add more usage examples
**Labels:** documentation, good first issue
**Priority:** Medium

**Description:**
Expand documentation with real-world scenarios:
- Troubleshooting slow server
- Cleaning up disk space
- Monitoring production servers
- Integration with cron jobs

**Files to update:**
- README.md
- Man page
- rs-help command

---

## Feature Requests

### Issue #9: Add plugin system
**Labels:** enhancement, feature, architecture
**Priority:** Low

**Description:**
Allow users to create custom checks and fixes as plugins.

**Structure:**
```
/usr/local/lib/rs-toolkit/plugins/
  custom-check.sh
  custom-fix.sh
```

**API:**
- Standard input/output format
- Hook system for integration
- Plugin discovery mechanism

---

### Issue #10: Add Docker support
**Labels:** enhancement, docker
**Priority:** Medium

**Description:**
Create Docker image for easy deployment and testing.

**Features:**
- Dockerfile for building image
- Docker Compose for multi-container setup
- Pre-configured for monitoring
- Volume mounts for logs

**Usage:**
```bash
docker run -it rs-toolkit rs-inspect
docker-compose up -d  # For web dashboard
```

---

### Issue #11: Add systemd service for continuous monitoring
**Labels:** enhancement, feature
**Priority:** Medium

**Description:**
Create systemd service to run rs-watch continuously and log results.

**Service file:** `/etc/systemd/system/rs-toolkit-monitor.service`

**Features:**
- Auto-start on boot
- Configurable check interval
- Log rotation
- Alert integration

**Usage:**
```bash
sudo systemctl enable rs-toolkit-monitor
sudo systemctl start rs-toolkit-monitor
```

---

### Issue #12: Add support for remote servers
**Labels:** enhancement, feature
**Priority:** Low

**Description:**
Allow monitoring multiple servers from a central location.

**Features:**
- SSH-based remote execution
- Centralized dashboard
- Multi-server reports
- Inventory management

**Example:**
```bash
rs-inspect --remote server1,server2,server3
rs-report --all-servers > combined-report.txt
```

---

## Testing Issues

### Issue #13: Add integration tests
**Labels:** testing, enhancement
**Priority:** Medium

**Description:**
Create integration tests that verify end-to-end functionality.

**Test scenarios:**
- Full installation process
- All commands execute without errors
- Fix commands actually fix issues
- Documentation is accessible

**Framework:** BATS (Bash Automated Testing System)

---

### Issue #14: Add performance benchmarks
**Labels:** testing, performance
**Priority:** Low

**Description:**
Measure and track command execution times.

**Metrics:**
- Command startup time
- Data collection time
- Report generation time
- Memory usage

**Goal:** All commands < 2 seconds

---

## Community Issues

### Issue #15: Add CONTRIBUTING.md
**Labels:** documentation, community
**Priority:** High

**Description:**
Create contribution guidelines for new contributors.

**Include:**
- Code style guide
- Commit message format
- Pull request process
- Testing requirements
- Code of conduct

---

### Issue #16: Add issue templates
**Labels:** documentation, community
**Priority:** Medium

**Description:**
Create GitHub issue templates for:
- Bug reports
- Feature requests
- Documentation improvements
- Questions

**Benefits:**
- Consistent issue format
- Required information captured
- Easier triage

---

## Security Issues

### Issue #17: Add security audit command
**Labels:** enhancement, security
**Priority:** High

**Description:**
Enhance rs-inspect-security with more checks:
- Open ports scan
- Weak password detection
- Outdated packages
- Security updates available
- File permission issues

---

### Issue #18: Add encrypted configuration
**Labels:** enhancement, security
**Priority:** Medium

**Description:**
Encrypt sensitive configuration data (email passwords, API keys).

**Features:**
- Encrypted config storage
- Secure key management
- Password prompts
- Environment variable support

---

## Quick Wins (Good First Issues)

### Issue #19: Add command aliases
**Labels:** enhancement, good first issue
**Priority:** Low

**Description:**
Create shorter aliases for common commands:
```bash
rsi -> rs-inspect
rsd -> rs-diagnose
rsf -> rs-fix-disk
```

---

### Issue #20: Add color themes
**Labels:** enhancement, good first issue
**Priority:** Low

**Description:**
Support different color schemes:
- Default (current)
- Dark mode
- Light mode
- Monochrome (for terminals without color)

**Config:**
```bash
COLOR_THEME=dark
```

---

## Priority Summary

**High Priority:**
- Issue #15: CONTRIBUTING.md
- Issue #17: Enhanced security audit

**Medium Priority:**
- Issue #1: --dry-run support
- Issue #2: Configuration file
- Issue #5: Email notifications
- Issue #8: More examples
- Issue #10: Docker support
- Issue #11: Systemd service
- Issue #13: Integration tests
- Issue #16: Issue templates
- Issue #18: Encrypted config

**Low Priority:**
- Issue #3: JSON output
- Issue #4: Web dashboard
- Issue #6: Installer colors (cosmetic)
- Issue #7: Video tutorial
- Issue #9: Plugin system
- Issue #12: Remote servers
- Issue #14: Performance benchmarks
- Issue #19: Command aliases
- Issue #20: Color themes
