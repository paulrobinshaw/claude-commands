# MCP Configuration: Professional Baking App

This MCP configuration is specific to the professional baking application example.

---

## MCP Configuration

**Project:** Professional Baking App (Example)

**Last Updated:** 2024-10-17

---

## Available MCPs

### XcodeBuildMCP

**Status:** ✅ Available

**Purpose:** Automated building and testing for the baking app Xcode project

**Version:** Xcode 15.0+

**Configuration:**

**Project Settings:**
- Project File: `BakingApp.xcodeproj`
- Scheme: `BakingApp`
- Configuration: `Debug` (default for development)

**Build Commands:**

```bash
# Build project
xcodebuild -project BakingApp.xcodeproj -scheme BakingApp -configuration Debug

# Clean build
xcodebuild clean -project BakingApp.xcodeproj -scheme BakingApp
```

**Test Commands:**

```bash
# Run all tests
xcodebuild test -project BakingApp.xcodeproj -scheme BakingApp

# Run service tests only
xcodebuild test -project BakingApp.xcodeproj -scheme BakingApp \
  -only-testing:BakingAppTests/RecipeServiceTests

# Run with coverage
xcodebuild test -project BakingApp.xcodeproj -scheme BakingApp \
  -enableCodeCoverage YES
```

**Usage in Commands:**
- `/implement` - Automatically builds after file changes
- `/implement` - Automatically runs tests after build succeeds
- Validates architecture compliance (no ViewModels)
- Validates design system token usage (no hardcoded values)

**Notes:**
- Build typically takes 30-45 seconds
- Test suite runs in ~15 seconds
- Full test coverage enabled for service tests

---

### GitMCP

**Status:** ✅ Available

**Purpose:** Git operations for the baking app repository

**Configuration:**

**Repository:**
- Remote: `origin https://github.com/example/baking-app.git`
- Main Branch: `main`
- Development Branch: `develop`

**Branch Naming:**
- Features: `feature/recipe-scaling`
- Bugs: `bugfix/hydration-calculation`
- Chores: `chore/update-swiftdata`

**Common Commands:**

```bash
# Check status
git status

# View diff
git diff

# View diff for specific file
git diff BakingApp/Services/RecipeService.swift

# Stage files
git add .

# Commit
git commit -m "feat: Add recipe scaling with baker's percentages"

# Push
git push origin feature/recipe-scaling
```

**Usage in Commands:**
- `/implement` - Checks git diff for architecture violations
- Pre-commit validation
- Verify no ViewModels added: `git diff main | grep -i "viewmodel"`
- Verify DS tokens used: `git diff main | grep -E "Color\(red:"`

**Notes:**
- Always create feature branches from `develop`
- Squash commits before merging to `main`
- Use conventional commit messages (feat:, fix:, chore:)

---

### FilesystemMCP

**Status:** ✅ Available

**Purpose:** File system operations for the baking app codebase

**Configuration:**

**Project Structure:**

```
BakingApp/
├── BakingApp/                    # Source code
│   ├── BakingAppApp.swift        # App entry point
│   ├── Services/                 # @Observable services
│   │   ├── RecipeService.swift
│   │   └── FormulaService.swift
│   ├── Models/                   # SwiftData models
│   │   ├── Recipe.swift
│   │   └── Ingredient.swift
│   ├── Views/                    # SwiftUI views
│   │   ├── RecipeListView.swift
│   │   └── RecipeDetailView.swift
│   ├── Components/               # Reusable components
│   │   ├── RecipeCard.swift
│   │   └── MetricChip.swift
│   └── DesignSystem/             # Design system
│       ├── Colors.swift
│       ├── Typography.swift
│       └── Spacing.swift
├── BakingAppTests/               # Tests
│   ├── RecipeServiceTests.swift
│   └── FormulaServiceTests.swift
└── specs/                        # Implementation plans
    ├── feature-recipe-scaling.md
    └── bug-hydration-calculation.md
```

**Allowed Directories:**
- Source: `BakingApp/`
- Tests: `BakingAppTests/`
- Specs: `specs/`
- Project Config: `.claude/project/`

**Common Operations:**

```bash
# List source files
ls -la BakingApp/Services/

# Read service file
cat BakingApp/Services/RecipeService.swift

# Create new service
touch BakingApp/Services/ScalingService.swift

# Create spec
mkdir -p specs
touch specs/feature-ingredient-substitution.md
```

**Usage in Commands:**
- Reading source files for context
- Creating new files during implementation
- Modifying existing files
- Managing spec files in `specs/`

**Notes:**
- All source files use 4-space indentation
- Swift files use `// MARK: -` for organization
- Keep files under 150 lines (views) or 200 lines (services)

---

## Project-Specific MCP Patterns

### Build-Test-Commit Workflow

**Workflow for Feature Implementation:**

1. **Implement changes**
   - Create/modify Swift files
   - Follow architecture patterns
   - Use design system tokens

2. **Build with XcodeBuildMCP**

   ```bash
   xcodebuild -project BakingApp.xcodeproj -scheme BakingApp
   ```

   - Expected: 0 errors, 0 warnings
   - If build fails: Fix errors, rebuild

3. **Test with XcodeBuildMCP**

   ```bash
   xcodebuild test -project BakingApp.xcodeproj -scheme BakingApp
   ```

   - Expected: All tests pass
   - If tests fail: Fix issues, retest

4. **Check Architecture Compliance with GitMCP**

   ```bash
   # No ViewModels
   git diff main | grep -i "viewmodel"
   # Expected: No results

   # No hardcoded colors
   git diff main | grep -E "Color\(red:"
   # Expected: No results

   # No hardcoded fonts
   git diff main | grep -E "\.system\(size:"
   # Expected: No results

   # @Observable used (not ObservableObject)
   git diff main | grep "ObservableObject"
   # Expected: No results
   ```

5. **If all pass: Commit**

   ```bash
   git add .
   git commit -m "feat: Add recipe scaling with baker's percentages"
   git push origin feature/recipe-scaling
   ```

**Success Criteria:**
- ✅ Build succeeds (0 errors, 0 warnings)
- ✅ All tests pass
- ✅ No ViewModels added
- ✅ Design system tokens used
- ✅ @Observable pattern used

---

### Pre-Commit Validation

**Always run before committing:**

```bash
# 1. Build
xcodebuild -project BakingApp.xcodeproj -scheme BakingApp
# Expected: Success

# 2. Test
xcodebuild test -project BakingApp.xcodeproj -scheme BakingApp
# Expected: All pass

# 3. Architecture checks
git diff main | grep -i "viewmodel"           # Expected: Nothing
git diff main | grep -E "Color\(red:"         # Expected: Nothing
git diff main | grep "ObservableObject"       # Expected: Nothing

# 4. Coverage check (services should be 90%+)
xcodebuild test -project BakingApp.xcodeproj -scheme BakingApp -enableCodeCoverage YES
# Check coverage report

# 5. If all green: commit
git add .
git commit -m "[type]: [description]"
```

---

## MCP Error Handling

### Build Failures

**Common Issues in Baking App:**

**Issue:** Type mismatch in baker's percentage calculation
- **Solution:** Check formula calculations, ensure Double types

**Issue:** Missing import for Observation
- **Solution:** Add `import Observation` to service files

**Issue:** SwiftData relationship not defined
- **Solution:** Check @Model relationships in Recipe/Ingredient

**If build fails:**
1. Read error output from XcodeBuildMCP
2. Identify issue
3. Fix issue
4. Rebuild
5. Repeat up to 2 times
6. If still failing, report to user with error details

---

### Test Failures

**Common Test Failures:**

**Issue:** RecipeServiceTests.testScaling fails
- **Cause:** Baker's percentage calculation incorrect
- **Solution:** Fix formula in RecipeService.scaleRecipe()

**Issue:** FormulaServiceTests.testHydration fails
- **Cause:** Not including preferment water in total
- **Solution:** Update hydration calculation to include all water sources

**If tests fail:**
1. Identify which tests failed
2. Read failure messages
3. Determine cause:
   - Bug in implementation → Fix code
   - Test outdated → Update test
   - Expected behavior changed → Update test
4. Re-run tests
5. Report if unable to fix automatically

---

### Git Conflicts

**If git operations fail:**
1. Check `git status`
2. Identify conflict
3. If simple (new file, modification): Resolve
4. If complex (merge conflict): Ask user to resolve
5. Report status to user

---

## MCP Integration with Commands

### /implement Command Flow

**Step-by-step MCP usage:**

1. **FilesystemMCP:** Read plan from `specs/feature-recipe-scaling.md`
2. **FilesystemMCP:** Read existing files (RecipeService.swift, etc.)
3. **FilesystemMCP:** Create/modify files per plan
4. **XcodeBuildMCP:** Build project
   - If fails: Fix and rebuild
5. **XcodeBuildMCP:** Run tests
   - If fails: Analyze and fix
6. **GitMCP:** Check diff for compliance
   - No ViewModels
   - DS tokens used
   - @Observable pattern
7. **Report:** Results to user

---

### /feature Command Flow

**Step-by-step MCP usage:**

1. **FilesystemMCP:** Read `.claude/project/design-system.md`
2. **FilesystemMCP:** Read `.claude/project/domain.md`
3. **FilesystemMCP:** Explore project structure
4. **FilesystemMCP:** Create plan in `specs/feature-[name].md`
5. **Report:** Plan location to user

---

## MCP Availability Detection

**Auto-detect on `/prime`:**

```bash
# Check XcodeBuildMCP
which xcodebuild && xcodebuild -version
# Expected: Xcode 15.0+ installed

# Check Git
which git && git --version
# Expected: git version 2.x
```

**Report in prime output:**

```
✅ XcodeBuildMCP - Xcode 15.0, automated build/test available
✅ GitMCP - git 2.40.0, git operations available
✅ FilesystemMCP - File operations available
```

---

## Installation and Setup

### XcodeBuildMCP

**Requirements:**
- Xcode 15.0+ installed
- Command line tools installed

**Installation:**

```bash
# Install Xcode from App Store

# Install command line tools
xcode-select --install

# Verify
xcodebuild -version
```

**Expected output:**

```
Xcode 15.0
Build version 15A240d
```

---

### GitMCP

**Requirements:**
- Git installed

**Installation:**

```bash
# macOS (usually pre-installed)
git --version

# If not installed
brew install git
```

**Configuration:**

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

**Verify:**

```bash
git --version
```

**Expected:** git version 2.x

---

## Troubleshooting

### XcodeBuildMCP Issues

**Issue:** Build times out
- **Solution:** Check for infinite loops in formula calculations

**Issue:** Simulator not available
- **Solution:** Open Xcode, ensure iOS 17+ simulator installed

**Issue:** Code signing error
- **Solution:** Disable code signing for Debug builds in Xcode

---

### GitMCP Issues

**Issue:** Permission denied
- **Solution:** Set up SSH keys or use HTTPS with credentials

**Issue:** Untracked files warning
- **Solution:** Add to `.gitignore` or stage files

---

## Notes

- This MCP configuration is specific to Professional Baking App
- XcodeBuildMCP is critical for automated validation
- GitMCP enables architecture compliance checks
- Update when project structure changes
- Run `/prime` after updates to reload MCP configuration
