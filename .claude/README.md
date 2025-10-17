# Claude Commands Configuration

This directory contains Claude Commands configuration for your project.

## Structure

```
.claude/
├── commands/          ← Command definitions (symlinks to main repo)
│   ├── prime          → Main entry point
│   ├── feature        → Feature planning
│   ├── bug            → Bug fix planning
│   └── chore          → Chore/refactor planning
│
└── project/           ← Project-specific customization
    ├── design-system.md   (optional) - Your design system
    ├── domain.md          (optional) - Your domain knowledge
    ├── version.md         (optional) - Your version strategy
    └── mcp.md             (optional) - Your MCP configuration
```

## Commands Available

### /prime
Load minimal project context (~4.5K tokens)

**Usage:**
```
/prime
```

**What it does:**
- Detects project type (SwiftUI, React, Python)
- Loads architecture patterns
- Reports available customization
- Fast (< 2 seconds)

### /feature
Plan a new feature

**Usage:**
```
/feature "add user authentication"
/feature "add dark mode support"
```

**What it does:**
- Auto-loads design system (for UI features)
- Auto-loads domain knowledge (for business logic)
- Generates implementation plan
- Outputs to `specs/feature-*.md`

### /bug
Plan a bug fix

**Usage:**
```
/bug "login fails with special characters in email"
```

**What it does:**
- Analyzes issue
- Identifies root cause
- Generates fix plan
- Outputs to `specs/bug-*.md`

### /chore
Plan a chore or refactor

**Usage:**
```
/chore "refactor payment processing to use Stripe v3 API"
```

**What it does:**
- Plans refactoring
- Identifies files to change
- Generates step-by-step plan
- Outputs to `specs/chore-*.md`

## Customization

To customize Claude Commands for your project, add files to `.claude/project/`:

### 1. Design System (Optional)

Create `.claude/project/design-system.md`:

```bash
# Copy template
cp path/to/claude-commands/templates/design-system-template.md .claude/project/design-system.md

# Customize for your project
# - Add your colors
# - Add your typography
# - Add your spacing
# - etc.
```

**Used by:** Feature planning for UI features

### 2. Domain Knowledge (Optional)

Create `.claude/project/domain.md`:

```bash
# Copy template
cp path/to/claude-commands/templates/domain-template.md .claude/project/domain.md

# Customize for your domain
# - Define entities
# - Add calculations
# - Document workflows
# - Add validation rules
```

**Used by:** Feature planning for business logic

### 3. Version Strategy (Optional)

Create `.claude/project/version.md`:

```bash
# Copy template
cp path/to/claude-commands/templates/version-template.md .claude/project/version.md

# Customize for your platform
# - Set minimum version
# - Define patterns to use/avoid
# - Document migration strategy
```

**Used by:** All planning and implementation

### 4. MCP Configuration (Optional)

Create `.claude/project/mcp.md`:

```bash
# Copy template
cp path/to/claude-commands/templates/mcp-template.md .claude/project/mcp.md

# Customize for your build system
# - Add build commands
# - Add test commands
# - Add pre-commit checks
```

**Used by:** Implementation and validation

## Examples

See `examples/baking-app/` for a complete customization example:
- Design system with metric colors
- Domain knowledge for baker's percentages
- iOS version strategy
- XcodeBuildMCP configuration

## Quick Start

1. **Prime your project:**
   ```
   /prime
   ```

2. **Plan a feature:**
   ```
   /feature "add user profile screen"
   ```

3. **Implement the feature:**
   ```
   /implement specs/feature-user-profile-screen.md
   ```

That's it! Claude Commands will follow your architecture patterns and customization automatically.

## Support

- Documentation: `docs/`
- Templates: `templates/`
- Examples: `examples/`
- Repository: https://github.com/yourusername/claude-commands

---

**Happy coding!** 🎉
