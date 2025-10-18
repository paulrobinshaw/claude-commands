# Claude Commands Distribution

This is a clean distribution of Claude Commands ready to install in your project.

## Installation

Copy this entire directory to your project's `.claude` directory:

```bash
cp -r dist/ /path/to/your-project/.claude/
```

Or if you're already in your project:

```bash
cp -r /path/to/claude-commands/dist/* .claude/
```

## Verification

After installation, your `.claude/commands/` should contain:
- prime
- feature
- bug
- chore
- implement

Run `/prime` in Claude Code to verify installation.

## Architecture

Claude Commands uses a **loader/knowledge pattern** that separates command logic from project data.

**Quick Overview:**

| Directory | Purpose | Edit? |
|-----------|---------|-------|
| `commands/` | Command entry points | No (unless contributing) |
| `loaders/` | Load knowledge files | No (unless contributing) |
| **`project/`** | **Your project data** | **Yes - customize this!** |
| `templates/` | Starting point examples | Copy to project/ |
| `routers/` | Tech detection | No (unless contributing) |

**Key Insight:** Only files in `.claude/project/` are meant for customization.

### Understanding the Pattern

**Why two files named `domain.md`?**

- `.claude/loaders/domain.md` - Command that **loads** domain knowledge (universal)
- `.claude/project/domain.md` - Your **actual** domain knowledge (project-specific)

Think of it like:
- **Loader** = "How to read your domain knowledge" (same for everyone)
- **Knowledge** = "Your domain knowledge" (unique to your project)

**Benefits:**
- Loaders are reusable across all projects
- Knowledge files are portable and shareable
- Updates to commands don't affect your data
- Clear separation of concerns

For full details, see: [docs/architecture.md](docs/architecture.md)

## Customization

### Quick Start

**Step 1:** Copy templates to project directory
```bash
cp .claude/templates/domain-template.md .claude/project/domain.md
cp .claude/templates/design-system-template.md .claude/project/design-system.md
```

**Step 2:** Edit with your project data
```bash
# Edit .claude/project/domain.md with YOUR business rules
# Edit .claude/project/design-system.md with YOUR design tokens
```

**Step 3:** Use the commands
```bash
/prime                    # Load architecture
/feature "add dark mode"  # Knowledge auto-loads as needed
```

### What to Customize

**DO customize** (files in `.claude/project/`):
- `domain.md` - Your business domain knowledge
- `design-system.md` - Your design tokens and patterns
- `version.md` - Your version requirements
- `mcp.md` - Your MCP server configuration

**DON'T customize** (infrastructure):
- `commands/` - Command entry points
- `loaders/` - Loader command logic
- `routers/` - Technology routing
- `swiftui/` - SwiftUI planners

### Available Files

All files in `.claude/project/` are optional - create only what you need:

- `domain.md` - Business rules, formulas, terminology (for domain-heavy apps)
- `design-system.md` - UI tokens, colors, typography (for UI customization)
- `version.md` - iOS version, Swift version, dependencies (recommended)
- `mcp.md` - MCP servers for build, test, filesystem tools (optional)

### Templates

Templates in `.claude/templates/` provide starting points:
- Copy to `.claude/project/`
- Rename (remove `-template` suffix)
- Customize with your project data

See: [templates/README.md](templates/README.md)

## Documentation

- **Architecture:** [docs/architecture.md](docs/architecture.md) - Detailed pattern explanation
- **Loaders:** [loaders/README.md](loaders/README.md) - About loader commands
- **Project:** [project/README.md](project/README.md) - About knowledge files
- **Templates:** [templates/README.md](templates/README.md) - Using templates
