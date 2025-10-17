#!/bin/bash
# Build clean distribution package

set -e

echo "🔨 Building distribution package..."

# Clean previous build
rm -rf dist/
mkdir -p dist/{commands,project}

# Copy core commands (remove .md extension for cleaner slash commands)
echo "📦 Copying core commands..."
cp core/prime.md dist/commands/prime
cp core/feature.md dist/commands/feature
cp core/bug.md dist/commands/bug
cp core/chore.md dist/commands/chore
cp core/implement.md dist/commands/implement

# Copy supporting directories
echo "📦 Copying supporting files..."
mkdir -p dist/routers dist/loaders dist/swiftui
cp -r routers/* dist/routers/
cp -r loaders/* dist/loaders/
cp -r swiftui/* dist/swiftui/

# Create empty project directory for user customizations
echo "📁 Creating project directory..."
touch dist/project/.gitkeep

# Create README for dist
cat > dist/README.md << 'EOF'
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
EOF

echo "✅ Distribution built successfully in dist/"
echo ""
echo "Distribution contains:"
find dist -type f | head -20
echo ""
echo "Total files: $(find dist -type f | wc -l)"
echo "Total size: $(du -sh dist/ | cut -f1)"
