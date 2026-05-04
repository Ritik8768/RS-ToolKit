# Contributing to RS-Toolkit

Thank you for your interest in contributing! 🎉

## 🚀 Quick Start

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/RS-ToolKit.git`
3. Create a branch: `git checkout -b feature/your-feature`
4. Make changes
5. Test thoroughly
6. Commit: `git commit -m "Add: your feature"`
7. Push: `git push origin feature/your-feature`
8. Create Pull Request

## 📋 Code Style

### Bash Style Guide

```bash
#!/bin/bash
# Script description

# Use meaningful variable names
DISK_USAGE=80

# Functions should have comments
check_disk() {
    local threshold=$1
    # Function logic
}

# Use colors from common.sh
echo -e "${GREEN}✓${NC} Success message"
echo -e "${RED}✗${NC} Error message"
```

### Best Practices

- ✅ Use `set -e` for error handling
- ✅ Quote variables: `"$VAR"`
- ✅ Check command existence: `command -v cmd`
- ✅ Use functions for reusability
- ✅ Add comments for complex logic
- ✅ Use meaningful variable names
- ✅ Handle errors gracefully

## 🧪 Testing

Before submitting:

```bash
# 1. Test syntax
bash -n your-script.sh

# 2. Run the command
./your-script.sh

# 3. Run test agent
sudo /home/ritik/rs-toolkit-test-agent.sh

# 4. Check for bugs
grep -n "TODO\|FIXME\|BUG" your-script.sh
```

## 📝 Commit Messages

Format: `Type: Brief description`

**Types:**
- `Add:` New feature
- `Fix:` Bug fix
- `Update:` Modify existing feature
- `Docs:` Documentation only
- `Test:` Add/update tests
- `Refactor:` Code restructuring

**Examples:**
```
Add: --dry-run flag to rs-fix-memory
Fix: Integer expression error in rs-diagnose
Update: Enhanced color palette in common.sh
Docs: Add more examples to README
```

## 🎯 Good First Issues

Perfect for beginners:
- Add --dry-run support
- Add more usage examples
- Create command aliases
- Add color themes

See: [GITHUB-ISSUES.md](GITHUB-ISSUES.md)

## 🔍 Pull Request Process

1. **Update documentation** if needed
2. **Add tests** for new features
3. **Follow code style** guidelines
4. **Test thoroughly** on your system
5. **Update CHANGELOG.md** with your changes
6. **Reference issue** number if applicable

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Code refactoring

## Testing
- [ ] Tested on Ubuntu 24.04
- [ ] All tests pass
- [ ] No syntax errors

## Checklist
- [ ] Code follows style guidelines
- [ ] Documentation updated
- [ ] CHANGELOG.md updated
- [ ] Tests added/updated
```

## 🐛 Bug Reports

Use this template:

```markdown
**Bug Description:**
Clear description of the bug

**To Reproduce:**
1. Run command: `rs-inspect`
2. See error: ...

**Expected Behavior:**
What should happen

**Environment:**
- OS: Ubuntu 24.04
- Bash: 5.1
- RS-Toolkit: 1.0.1

**Additional Context:**
Any other relevant information
```

## 💡 Feature Requests

Use this template:

```markdown
**Feature Description:**
Clear description of the feature

**Use Case:**
Why is this needed?

**Proposed Solution:**
How should it work?

**Alternatives:**
Other approaches considered
```

## 📚 Documentation

When updating docs:
- Keep it beginner-friendly
- Add examples
- Use clear language
- Update man page if needed
- Test all examples

## 🔒 Security

Found a security issue?
- **DO NOT** create a public issue
- Email: (add your email)
- We'll respond within 48 hours

## 🎨 Adding Colors

Use colors from `common.sh`:

```bash
source "/usr/local/lib/rs-toolkit/common.sh"

echo -e "${GREEN}✓${NC} Success"
echo -e "${RED}✗${NC} Error"
echo -e "${YELLOW}⚠${NC} Warning"
echo -e "${BLUE}ℹ${NC} Info"
echo -e "${CYAN}Command${NC}"
```

## 📦 Adding New Commands

1. Create script in `src/core/`
2. Add shebang and description
3. Source common library
4. Add help text
5. Implement functionality
6. Test thoroughly
7. Update documentation
8. Add to installer

## ✅ Code Review

We review for:
- Code quality
- Security
- Performance
- Documentation
- Test coverage
- Style compliance

## 🤝 Community

- Be respectful
- Be patient
- Help others
- Share knowledge
- Have fun! 🎉

## 📞 Contact

- GitHub Issues: [Create Issue](https://github.com/Ritik8768/RS-ToolKit/issues)
- Discussions: [GitHub Discussions](https://github.com/Ritik8768/RS-ToolKit/discussions)

## 🙏 Thank You!

Every contribution helps make RS-Toolkit better for everyone!

---

**Happy Contributing! 🚀**
