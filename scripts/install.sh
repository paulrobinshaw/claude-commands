#!/bin/bash
# Claude Commands Installation Script

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="${1:-.}"

echo "📦 Installing Claude Commands..."

# Check if dist exists
if [ ! -d "$REPO_DIR/dist" ]; then
    echo "❌ Distribution not built. Building now..."
    "$SCRIPT_DIR/build-dist.sh"
fi

# Create .claude directory if it doesn't exist
mkdir -p "$PROJECT_DIR/.claude"

# Copy distribution
echo "📁 Copying files to $PROJECT_DIR/.claude/..."
cp -r "$REPO_DIR/dist/"* "$PROJECT_DIR/.claude/"

echo ""
echo "✅ Installation complete!"
echo ""
echo "Your .claude/commands/ directory contains:"
ls -1 "$PROJECT_DIR/.claude/commands/"
echo ""
echo "Next steps:"
echo "1. cd $PROJECT_DIR"
echo "2. Run: /prime"
echo "3. (Optional) Customize templates in .claude/project/"
echo "4. Start building: /feature \"your feature\""
