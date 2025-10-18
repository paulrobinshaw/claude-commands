# Project Knowledge Files

Project-specific knowledge files loaded by loader commands.

## Purpose

This directory contains **your project's data** - business domain knowledge, design tokens, version info, and configuration.

**Edit these files** to customize Claude Commands for your specific project.

## Quick Start

**Step 1:** Copy templates
```bash
cp .claude/templates/domain-template.md .claude/project/domain.md
cp .claude/templates/design-system-template.md .claude/project/design-system.md
```

**Step 2:** Customize with your data
```bash
# Edit domain.md with YOUR business rules, formulas, terminology
# Edit design-system.md with YOUR colors, typography, spacing
```

**Step 3:** Use commands
```bash
/prime                          # Load architecture
/feature "add user profile"     # Knowledge auto-loads as needed
```

## Available Files

All files are optional - create only what you need for your project.

### `domain.md`

**Purpose:** Business domain knowledge, rules, formulas, terminology
**Template:** `.claude/templates/domain-template.md`
**Auto-loads:** When feature planners detect domain keywords

**When to create:**
- Domain-heavy applications
- Complex business rules
- Domain-specific calculations
- Industry terminology

### `design-system.md`

**Purpose:** Design tokens, colors, typography, spacing, components
**Template:** `.claude/templates/design-system-template.md`
**Auto-loads:** When feature planners detect UI work

**When to create:**
- Want consistent UI
- Have brand colors
- Use design tokens
- Building component library

### `version.md`

**Purpose:** Platform versions, SDK versions, dependencies
**Template:** `.claude/templates/version-template.md`
**Auto-loads:** Always (part of priming)

**When to create:**
- Recommended for all projects
- Ensures correct API usage
- Documents requirements

### `mcp.md`

**Purpose:** MCP server configuration
**Template:** `.claude/templates/mcp-template.md`
**Auto-loads:** Always (part of priming)

**When to create:**
- Using MCP tools
- Automated builds
- Test execution

## Documentation

- **Architecture:** [../docs/architecture.md](../docs/architecture.md)
- **Loaders:** [../loaders/README.md](../loaders/README.md)
- **Templates:** [../templates/README.md](../templates/README.md)
