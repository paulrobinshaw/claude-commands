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

## Customization

Add your customizations to `.claude/project/`:
- design-system.md
- domain.md
- version.md
- mcp.md

See templates/ in the source repository for examples.
