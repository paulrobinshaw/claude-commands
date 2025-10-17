#!/bin/bash
# Archive a completed spec with timestamp

# Usage: ./scripts/archive-spec.sh specs/feature-dark-mode.md
# Result: specs/done/2025-10-17-2154-feature-dark-mode.md

set -e

SPEC_FILE="$1"

# Validation
if [ -z "$SPEC_FILE" ]; then
    echo "❌ Usage: $0 <spec-file>"
    echo ""
    echo "Example:"
    echo "  $0 specs/feature-dark-mode.md"
    exit 1
fi

if [ ! -f "$SPEC_FILE" ]; then
    echo "❌ Error: File not found: $SPEC_FILE"
    exit 1
fi

# Check if already in done/ directory
if [[ "$SPEC_FILE" == *"/done/"* ]]; then
    echo "⚠️  Spec is already archived: $SPEC_FILE"
    exit 0
fi

# Create done directory
SPECS_DIR="$(dirname "$SPEC_FILE")"
DONE_DIR="$SPECS_DIR/done"
mkdir -p "$DONE_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d-%H%M")

# Extract filename
FILENAME=$(basename "$SPEC_FILE")

# Build archived filename
ARCHIVED_FILE="$DONE_DIR/${TIMESTAMP}-${FILENAME}"

# Handle duplicate filenames (if same spec archived twice in same minute)
COUNTER=1
while [ -f "$ARCHIVED_FILE" ]; do
    COUNTER=$((COUNTER + 1))
    ARCHIVED_FILE="$DONE_DIR/${TIMESTAMP}-${FILENAME%.md}-${COUNTER}.md"
done

# Move and report
mv "$SPEC_FILE" "$ARCHIVED_FILE"
echo "✅ Archived: $SPEC_FILE"
echo "   → $ARCHIVED_FILE"
