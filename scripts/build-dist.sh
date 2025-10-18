#!/bin/bash
# Build clean distribution package

set -e

echo "🔨 Building distribution package..."

# Clean previous build
rm -rf dist/
mkdir -p dist/{commands,project}

# Copy core commands (MUST preserve .md extension for Claude Code)
echo "📦 Copying core commands..."
cp core/prime.md dist/commands/prime.md
cp core/feature.md dist/commands/feature.md
cp core/bug.md dist/commands/bug.md
cp core/chore.md dist/commands/chore.md
cp core/implement.md dist/commands/implement.md

# Copy supporting directories
echo "📦 Copying supporting files..."
mkdir -p dist/routers dist/loaders dist/swiftui dist/docs dist/templates
cp -r routers/* dist/routers/
cp -r loaders/* dist/loaders/
cp -r swiftui/* dist/swiftui/

# Copy documentation
echo "📚 Copying documentation..."
cp -r .claude/docs/* dist/docs/

# Copy templates
echo "📋 Copying templates..."
cp -r templates/* dist/templates/

# Create empty project directory for user customizations
echo "📁 Creating project directory..."
mkdir -p dist/project
touch dist/project/.gitkeep

# Copy main README (updated with architecture section)
echo "📄 Copying main README..."
cp .claude/README.md dist/README.md

echo "✅ Distribution built successfully in dist/"
echo ""
echo "Distribution contains:"
find dist -type f | head -20
echo ""
echo "Total files: $(find dist -type f | wc -l)"
echo "Total size: $(du -sh dist/ | cut -f1)"
