# Bug: Command Files Missing .md Extension

## Description

The command files in `.claude/commands/` are missing the `.md` file extension. They are currently named `bug`, `chore`, `feature`, `implement`, `prime` but should be `bug.md`, `chore.md`, `feature.md`, `implement.md`, `prime.md`.

**Current state:**
- `.claude/commands/bug` (no extension)
- `.claude/commands/chore` (no extension)
- `.claude/commands/feature` (no extension)
- `.claude/commands/implement` (no extension)
- `.claude/commands/prime` (no extension)

**Expected state:**
- `.claude/commands/bug.md`
- `.claude/commands/chore.md`
- `.claude/commands/feature.md`
- `.claude/commands/implement.md`
- `.claude/commands/prime.md`

## Root Cause

In commit 530f01e ("fix: Implement clean distribution system"), the build script (`scripts/build-dist.sh`) was written to copy command files without the `.md` extension:

```bash
# Line 14-18 in scripts/build-dist.sh
cp core/prime.md dist/commands/prime    # ❌ Removes .md
cp core/feature.md dist/commands/feature
cp core/bug.md dist/commands/bug
cp core/chore.md dist/commands/chore
cp core/implement.md dist/commands/implement
```

This was an incorrect assumption. Claude Code slash commands **must** be `.md` files.

### Historical Context

Before commit 530f01e, the commands were symlinks:
- At commit d4a4fa0: Commands were symlinks pointing to `../../commands/core/bug.md`
- At commit 530f01e: Converted to regular files but removed `.md` extension

The intention was good (remove symlinks, use regular files) but the execution was wrong (removed `.md` extension).

## Impact

**Severity:** High

**Functional Impact:**
- Claude Code may not recognize these as slash commands without `.md` extension
- Inconsistent with Claude Code conventions
- Breaks user expectations

**Structural Impact:**
- Source files in `core/` have `.md` extension
- Distribution files in `dist/commands/` lack `.md` extension
- Mismatch between source and distribution

## Affected Files

### Build Script
- `scripts/build-dist.sh` lines 14-18

### Distribution
- `dist/commands/bug` → should be `dist/commands/bug.md`
- `dist/commands/chore` → should be `dist/commands/chore.md`
- `dist/commands/feature` → should be `dist/commands/feature.md`
- `dist/commands/implement` → should be `dist/commands/implement.md`
- `dist/commands/prime` → should be `dist/commands/prime.md`

### Installation
- `.claude/commands/bug` → should be `.claude/commands/bug.md`
- `.claude/commands/chore` → should be `.claude/commands/chore.md`
- `.claude/commands/feature` → should be `.claude/commands/feature.md`
- `.claude/commands/implement` → should be `.claude/commands/implement.md`
- `.claude/commands/prime` → should be `.claude/commands/prime.md`

### Documentation
- `dist/README.md` - Lists commands without `.md` extension

## Fix Implementation

### Step 1: Fix Build Script

Update `scripts/build-dist.sh` to preserve `.md` extension:

```bash
# Copy core commands (KEEP .md extension)
echo "📦 Copying core commands..."
cp core/prime.md dist/commands/prime.md
cp core/feature.md dist/commands/feature.md
cp core/bug.md dist/commands/bug.md
cp core/chore.md dist/commands/chore.md
cp core/implement.md dist/commands/implement.md
```

### Step 2: Update dist/README.md

Update the verification section to show `.md` extensions:

```markdown
## Verification

After installation, your `.claude/commands/` should contain:
- prime.md
- feature.md
- bug.md
- chore.md
- implement.md
```

### Step 3: Rebuild Distribution

```bash
./scripts/build-dist.sh
```

This will regenerate `dist/` with correct `.md` extensions.

### Step 4: Update .claude Installation

```bash
# Backup project customizations
cp -r .claude/project /tmp/project-backup

# Remove old commands
rm -f .claude/commands/*

# Reinstall from rebuilt dist
cp -r dist/commands/* .claude/commands/

# Restore customizations
cp -r /tmp/project-backup/* .claude/project/
```

### Step 5: Verify Fix

```bash
# Check that all commands have .md extension
ls -la .claude/commands/
# Should show: bug.md, chore.md, feature.md, implement.md, prime.md

# Verify files are regular files (not symlinks)
file .claude/commands/*
# Should show: Unicode text, UTF-8 text (for all files)

# Test a command still works
# (In Claude Code, run /prime)
```

### Step 6: Update Git

```bash
# Stage changes
git add scripts/build-dist.sh dist/ .claude/commands/

# Commit
git commit -m "fix: Add .md extension to command files for Claude Code compatibility

Command files must have .md extension to work properly as Claude Code
slash commands. Updated build script to preserve .md extension when
copying from source to distribution.

Changes:
- Fixed scripts/build-dist.sh to copy as *.md files
- Rebuilt dist/commands/ with .md extensions
- Updated .claude/commands/ with .md extensions
- Updated dist/README.md documentation

Commands now correctly named:
  bug.md, chore.md, feature.md, implement.md, prime.md"
```

## Testing

### Test Case 1: Build Script Generates Correct Files

**Steps:**
1. Delete dist/: `rm -rf dist`
2. Run build: `./scripts/build-dist.sh`
3. Check dist/commands/: `ls -la dist/commands/`

**Expected:**
- All files have `.md` extension
- Files are named: bug.md, chore.md, feature.md, implement.md, prime.md

### Test Case 2: Installation Creates Correct Files

**Steps:**
1. Create test project: `mkdir -p /tmp/test-commands`
2. Install: `./scripts/install.sh /tmp/test-commands`
3. Check: `ls -la /tmp/test-commands/.claude/commands/`

**Expected:**
- All command files have `.md` extension
- Files are regular files (not symlinks)

### Test Case 3: Commands Work in Claude Code

**Steps:**
1. Navigate to project with fixed installation
2. Run `/prime` in Claude Code
3. Run `/feature "test"` in Claude Code

**Expected:**
- Commands are recognized and execute successfully
- No "command not found" errors

### Test Case 4: Consistency Check

**Steps:**
1. Compare source to dist:
   ```bash
   ls core/*.md
   ls dist/commands/*.md
   ```
2. Compare dist to installation:
   ```bash
   ls dist/commands/*.md
   ls .claude/commands/*.md
   ```

**Expected:**
- All three locations use `.md` extension
- Naming is consistent across source, dist, and installation

## Prevention

### Build Script Documentation

Add comment in `scripts/build-dist.sh`:

```bash
# Copy core commands (MUST preserve .md extension for Claude Code)
echo "📦 Copying core commands..."
cp core/prime.md dist/commands/prime.md      # Keep .md!
cp core/feature.md dist/commands/feature.md  # Keep .md!
cp core/bug.md dist/commands/bug.md          # Keep .md!
cp core/chore.md dist/commands/chore.md      # Keep .md!
cp core/implement.md dist/commands/implement.md  # Keep .md!
```

### Add Validation

Add to end of `scripts/build-dist.sh`:

```bash
# Validate: All commands must have .md extension
echo ""
echo "🔍 Validating command files..."
for cmd in dist/commands/*; do
    if [[ ! "$cmd" =~ \.md$ ]]; then
        echo "❌ ERROR: Command file missing .md extension: $cmd"
        exit 1
    fi
done
echo "✅ All command files have .md extension"
```

### Update Documentation

Add to ARCHITECTURE.md or CONTRIBUTING.md:

**Command File Requirements:**
- Must be `.md` files (Markdown format)
- Must be placed in `core/` directory with `.md` extension
- Build script preserves `.md` extension when copying to `dist/commands/`
- Final installation has `.md` extension in `.claude/commands/`

## Related Issues

- Original symlink issue: specs/bug-installation-symlink-pollution.md
- Implement symlink fix: specs/bug-implement-symlink.md (d4a4fa0)
- Distribution system: 530f01e

## Notes

This is a regression introduced when fixing the symlink pollution issue. The fix correctly removed symlinks and used regular files, but incorrectly removed the `.md` extension.

**Key Insight:** Claude Code slash commands are Markdown files and MUST have the `.md` extension to be recognized properly by the system.

The source files (`core/*.md`) already have the correct extension. The bug is only in how the build script copies them to the distribution.

---

**Status:** Ready for implementation
**Priority:** High (breaks Claude Code command recognition)
**Effort:** ~15 minutes (simple fix in build script + rebuild)
**Impact:** Restores proper Claude Code compatibility
