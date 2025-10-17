# Bug: implement is an untracked symlink and should be a file

## Description

The `.claude/commands/implement` file is currently a symlink pointing to `/Users/paul/dev/claude-commands/core/implement.md`, but it should be a regular file named `implement.md` (following the naming convention of other command files).

## Issue Details

**Current state:**
- `.claude/commands/implement` exists as a symlink
- Points to: `/Users/paul/dev/claude-commands/core/implement.md`
- Git status: untracked (because it's a symlink)

**Expected state:**
- `.claude/commands/implement.md` should exist as a regular file
- Should follow the same naming convention as other commands:
  - `bug.md`
  - `chore.md`
  - `feature.md`
  - `prime.md`

## Root Cause

During the repository restructuring, the `implement` command was likely created as a symlink instead of being copied as a regular file. This is inconsistent with the structure of other command files in `.claude/commands/`.

Location: `.claude/commands/implement:1`

## Affected Files

- `.claude/commands/implement` (symlink - should be removed)
- `.claude/commands/implement.md` (should be created)
- `core/implement.md` (source file - remains unchanged)

## Fix Implementation

### Step 1: Remove the symlink
```bash
rm .claude/commands/implement
```

### Step 2: Copy the file with correct naming
```bash
cp core/implement.md .claude/commands/implement.md
```

### Step 3: Verify the fix
```bash
# Check that implement.md exists as a regular file
ls -la .claude/commands/implement.md

# Verify it's not a symlink
test -L .claude/commands/implement.md && echo "ERROR: Still a symlink" || echo "OK: Regular file"

# Check git status
git status .claude/commands/implement.md
```

### Step 4: Update git tracking
```bash
# Add the new file to git
git add .claude/commands/implement.md

# Verify it's staged
git status
```

## Testing

### Verification steps:
1. ✅ Symlink removed: `! test -e .claude/commands/implement`
2. ✅ Regular file exists: `test -f .claude/commands/implement.md`
3. ✅ Content matches source: `diff .claude/commands/implement.md core/implement.md`
4. ✅ Git tracking: `git ls-files .claude/commands/implement.md`
5. ✅ Naming consistency: All `.claude/commands/*.md` files follow same pattern

### Manual verification:
- Run `/implement` command to ensure it still works
- Verify other commands (bug, chore, feature, prime) still work
- Check that documentation references are correct

## Prevention

**Best practices to prevent similar issues:**

1. **Consistent naming convention**: All command files in `.claude/commands/` should be:
   - Regular files (not symlinks)
   - Named with `.md` extension
   - Directly placed in `.claude/commands/`

2. **Directory structure validation**: Add a check script to validate:
   ```bash
   # Check for symlinks in .claude/commands/
   find .claude/commands -type l -name "*.md"

   # Check for files without .md extension
   find .claude/commands -type f ! -name "*.md" ! -name ".*"
   ```

3. **Documentation update**: Update ARCHITECTURE.md or CONTRIBUTING.md to clarify:
   - `.claude/commands/` contains the actual command definitions
   - `core/`, `loaders/`, `routers/`, `swiftui/` are source/development directories
   - Command files should be regular files, not symlinks

## Related Issues

- Directory restructuring from previous commits
- Git submodule removal (noted in git status: `AD .gitmodules`)
- Commands moved from `commands/core/` to root `core/` directory

## Notes

This is a low-severity bug that doesn't affect functionality (the symlink works), but it:
- Creates git tracking confusion (symlinks show as untracked)
- Breaks naming consistency with other command files
- Could cause issues in deployment/distribution scenarios where symlinks aren't preserved
