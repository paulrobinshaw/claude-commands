# Feature: Archive Completed Implementation Specs

## Overview

Automatically move completed implementation specs to a "done" directory and timestamp them with the current date and time. This helps keep the `specs/` directory clean and provides a historical record of completed work.

## User Stories

**As a developer using claude-commands:**
- I want completed specs automatically archived after implementation
- I want to see when each spec was completed (timestamp)
- I want a clean `specs/` directory showing only pending work
- I want to be able to review completed work in a `specs/done/` archive

**As a contributor to claude-commands:**
- I want a reusable script that can be called after `/implement` completes
- I want the archive process to be optional (user can opt-out)
- I want timestamps to be clear and sortable

## Feature Description

When a spec is successfully implemented, it should be:
1. Moved from `specs/` to `specs/done/`
2. Timestamped with the completion date/time
3. Original filename preserved with timestamp prefix

**Example:**
- Before: `specs/feature-dark-mode.md`
- After: `specs/done/2025-10-17-2154-feature-dark-mode.md`

## Architecture Decisions

### Script vs Built-in Command

**Decision:** Create a standalone script (`scripts/archive-spec.sh`)

**Rationale:**
- Reusable across different workflows
- Can be called manually or automatically
- Easy to test independently
- Follows existing pattern (build-dist.sh, install.sh)

### Timestamp Format

**Decision:** Use `YYYY-MM-DD-HHMM` format

**Rationale:**
- Sortable (chronological order in file listings)
- Human-readable
- No special characters that break in filesystems
- Compact (doesn't make filenames too long)

**Example:** `2025-10-17-2154-feature-dark-mode.md`

### Directory Structure

**Decision:** Create `specs/done/` subdirectory

**Rationale:**
- Keeps all specs in `specs/` hierarchy
- Easy to .gitignore if desired
- Clear separation of active vs completed
- Simple to browse completed work

### Integration Point

**Decision:** Manual invocation, with optional auto-invocation

**Rationale:**
- User controls when specs are archived
- Can be integrated into `/implement` in future
- Allows review before archiving
- Flexibility for different workflows

## Implementation Plan

### Step 1: Create Archive Script

**File:** `scripts/archive-spec.sh`

**Functionality:**
```bash
#!/bin/bash
# Archive a completed spec with timestamp

# Usage: ./scripts/archive-spec.sh specs/feature-dark-mode.md
# Result: specs/done/2025-10-17-2154-feature-dark-mode.md

set -e

SPEC_FILE="$1"

# Validation
if [ -z "$SPEC_FILE" ]; then
    echo "Usage: $0 <spec-file>"
    exit 1
fi

if [ ! -f "$SPEC_FILE" ]; then
    echo "Error: File not found: $SPEC_FILE"
    exit 1
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

# Move and report
mv "$SPEC_FILE" "$ARCHIVED_FILE"
echo "✅ Archived: $SPEC_FILE"
echo "   → $ARCHIVED_FILE"
```

### Step 2: Make Script Executable

```bash
chmod +x scripts/archive-spec.sh
```

### Step 3: Update .gitignore (Optional)

Add option to ignore archived specs:

```gitignore
# Archived specs (optional - commit if you want history)
specs/done/
```

**Note:** User can choose whether to commit archived specs or not.

### Step 4: Add Bulk Archive Script

**File:** `scripts/archive-all-specs.sh`

For archiving multiple specs at once:

```bash
#!/bin/bash
# Archive all specs in specs/ directory

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📦 Archiving all specs in specs/"
echo ""

# Find all .md files in specs/ (not in subdirectories)
for spec in specs/*.md; do
    if [ -f "$spec" ]; then
        echo "Archiving: $spec"
        "$SCRIPT_DIR/archive-spec.sh" "$spec"
    fi
done

echo ""
echo "✅ All specs archived"
echo "View archived specs: ls -la specs/done/"
```

### Step 5: Documentation Updates

**Add to README.md:**

```markdown
### Managing Completed Specs

After implementing a feature, you can archive the spec:

```bash
# Archive a single spec
./scripts/archive-spec.sh specs/feature-dark-mode.md

# Archive all specs
./scripts/archive-all-specs.sh
```

Archived specs are moved to `specs/done/` with timestamps:
- `specs/done/2025-10-17-2154-feature-dark-mode.md`
```

**Add to ARCHITECTURE.md:**

Document the workflow:
```
Plan → specs/feature-*.md
  ↓
Implement → /implement specs/feature-*.md
  ↓
Archive → scripts/archive-spec.sh specs/feature-*.md
  ↓
Done → specs/done/2025-10-17-HHMM-feature-*.md
```

## Usage Examples

### Example 1: Archive Single Spec After Implementation

```bash
# Plan feature
/feature "add dark mode"
# Creates: specs/feature-dark-mode.md

# Implement feature
/implement specs/feature-dark-mode.md

# Archive completed spec
./scripts/archive-spec.sh specs/feature-dark-mode.md
# Result: specs/done/2025-10-17-2154-feature-dark-mode.md
```

### Example 2: Archive Multiple Completed Specs

```bash
# After implementing several features
./scripts/archive-all-specs.sh

# Result:
# specs/done/2025-10-17-2154-feature-dark-mode.md
# specs/done/2025-10-17-2156-feature-auth.md
# specs/done/2025-10-17-2158-bug-login-crash.md
```

### Example 3: Review Completed Work

```bash
# List archived specs (chronologically sorted)
ls -lt specs/done/

# View a specific completed spec
cat specs/done/2025-10-17-2154-feature-dark-mode.md
```

## Files to Create/Modify

### New Files

1. **scripts/archive-spec.sh**
   - Main archiving script
   - Takes spec file path as argument
   - Moves to specs/done/ with timestamp

2. **scripts/archive-all-specs.sh**
   - Bulk archiving script
   - Archives all specs in specs/
   - Calls archive-spec.sh for each file

3. **specs/done/.gitkeep**
   - Creates done directory
   - Ensures directory is tracked in git

### Modified Files

1. **README.md**
   - Add "Managing Completed Specs" section
   - Document archive-spec.sh usage
   - Show workflow examples

2. **ARCHITECTURE.md**
   - Add archiving step to workflow diagram
   - Document specs lifecycle

3. **.gitignore** (optional)
   - Add specs/done/ entry (commented out by default)
   - Let user decide if they want to commit archived specs

## Testing Plan

### Test Case 1: Archive Single Spec

**Steps:**
1. Create test spec: `echo "# Test" > specs/test-feature.md`
2. Run: `./scripts/archive-spec.sh specs/test-feature.md`
3. Check: `ls specs/done/`

**Expected:**
- Original file gone: `! test -f specs/test-feature.md`
- Archived file exists: `test -f specs/done/20*-test-feature.md`
- Filename has timestamp: matches pattern `YYYY-MM-DD-HHMM-test-feature.md`

### Test Case 2: Archive Multiple Specs

**Steps:**
1. Create test specs:
   ```bash
   echo "# Test 1" > specs/test-1.md
   echo "# Test 2" > specs/test-2.md
   echo "# Test 3" > specs/test-3.md
   ```
2. Run: `./scripts/archive-all-specs.sh`
3. Check: `ls specs/done/`

**Expected:**
- All 3 specs archived
- All have same timestamp (run at same time)
- Original specs gone

### Test Case 3: Error Handling

**Test missing file:**
```bash
./scripts/archive-spec.sh specs/nonexistent.md
# Expected: Error message, exit 1
```

**Test no argument:**
```bash
./scripts/archive-spec.sh
# Expected: Usage message, exit 1
```

### Test Case 4: Timestamp Format

**Steps:**
1. Archive a spec
2. Check filename format

**Expected:**
- Timestamp matches: `YYYY-MM-DD-HHMM`
- Files sort chronologically: `ls -t specs/done/`
- Timestamp is human-readable

### Test Case 5: Directory Creation

**Steps:**
1. Delete done directory: `rm -rf specs/done`
2. Archive a spec: `./scripts/archive-spec.sh specs/test.md`

**Expected:**
- Script creates specs/done/ automatically
- No error about missing directory

## Edge Cases & Considerations

### Edge Case 1: Duplicate Filenames

**Scenario:** Two specs with same name archived in same minute

**Current behavior:** Second file overwrites first (mv behavior)

**Solution:** Add counter suffix if file exists:
```bash
# If 2025-10-17-2154-feature.md exists
# Create 2025-10-17-2154-feature-2.md
```

**Implementation:** Add to archive-spec.sh:
```bash
COUNTER=1
while [ -f "$ARCHIVED_FILE" ]; do
    COUNTER=$((COUNTER + 1))
    ARCHIVED_FILE="$DONE_DIR/${TIMESTAMP}-${FILENAME%.md}-${COUNTER}.md"
done
```

### Edge Case 2: Spec in Subdirectory

**Scenario:** User has `specs/features/auth.md`

**Current behavior:** Would archive to `specs/features/done/`

**Desired behavior:** Archive to `specs/done/` (flat structure)

**Solution:** Always use `specs/done/` regardless of source location

### Edge Case 3: Already Archived Spec

**Scenario:** User tries to archive a spec that's already in done/

**Current behavior:** Would move to done/done/

**Solution:** Check if file is already in done/, skip if so

### Edge Case 4: Git Tracking

**Scenario:** User wants to commit archived specs for history

**Recommendation:**
- Don't add specs/done/ to .gitignore by default
- Let user decide (document in README)
- Some teams want history, others want clean repos

## Future Enhancements

### Phase 2: Auto-Archive After /implement

Modify `/implement` command to optionally archive on success:

```bash
# In swiftui/implement.md, after successful implementation:
# Ask user:
echo "Archive this spec? (y/n)"
read -r response
if [ "$response" = "y" ]; then
    scripts/archive-spec.sh "$SPEC_FILE"
fi
```

### Phase 3: Archive with Notes

Allow adding completion notes:

```bash
./scripts/archive-spec.sh specs/feature.md --note "Completed successfully, deployed to production"
# Appends note to end of archived file
```

### Phase 4: Un-archive

Script to move specs back from done/ to specs/:

```bash
./scripts/unarchive-spec.sh specs/done/2025-10-17-2154-feature.md
# Removes timestamp, moves back to specs/
```

### Phase 5: Archive Statistics

```bash
./scripts/spec-stats.sh
# Output:
# Total specs: 45
# Active: 5
# Archived: 40
# Completed this week: 8
```

## Implementation Checklist

- [ ] Create scripts/archive-spec.sh
- [ ] Make script executable
- [ ] Test single file archiving
- [ ] Create scripts/archive-all-specs.sh
- [ ] Make bulk script executable
- [ ] Test bulk archiving
- [ ] Handle duplicate filename edge case
- [ ] Create specs/done/.gitkeep
- [ ] Update README.md with usage
- [ ] Update ARCHITECTURE.md with workflow
- [ ] Test all edge cases
- [ ] Add to git and commit

## Success Metrics

- ✅ Script successfully archives specs with timestamps
- ✅ Timestamps are sortable and human-readable
- ✅ specs/ directory stays clean (only active specs)
- ✅ specs/done/ provides historical record
- ✅ No data loss (files safely moved, not deleted)
- ✅ Easy to use (simple command line interface)
- ✅ Well documented (README and examples)

## Related Issues

- Keeping specs/ directory organized
- Historical tracking of completed work
- Workflow management after implementation

## Notes

This feature follows the existing pattern of utility scripts in claude-commands:
- `scripts/build-dist.sh` - Build distribution
- `scripts/install.sh` - Install to projects
- `scripts/archive-spec.sh` - Archive completed specs

The scripts are:
- **Simple** - Single purpose, easy to understand
- **Reusable** - Can be called from anywhere
- **Safe** - Validate inputs, handle errors
- **Documented** - Clear usage messages and examples

---

**Status:** Ready for implementation
**Priority:** Medium (quality of life improvement)
**Effort:** ~1-2 hours (simple scripts + documentation)
**Impact:** Improves workflow organization and spec management
