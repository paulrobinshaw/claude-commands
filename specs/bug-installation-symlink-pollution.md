# Bug: Installation Creates Symlink Pollution in .claude/commands

## Description

When users install Claude Commands, the `.claude/commands/` directory contains too many files beyond just the executable command files (*.md). It includes unnecessary files like:
- Empty placeholder files (ARCHITECTURE.md, CHANGELOG.md, LICENSE, README.md, .gitignore)
- Documentation directories (docs/)
- .DS_Store files

**Expected:** `.claude/commands/` should contain ONLY the executable command files:
- `prime.md`
- `feature.md`
- `bug.md`
- `chore.md`

**Actual:** `.claude/commands/` contains 13 items including empty files and directories.

## Impact

**Severity:** Medium

**User Experience Impact:**
- Confusing for users who see empty/irrelevant files
- Cluttered directory structure
- Unclear what files are actual commands vs. placeholders
- Installation instructions unclear

**Technical Impact:**
- No functional impact (commands still work)
- Code organization issue
- Documentation/user confusion

## Root Cause Analysis

### Investigation

Looking at the current structure:

```bash
.claude/commands/
├── .DS_Store               # ❌ System file
├── .gitignore              # ❌ Empty placeholder
├── ARCHITECTURE.md         # ❌ Empty placeholder
├── CHANGELOG.md            # ❌ Empty placeholder
├── LICENSE                 # ❌ Empty placeholder
├── README.md               # ❌ Empty placeholder
├── bug.md                  # ✅ Executable command
├── chore.md                # ✅ Executable command
├── docs/                   # ❌ Empty docs directory
│   ├── contributing.md     # ❌ Empty placeholder
│   ├── customization-guide.md # ❌ Empty placeholder
│   └── getting-started.md  # ❌ Stub file (357 bytes)
├── feature.md              # ✅ Executable command
└── prime.md                # ✅ Executable command
```

**Source files:**
```bash
core/
├── bug.md                  # ✅ Source
├── chore.md                # ✅ Source
├── feature.md              # ✅ Source
└── prime.md                # ✅ Source
```

### Root Cause

The issue occurred during the initial dogfooding setup. When setting up `.claude/commands/`, the commands were copied directly from the source structure, which brought along:

1. **Empty placeholder files** - Created as stubs but left empty
2. **Documentation directory** - Not needed in user projects
3. **Project metadata files** - Not needed in installations
4. **System files** - .DS_Store, .gitignore, etc.

The README.md suggests two installation methods, but neither provides a clean distribution:

```markdown
# Current (problematic) suggestion:
git submodule add https://github.com/.../claude-commands .claude/commands
# This would clone ENTIRE repo into .claude/commands (pollutes with source files)

# Current Option 2 (problematic):
cp -r claude-commands/.claude your-project/.claude
# This copies the dogfooding setup, which has all the extra files
```

**Root Issue:** No clean distribution package exists - users are copying source files directly.

## Solution Design

### Strategy

Create a **dist/ directory** containing a clean, ready-to-copy distribution package.

### Why dist/ Approach?

**Solves all problems:**
- ✅ **Standalone** - No dependency on source repo after installation
- ✅ **Clean** - Only necessary files included
- ✅ **Upgradeable** - Download new dist/, copy over old
- ✅ **Simple** - One directory copy
- ✅ **Portable** - Can be tarball, zip, GitHub release

**Comparison to alternatives:**

| Approach | Standalone | Upgradeable | Clean | Simple |
|----------|-----------|-------------|-------|--------|
| Symlinks | ❌ | ✅ | ✅ | ❌ |
| Copy source | ✅ | ❌ | ❌ | ✅ |
| Git submodule | ❌ | ✅ | ❌ | ❌ |
| **dist/ copy** | **✅** | **✅** | **✅** | **✅** |

### Implementation Approach

**dist/ Structure:**
```bash
dist/
├── commands/        # Only executable commands
│   ├── prime       # (no .md extension for cleaner slash commands)
│   ├── feature
│   ├── bug
│   ├── chore
│   └── implement   # TODO: Add this command
├── routers/        # Supporting files
├── loaders/        # Supporting files
├── swiftui/        # Technology-specific handlers
└── project/        # Empty (for user customizations)
    └── .gitkeep
```

**Note:** `/implement` command is referenced in README but doesn't exist yet. Should be added before v1.0 release.

**Build Process:**
Create `scripts/build-dist.sh` to generate clean distribution from source files.

## Fix Implementation

### Phase 1: Create Build Script

Create `scripts/build-dist.sh` to generate clean distribution:

```bash
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
# TODO: Add when implement.md is created
# cp core/implement.md dist/commands/implement

# Copy supporting directories
echo "📦 Copying supporting files..."
cp -r routers/ dist/
cp -r loaders/ dist/
cp -r swiftui/ dist/

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
```

### Phase 2: Create Installation Script

Create `scripts/install.sh` for easy installation:

```bash
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

# Optionally copy templates
echo ""
echo "📋 Copy customization templates to .claude/project/? (y/n)"
read -r copy_templates
if [ "$copy_templates" = "y" ]; then
    cp "$REPO_DIR/templates/design-system-template.md" "$PROJECT_DIR/.claude/project/" 2>/dev/null || true
    cp "$REPO_DIR/templates/domain-template.md" "$PROJECT_DIR/.claude/project/" 2>/dev/null || true
    cp "$REPO_DIR/templates/version-template.md" "$PROJECT_DIR/.claude/project/" 2>/dev/null || true
    cp "$REPO_DIR/templates/mcp-template.md" "$PROJECT_DIR/.claude/project/" 2>/dev/null || true
    echo "✅ Templates copied to .claude/project/"
fi

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
```

### Phase 3: Update .gitignore

Create `dist/.gitignore` to help users keep clean repos:

```gitignore
# User customizations - COMMIT THESE
!project/

# Everything else - don't commit (comes from dist)
commands/
routers/
loaders/
swiftui/
```

Also add to root `.gitignore`:

```gitignore
# Build output
dist/

# Don't commit dist to main repo
```

Wait, correction - we DO want to commit dist/ so users can clone and use directly. Update:

```gitignore
# Ignore build artifacts but keep dist/ committed
# (nothing here for dist)
```

### Phase 4: Update Documentation

**README.md - Installation section:**

```markdown
## Installation

### Quick Install (Recommended)

```bash
# Clone the repository
git clone https://github.com/yourusername/claude-commands.git
cd claude-commands

# Run installer (automatically builds and installs)
./scripts/install.sh /path/to/your/project

# Or from your project directory:
cd /path/to/your/project
/path/to/claude-commands/scripts/install.sh .
```

### Manual Installation

```bash
# 1. Clone or download the repository
git clone https://github.com/yourusername/claude-commands.git

# 2. Copy the distribution to your project
cp -r claude-commands/dist/* your-project/.claude/

# 3. (Optional) Copy customization templates
cp claude-commands/templates/*.md your-project/.claude/project/
```

### Download Release (Coming Soon)

```bash
# Download latest release tarball
curl -L https://github.com/.../releases/latest/download/claude-commands.tar.gz \
  | tar xz -C .claude/
```

### Verification

After installation, your `.claude/` should look like:

```
.claude/
├── commands/
│   ├── prime
│   ├── feature
│   ├── bug
│   └── chore
├── routers/
├── loaders/
├── swiftui/
└── project/      # Your customizations go here
```

Run `/prime` in Claude Code to verify installation works.
```

**docs/getting-started.md:**

Update installation section to reference the new dist/ approach and simpler installation process.

### Phase 5: Update User .gitignore Template

Create `dist/.gitignore.example` for users to add to their repos:

```gitignore
# Claude Commands - installed files (don't commit, reinstall from dist)
.claude/commands/
.claude/routers/
.claude/loaders/
.claude/swiftui/

# User customizations - COMMIT THESE
!.claude/project/
!.claude/project/*.md

# System files
.DS_Store
```

## Testing Plan

### Test Case 1: Build Process

**Steps:**
1. Run `scripts/build-dist.sh`
2. Inspect `dist/` directory

**Expected:**
- `dist/commands/` contains exactly 4 files (prime, feature, bug, chore)
- `dist/routers/` contains router files
- `dist/loaders/` contains loader files
- `dist/swiftui/` contains SwiftUI handlers
- `dist/project/` exists with .gitkeep
- No .DS_Store, no empty placeholder files

**Verification:**
```bash
./scripts/build-dist.sh
ls -la dist/commands/
# Should show: prime, feature, bug, chore (no .md extension)
find dist -name "*.DS_Store"
# Should return nothing
find dist -size 0
# Should only show .gitkeep
```

### Test Case 2: Clean Installation

**Steps:**
1. Create test project directory
2. Run `install.sh` from claude-commands
3. Check `.claude/` contents

**Expected:**
- `.claude/commands/` contains exactly 4 files
- No empty placeholder files
- No docs directory
- No .DS_Store
- Supporting directories present

**Verification:**
```bash
mkdir -p /tmp/test-project
./scripts/install.sh /tmp/test-project
ls -la /tmp/test-project/.claude/commands/
# Should show exactly: prime, feature, bug, chore
find /tmp/test-project/.claude -name "*.DS_Store"
# Should return nothing
```

### Test Case 3: Command Execution

**Steps:**
1. Navigate to installed test project
2. Run `/prime`
3. Run `/feature "test feature"`

**Expected:**
- Commands execute successfully
- Routing works correctly
- No file-not-found errors
- Can read from routers/, loaders/, swiftui/

**Verification:**
```bash
cd /tmp/test-project
# In Claude Code:
# /prime
# /feature "add dark mode"
# Check that specs/feature-dark-mode.md is created
```

### Test Case 4: Manual Installation

**Steps:**
1. Create new test project
2. Manually copy `dist/*` to `.claude/`
3. Test commands

**Expected:**
- Same result as scripted installation
- All commands work
- Clean structure

### Test Case 5: Upgrade Path

**Steps:**
1. Install v1.0 (simulated old version)
2. Backup `.claude/project/`
3. Install v1.1 (new version)
4. Restore customizations

**Expected:**
- Old commands replaced
- User customizations preserved
- No leftover files from old version

**Verification:**
```bash
# Simulate upgrade
cp -r /tmp/test-project/.claude/project /tmp/backup
cp -r claude-commands/dist/* /tmp/test-project/.claude/
cp -r /tmp/backup/* /tmp/test-project/.claude/project/
# Verify customizations still there
```

## Rollout Plan

### Step 1: Create Build Infrastructure

1. Create `scripts/build-dist.sh`
2. Run initial build: `./scripts/build-dist.sh`
3. Verify dist/ structure
4. Commit dist/ to repository

### Step 2: Create Installation Script

1. Create `scripts/install.sh`
2. Test on clean project
3. Verify it auto-builds if dist/ missing

### Step 3: Fix Dogfooding Setup (This Repo)

Option A: Use our own dist/
```bash
# Remove current .claude setup
rm -rf .claude/

# Install from dist like a user would
./scripts/install.sh .

# Copy our project customizations back
cp .claude/project/domain.md .claude/project/domain.md
cp .claude/project/version.md .claude/project/version.md
```

Option B: Keep source structure for dogfooding
```bash
# Keep .claude/ pointing to source files via symlinks
# (Developer convenience - we're editing the source)
# But document this is ONLY for development
```

Recommend **Option B** - dogfooding uses source, users use dist/.

### Step 4: Update Documentation

1. Update README.md installation section
2. Update docs/getting-started.md
3. Add upgrade guide
4. Document build process for contributors

### Step 5: Add to CHANGELOG

```markdown
## [1.0.1] - 2025-XX-XX

### Changed
- **BREAKING**: Installation now uses dist/ directory for clean deployments
- Commands no longer have .md extension in user projects

### Added
- scripts/build-dist.sh - Build clean distribution
- scripts/install.sh - Automated installation script
- dist/ directory - Pre-built distribution package

### Fixed
- Installation no longer pollutes .claude/commands/ with placeholder files
- Clean separation between source files and distribution

### Migration Guide
If you have an existing installation:
1. Backup: `cp -r .claude/project .claude/project.backup`
2. Remove old: `rm -rf .claude/commands .claude/routers .claude/loaders .claude/swiftui`
3. Install new: `/path/to/claude-commands/scripts/install.sh .`
4. Restore: `cp -r .claude/project.backup/* .claude/project/`
```

### Step 6: Test Everything

Run all test cases from Testing Plan section.

### Step 7: Create GitHub Release

1. Tag as v1.0.1
2. Attach dist/ as tarball
3. Update release notes
4. Announce upgrade path

## Breaking Changes

**For existing users:**

This is a **breaking change** - the installation structure is completely different.

### Migration Steps

1. **Backup your customizations:**
   ```bash
   cp -r .claude/project /tmp/project-backup
   ```

2. **Remove old installation:**
   ```bash
   rm -rf .claude/commands
   rm -rf .claude/routers
   rm -rf .claude/loaders
   rm -rf .claude/swiftui
   ```

3. **Install new version:**
   ```bash
   # Clone/update claude-commands repo
   cd /path/to/claude-commands
   git pull origin main

   # Install to your project
   ./scripts/install.sh /path/to/your-project
   ```

4. **Restore your customizations:**
   ```bash
   cp -r /tmp/project-backup/* .claude/project/
   ```

5. **Verify:**
   ```bash
   ls -la .claude/commands/
   # Should show: prime, feature, bug, chore (4 files only)

   # Test
   /prime
   ```

### What Changed

**Before (v1.0.0):**
```
.claude/commands/
├── .gitignore           # ❌ Empty
├── ARCHITECTURE.md      # ❌ Empty
├── docs/                # ❌ Empty directory
├── bug.md               # ✅ Command
├── feature.md           # ✅ Command
└── ...13 items total
```

**After (v1.0.1):**
```
.claude/commands/
├── prime               # ✅ Command (no .md)
├── feature             # ✅ Command
├── bug                 # ✅ Command
└── chore               # ✅ Command (4 items only)
```

## Future Improvements

1. **Installer options:**
   - `--dry-run` - Show what would be installed
   - `--uninstall` - Remove claude-commands
   - `--upgrade` - Update existing installation (preserve customizations)
   - `--version` - Show installed version

2. **Automated releases:**
   ```bash
   # GitHub Actions workflow
   # On tag push:
   # 1. Run build-dist.sh
   # 2. Create tarball of dist/
   # 3. Attach to release
   # 4. Update latest tag
   ```

3. **Health check script:**
   ```bash
   ./scripts/doctor.sh
   # Validates installation structure
   # Reports missing/extra files
   # Checks for updates
   # Suggests fixes
   ```

4. **Package managers (future):**
   - Homebrew tap
   - npm package (for node projects)
   - pip package (for python projects)

## Success Metrics

- ✅ `.claude/commands/` contains exactly 4 files
- ✅ Build script generates clean dist/
- ✅ Install script works on fresh projects
- ✅ Manual installation (copy dist/) works
- ✅ All commands execute correctly
- ✅ Upgrade path preserves customizations
- ✅ Documentation is clear
- ✅ No user confusion about structure

## Related Issues

- Distribution and packaging strategy (#TBD)
- Automated release process (#TBD)
- Version management for users (#TBD)
- **Missing `/implement` command** - Referenced in README.md but doesn't exist (#TBD)
  - Should read a spec file (e.g., `specs/feature-dark-mode.md`)
  - Should execute the implementation steps
  - Should handle technology-specific implementations
  - Priority: High (needed for v1.0)

## Notes

This bug represents a user experience issue from the initial dogfooding setup that leaked into the documentation. The **dist/ approach** solves the problem elegantly by:

1. **Separating concerns:** Source files vs. distribution files
2. **Enabling upgrades:** Users can replace dist/ without losing customizations
3. **Simplifying installation:** One directory copy
4. **Staying standalone:** No external dependencies after install

The core insight is: **Provide a clean, pre-built distribution package that users can copy wholesale, rather than symlinking or copying source files.**

This is similar to how other projects handle distribution:
- **React:** `build/` directory for production
- **Rails:** Generators that copy template files
- **Create React App:** Bootstrap script that copies structure

---

**Status:** Ready for implementation
**Priority:** High (blocks clean v1.0 release, affects all users)
**Effort:** ~3-4 hours (build script + install script + testing + docs)
**Impact:** Significantly improves UX and sets foundation for proper distribution
