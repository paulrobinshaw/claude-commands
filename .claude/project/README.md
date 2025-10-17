# Project Customization: Claude Commands

This directory contains project-specific customization for **Claude Commands developing itself** (dogfooding).

---

## What's Here

### domain.md

Domain knowledge about Claude Commands:
- Entities (Command, Context, Technology)
- Calculations (token budgets, routing paths)
- Workflows (adding commands, adding technologies)
- Terminology (lazy loading, smart routing, etc.)

**When loaded:** Auto-loads when working on Claude Commands features

**Keywords that trigger loading:**
- command, router, loader, technology
- lazy loading, smart routing, context
- token budget, architecture enforcement

### version.md

Version strategy for Claude Commands:
- File standards (Markdown commands)
- Command patterns (core, router, technology)
- Git conventions (commits, branches)
- Release process

**When loaded:** Always (small file)

---

## How to Use

### Developing Claude Commands

When working on Claude Commands, you can use Claude Commands to help!

**1. Prime the project:**
```bash
cd claude-commands
/prime
```

**Expected output:**
```
✅ Project primed successfully

Technology: Markdown/Documentation project
Domain Knowledge: Available ✅ (Claude Commands domain)
Version Strategy: Loaded ✅

Ready to work on Claude Commands!
```

**2. Plan a new feature:**
```bash
/feature "add React support"
```

Claude will:
- Load domain knowledge about Claude Commands
- Understand the command structure
- Generate a plan for adding React support
- Output to specs/feature-add-react-support.md

**3. Plan a bug fix:**
```bash
/bug "prime doesn't detect Python projects"
```

Claude will:
- Understand the detection workflow
- Analyze the issue
- Generate a fix plan
- Output to specs/bug-prime-python-detection.md

**4. Plan a refactor:**
```bash
/chore "refactor router detection logic"
```

Claude will:
- Understand the router pattern
- Plan the refactoring
- Output to specs/chore-refactor-router.md

---

## Dogfooding Benefits

**Using Claude Commands to develop Claude Commands:**

1. **Tests the system** - Real-world usage
2. **Validates patterns** - Ensures commands work well
3. **Finds issues** - Discovers UX problems
4. **Improves quality** - Forces us to use what we build
5. **Sets example** - Shows users how to customize

---

## Customization Guidelines

This customization is specific to Claude Commands. When creating your own project:

**DON'T copy this** - It's specific to Claude Commands

**DO follow the pattern:**
1. Document your domain (entities, calculations, workflows)
2. Define your version strategy (patterns, conventions)
3. Add keywords for auto-loading
4. Test with your actual work

---

## Example Usage Session

```bash
# Start working on Claude Commands
cd ~/dev/claude-commands

# Prime the project
/prime

# Output:
# ✅ Detected: Documentation project
# 📚 Domain: Claude Commands development
# 🔧 Version: v1.0.0 conventions loaded

# Plan adding React support
/feature "add React support with component templates"

# Output:
# ✅ Loaded domain knowledge (command structure, workflows)
# 📋 Generated: specs/feature-add-react-support.md
#
# Plan includes:
# 1. Create commands/react/ directory
# 2. Create prime.md, architecture.md, feature.md
# 3. Update core/prime.md detection
# 4. Update routers with React routing
# 5. Add React examples
# 6. Update documentation

# Review the plan
cat specs/feature-add-react-support.md

# Implement step by step
/implement specs/feature-add-react-support.md
```

---

## Notes

- This is Claude Commands using Claude Commands (meta!)
- Update domain.md when adding new concepts
- Update version.md when patterns change
- Run /prime when starting work on Claude Commands
- The system helps you build the system 🤯

---

**Dogfooding in action!** 🐕🍖
