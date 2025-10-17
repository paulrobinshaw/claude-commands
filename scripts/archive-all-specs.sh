#!/bin/bash
# Archive all specs in specs/ directory

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📦 Archiving all specs in specs/"
echo ""

# Count specs to archive
SPEC_COUNT=$(find specs -maxdepth 1 -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')

if [ "$SPEC_COUNT" -eq 0 ]; then
    echo "No specs to archive in specs/"
    exit 0
fi

echo "Found $SPEC_COUNT spec(s) to archive"
echo ""

# Find all .md files in specs/ (not in subdirectories)
for spec in specs/*.md; do
    if [ -f "$spec" ]; then
        "$SCRIPT_DIR/archive-spec.sh" "$spec"
    fi
done

echo ""
echo "✅ All specs archived ($SPEC_COUNT file(s))"
echo ""
echo "View archived specs:"
echo "  ls -lt specs/done/"
