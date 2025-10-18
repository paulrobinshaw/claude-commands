# Claude Commands Architecture

## Overview

Claude Commands uses a **separation of concerns pattern** that divides command logic from project-specific data. This architecture enables commands to be reusable across projects while allowing each project to customize its own knowledge base.

**Core Principle:** Commands (loaders) are universal, knowledge is project-specific.

---

## Directory Structure

```
.claude/
├── commands/      # Main command entry points (universal)
├── loaders/       # Knowledge loading commands (universal)
├── project/       # Project-specific knowledge (customize this!)
├── routers/       # Technology detection and routing (universal)
├── templates/     # Template files for customization (copy to project/)
├── swiftui/       # SwiftUI-specific planners (universal)
└── docs/          # Documentation (you are here)
```

**Key insight:** Only files in `.claude/project/` are meant to be customized for your project.

---

## The Loader/Knowledge Pattern

### The Pattern Explained

This architecture separates **command logic** from **data**:

- **Loaders** (in `.claude/loaders/`): Commands that read and load knowledge
- **Knowledge** (in `.claude/project/`): Your project-specific data

Think of it like this:
- **Loader** = "How to read domain knowledge"
- **Knowledge** = "Your actual domain knowledge"

### Why This Matters

**Without separation:**
```
domain.md (everything mixed together)
├── Command logic for loading
├── Instructions for Claude
└── Your baking formulas
    └── Hard to update commands
    └── Hard to share knowledge
    └── Commands and data tangled
```

**With separation:**
```
loaders/domain.md (command logic)
└── How to load domain knowledge
└── Reusable across all projects
└── Update once, works everywhere

project/domain.md (your data)
└── Your baking formulas
└── Project-specific
└── Easy to share
└── No command logic to break
```

---

## How It Works

### Example: Loading Domain Knowledge

**Step 1:** You run `/domain` (or it auto-loads during feature planning)

**Step 2:** Claude Code reads `.claude/loaders/domain.md`
- This file contains instructions for HOW to load domain knowledge
- It's a command template - same for everyone

**Step 3:** The loader reads `.claude/project/domain.md`
- This file contains YOUR domain knowledge
- Your baking formulas, business rules, terminology
- Customized for your project

**Step 4:** Domain knowledge is now available for planning

### Flow Diagram

```
User runs: /domain
    ↓
Read: .claude/loaders/domain.md (command logic)
    ↓
Execute: "Load .claude/project/domain.md"
    ↓
Read: .claude/project/domain.md (your data)
    ↓
Context loaded: Domain knowledge available
    ↓
Feature planners can now use your domain rules
```

---

## Loaders (Commands)

### What Are Loaders?

Loaders are **command templates** that:
- Define HOW to load project-specific knowledge
- Provide instructions to Claude Code
- Are reusable across all projects
- Rarely need editing

### Available Loaders

| Loader File | Reads | Purpose |
|-------------|-------|---------|
| `loaders/domain.md` | `project/domain.md` | Load business domain knowledge |
| `loaders/design-system.md` | `project/design-system.md` | Load UI design tokens/patterns |

### When to Edit Loaders

**Rarely!** Only edit loaders if you're:
- Contributing to claude-commands
- Adding new loader functionality
- Fixing bugs in command logic

**For normal usage:** Never edit loaders - edit knowledge files instead.

---

## Knowledge Files (Data)

### What Are Knowledge Files?

Knowledge files contain **your project-specific data**:
- Business domain knowledge
- Design system tokens
- Version information
- MCP configuration

### Available Knowledge Files

| Knowledge File | Contains | Example Content |
|----------------|----------|-----------------|
| `project/domain.md` | Business rules, formulas | Baking formulas, recipe rules |
| `project/design-system.md` | UI tokens, colors | Brand colors, typography |
| `project/version.md` | Version info | iOS 18+, Swift 6 |
| `project/mcp.md` | MCP servers | Build, test, filesystem tools |

### When to Edit Knowledge Files

**Often!** Edit knowledge files to:
- Add your domain knowledge
- Customize design tokens
- Update version requirements
- Configure MCP servers

**This is where you customize for YOUR project.**

---

## How They Work Together

### Example 1: Domain Knowledge

**Loader:** `.claude/loaders/domain.md`
```markdown
# Load Domain Knowledge

## Instructions
Load the full domain knowledge context.

## Step 1: Check if Domain Exists
[ -f ".claude/project/domain.md" ] && echo "Found"

## Step 2: Load Domain Knowledge
Read: `.claude/project/domain.md`
```

**Knowledge:** `.claude/project/domain.md`
```markdown
# Baking Domain Knowledge

## Core Concepts
- Recipes have ingredients and steps
- Baker's percentages calculate proportions
- Hydration affects dough consistency

## Business Rules
- Hydration = (water weight / flour weight) × 100
- All percentages relative to flour (100%)
...
```

**Result:** When you run `/domain`, the loader reads your knowledge file and makes it available to feature planners.

### Example 2: Design System

**Loader:** `.claude/loaders/design-system.md`
```markdown
# Load Design System

## Instructions
Load design system tokens and patterns.

Read: `.claude/project/design-system.md`
```

**Knowledge:** `.claude/project/design-system.md`
```markdown
# Design System

## Colors
primary: .blue
secondary: .green
background: .white

## Typography
title: .largeTitle, .bold
body: .body, .regular
...
```

**Result:** When you plan UI features, the design system auto-loads and ensures you use correct tokens.

---

## File Type Reference Table

| File Type | Location | Purpose | When to Edit |
|-----------|----------|---------|--------------|
| **Commands** | `.claude/commands/` | Main entry points (/prime, /feature, /bug) | Rarely (contributing) |
| **Loaders** | `.claude/loaders/` | Load knowledge files | Rarely (contributing) |
| **Knowledge** | `.claude/project/` | Project-specific data | **Often (this is yours!)** |
| **Routers** | `.claude/routers/` | Tech detection and routing | Rarely (contributing) |
| **Templates** | `.claude/templates/` | Example knowledge files | **Copy to project/** |
| **Tech-specific** | `.claude/swiftui/` | SwiftUI planners | Rarely (contributing) |

**Key Takeaway:** You mainly work with files in `.claude/project/` - everything else is infrastructure.

---

## Setup Guide

### Quick Start

**Step 1:** Install claude-commands (copy dist/ to your project)

**Step 2:** Copy templates to project directory
```bash
cp .claude/templates/domain-template.md .claude/project/domain.md
cp .claude/templates/design-system-template.md .claude/project/design-system.md
```

**Step 3:** Customize the knowledge files
```bash
# Edit .claude/project/domain.md with YOUR domain knowledge
# Edit .claude/project/design-system.md with YOUR design tokens
```

**Step 4:** Use the commands
```bash
/prime                          # Load architecture
/domain                         # Load domain knowledge (or auto-loads)
/feature "add dark mode"        # Create feature plan
```

### What to Customize

**DO customize:**
- `.claude/project/domain.md` - Your business domain
- `.claude/project/design-system.md` - Your design tokens
- `.claude/project/version.md` - Your version requirements
- `.claude/project/mcp.md` - Your MCP configuration

**DO NOT customize:**
- `.claude/commands/` - Command entry points
- `.claude/loaders/` - Loader commands
- `.claude/routers/` - Routing logic
- `.claude/swiftui/` - SwiftUI planners

### Templates

**Purpose:** Starting points for your knowledge files

**Location:** `.claude/templates/`

**Usage:**
1. Copy template to `.claude/project/`
2. Rename (remove `-template` suffix)
3. Customize with your project data

**Available Templates:**
- `domain-template.md` - Example domain knowledge
- `design-system-template.md` - Example design tokens
- `mcp-template.md` - Example MCP configuration
- `version-template.md` - Example version info

---

## Benefits of This Architecture

### For Users

**Clarity**
- Clear separation between commands and data
- Know exactly where to make changes
- No confusion about file purposes

**Portability**
- Share knowledge files across projects
- Reuse domain knowledge in multiple apps
- Easy to version control

**Ease of Use**
- Copy templates and customize
- No need to understand command logic
- Focus on your project, not infrastructure

### For Contributors

**Maintainability**
- Update commands without affecting user data
- Bug fixes don't require user changes
- Clear responsibilities for each file

**Reusability**
- Commands work with any project's knowledge
- Write once, use everywhere
- Technology-specific variations are isolated

**Extensibility**
- Easy to add new knowledge types
- Follow existing loader/knowledge pattern
- Consistent architecture across features

---

## Common Questions

### Q: Why are there two files named `domain.md`?

**A:** One is the **command** (loader), one is your **data** (knowledge).

- `.claude/loaders/domain.md` = Command that loads domain knowledge
- `.claude/project/domain.md` = Your actual domain knowledge

They have the same name because they're related, but different purposes.

### Q: Which file do I edit?

**A:** Edit files in `.claude/project/`, not `.claude/loaders/`.

**Edit this:**
- `.claude/project/domain.md` - Add your domain knowledge

**Don't edit this:**
- `.claude/loaders/domain.md` - Command logic (unless contributing)

### Q: Can I rename these files?

**A:** No, commands expect specific filenames.

The loaders look for specific paths:
- `/domain` expects `.claude/project/domain.md`
- `/design-system` expects `.claude/project/design-system.md`

Renaming breaks the connection.

### Q: How do I add new knowledge types?

**A:** Follow the existing loader/knowledge pattern:

1. Create loader: `.claude/loaders/my-knowledge.md`
2. Create knowledge: `.claude/project/my-knowledge.md`
3. Create template: `.claude/templates/my-knowledge-template.md`
4. Update command to call loader

See existing loaders for examples.

### Q: What if I update claude-commands?

**A:** Your knowledge files are preserved.

When you update claude-commands (copy new dist/):
- Commands/loaders/routers are updated
- Your `.claude/project/` files are NOT touched
- Your customizations remain intact

### Q: Do I need all knowledge files?

**A:** No, only create what you need.

- `domain.md` - Optional (for domain-heavy apps)
- `design-system.md` - Optional (for UI customization)
- `version.md` - Recommended
- `mcp.md` - Optional (if using MCP tools)

Commands check if files exist before loading.

### Q: Can I share knowledge files?

**A:** Yes! That's a key benefit.

Knowledge files are pure data:
- Share across your projects
- Version control them
- Create libraries of domain knowledge
- Reuse design systems

---

## Architecture Principles

### 1. Separation of Concerns

**Commands** know HOW to load knowledge
**Knowledge** contains WHAT to load

Never mix command logic with data.

### 2. Lazy Loading

Don't load everything upfront:
- `/prime` loads minimal context
- Feature planners auto-load what they need
- Manual loaders for explicit loading
- ~2-6% of context window used

### 3. Convention Over Configuration

Standard file names and locations:
- `loaders/domain.md` always loads `project/domain.md`
- No config files to maintain
- Predictable structure

### 4. Progressive Enhancement

Start simple, add as needed:
- Minimal setup works out of the box
- Add knowledge files as project grows
- Customize only what you need

### 5. Reusability

Write once, use everywhere:
- Commands work with any project
- Knowledge files are portable
- Technology-specific variations are isolated

---

## Examples in Practice

### Example: New SwiftUI Project

**Step 1:** Install claude-commands
```bash
cp -r /path/to/claude-commands/dist/* .claude/
```

**Step 2:** Add design system (optional)
```bash
cp .claude/templates/design-system-template.md .claude/project/design-system.md
# Edit with your brand colors
```

**Step 3:** Start building
```bash
/prime
/feature "user profile screen"
# Design system auto-loads, provides tokens
```

### Example: Domain-Heavy App (Baking)

**Step 1:** Install claude-commands

**Step 2:** Add domain knowledge
```bash
cp .claude/templates/domain-template.md .claude/project/domain.md
# Edit with baking formulas, rules
```

**Step 3:** Build features
```bash
/prime
/feature "calculate hydration percentage"
# Domain auto-loads, provides formulas
```

### Example: Team Project

**Step 1:** Project lead sets up knowledge
```bash
# Add design system
.claude/project/design-system.md (team brand)

# Add domain knowledge
.claude/project/domain.md (business rules)

# Commit to git
git add .claude/project/
git commit -m "Add project knowledge base"
```

**Step 2:** Team members use commands
```bash
/prime
/feature "any feature"
# Everyone uses same design tokens
# Everyone follows same business rules
```

---

## Advanced Topics

### Auto-Loading

Feature planners auto-load knowledge when needed:

**Design System:** Auto-loads when:
- Feature mentions UI keywords (view, button, screen)
- SwiftUI features detected
- UI work required

**Domain Knowledge:** Auto-loads when:
- Feature mentions domain keywords (from your domain.md)
- Business logic required
- Domain-specific features

**Manual Loading:** Use `/domain` or `/design-system` to load explicitly.

### Context Management

**Token Budget:**
- `/prime`: ~4,500 tokens (2%)
- Design system: ~2,000 tokens (1%)
- Domain: ~8,000 tokens (4%)
- Total: ~6-14K tokens (3-7%)
- Remaining: ~186K tokens for work (93-97%)

**Strategy:**
- Lazy loading minimizes context use
- Auto-loading adds context only when needed
- Explicit loading for manual control

### Versioning

**claude-commands versions:**
- Update by copying new dist/
- Your project/ files unaffected
- Backward compatible

**Your knowledge versions:**
- Version control `.claude/project/`
- Share knowledge files across projects
- Create knowledge libraries

---

## Troubleshooting

### "Domain knowledge not found"

**Problem:** `.claude/project/domain.md` doesn't exist

**Solution:**
```bash
cp .claude/templates/domain-template.md .claude/project/domain.md
# Edit with your domain knowledge
```

### "Design system not found"

**Problem:** `.claude/project/design-system.md` doesn't exist

**Solution:**
```bash
cp .claude/templates/design-system-template.md .claude/project/design-system.md
# Edit with your design tokens
```

### Commands not working

**Problem:** `.claude/commands/` missing or incorrect

**Solution:**
```bash
# Reinstall claude-commands
cp -r /path/to/claude-commands/dist/* .claude/
# Preserve your project/ customizations
```

### Knowledge not loading

**Problem:** File exists but not loading

**Check:**
1. File is in `.claude/project/` (not `.claude/loaders/`)
2. File name matches exactly (`domain.md`, not `Domain.md`)
3. File has content (not empty)
4. Loader expects this file name

---

## Contributing

### Adding New Knowledge Types

**Step 1:** Create loader template
```markdown
# .claude/loaders/my-knowledge.md

# Load My Knowledge

Read: `.claude/project/my-knowledge.md`

# Present the loaded knowledge
```

**Step 2:** Create knowledge template
```markdown
# .claude/templates/my-knowledge-template.md

# My Knowledge

## Section 1
Content...

## Section 2
Content...
```

**Step 3:** Document usage
- Update this architecture.md
- Add to templates/README.md
- Update main README.md

**Step 4:** Test
- Copy template to project/
- Run loader command
- Verify auto-loading (if applicable)

### Pull Requests

When contributing:
1. Follow existing loader/knowledge pattern
2. Update documentation
3. Test with fresh installation
4. Ensure backward compatibility

---

## Related Documentation

- **Installation:** `.claude/README.md`
- **Loaders:** `.claude/loaders/README.md`
- **Knowledge:** `.claude/project/README.md`
- **Templates:** `.claude/templates/README.md`
- **Customization:** `docs/customization-guide.md`
- **Contributing:** `docs/contributing.md`

---

## Summary

**The loader/knowledge pattern separates command logic from data:**

- **Loaders** (`.claude/loaders/`): HOW to load knowledge - universal, rarely edit
- **Knowledge** (`.claude/project/`): WHAT to load - project-specific, edit often
- **Templates** (`.claude/templates/`): Starting points - copy and customize

**This architecture provides:**
- Clear separation of concerns
- Reusable commands
- Portable knowledge
- Easy customization
- Maintainable codebase

**Your workflow:**
1. Install claude-commands
2. Copy templates to `.claude/project/`
3. Customize with your data
4. Use commands to build features

**Remember:** Only edit files in `.claude/project/` - everything else is infrastructure.

---

For questions or contributions, see the main repository documentation.
