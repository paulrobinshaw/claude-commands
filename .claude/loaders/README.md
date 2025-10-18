# Loaders

Command templates that load project-specific knowledge files.

## Purpose

Loaders are **command logic** - they define HOW to read and load your project-specific knowledge. They are universal and work across all projects.

**Do not edit these files** unless you are modifying command behavior or contributing to claude-commands.

## How Loaders Work

Each loader:
1. Checks if the corresponding knowledge file exists
2. Reads the knowledge file from `.claude/project/`
3. Loads the content into the conversation context
4. Reports what was loaded

Think of loaders as "readers" - they know how to read your knowledge files.

## Available Loaders

### `domain.md`

**Command:** `/domain`
**Reads:** `.claude/project/domain.md`
**Loads:** Business domain knowledge, rules, formulas, terminology
**Context:** ~8,000 tokens (4%)
**Auto-loads:** When feature planners detect domain keywords

**When to use:**
- Manually load domain knowledge before planning
- Domain-heavy features
- Need to reference business rules
- Auto-loading didn't trigger

### `design-system.md`

**Command:** `/design-system` or `/ds`
**Reads:** `.claude/project/design-system.md`
**Loads:** Design tokens, colors, typography, spacing, components
**Context:** ~2,000 tokens (1%)
**Auto-loads:** When feature planners detect UI work

**When to use:**
- Manually load design system before planning
- UI-focused features
- Review design tokens
- Auto-loading didn't trigger

## Loader vs Knowledge

**Common confusion:** Why are there two files named `domain.md`?

| File | Type | Purpose |
|------|------|---------|
| `.claude/loaders/domain.md` | **Loader** (command) | HOW to load domain knowledge |
| `.claude/project/domain.md` | **Knowledge** (data) | WHAT domain knowledge to load |

**Analogy:**
- **Loader** = Recipe for making tea (same for everyone)
- **Knowledge** = Your specific tea blend (unique to you)

The loader "recipe" is universal - it works with anyone's "tea blend" (knowledge file).

## When to Edit Loaders

**Rarely!** Only edit loaders if you are:

- Contributing to claude-commands
- Adding new loader functionality
- Fixing bugs in command logic
- Creating custom loader types

**For normal usage:** Edit `.claude/project/` files, not loaders.

## Customizing Knowledge

To customize what gets loaded:

**Step 1:** Copy template to project directory
```bash
cp .claude/templates/domain-template.md .claude/project/domain.md
```

**Step 2:** Edit the knowledge file (NOT the loader)
```bash
# Edit .claude/project/domain.md with YOUR domain knowledge
```

**Step 3:** Use the loader command
```bash
/domain                    # Loader reads your knowledge file
```

See: [project/README.md](../project/README.md) for more on customizing knowledge files.

## Architecture

Loaders are part of the **loader/knowledge pattern**:

```
User runs: /domain
    ↓
Read: .claude/loaders/domain.md (this file - command logic)
    ↓
Execute: "Load .claude/project/domain.md"
    ↓
Read: .claude/project/domain.md (your data)
    ↓
Context loaded: Domain knowledge available
```

For full architecture details, see: [docs/architecture.md](../docs/architecture.md)

## Benefits

**Reusability:** Loaders work with any project's knowledge files

**Maintainability:** Update loaders without affecting your data

**Clarity:** Command logic separated from data

**Portability:** Knowledge files can be shared across projects

## Related Documentation

- **Architecture:** [docs/architecture.md](../docs/architecture.md) - Full pattern explanation
- **Knowledge:** [project/README.md](../project/README.md) - About your data files
- **Templates:** [templates/README.md](../templates/README.md) - Template usage guide
- **Main README:** [README.md](../README.md) - Installation and overview

## Questions?

**Q: Which file do I edit to add my domain knowledge?**
A: Edit `.claude/project/domain.md`, not `.claude/loaders/domain.md`

**Q: Can I rename loader files?**
A: No - commands expect specific filenames

**Q: How do I create a new loader?**
A: See [docs/architecture.md](../docs/architecture.md) Contributing section

**Q: What if my knowledge file doesn't exist?**
A: Loaders will show an error and tell you how to create it from templates
