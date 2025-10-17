# Implement - Universal Implementation Executor

Execute implementation from a spec file (feature, bug, or chore plan).

**Philosophy:** Read spec, route to technology-specific executor, follow architecture patterns.

---

## What This Does

1. **Verifies project is primed** (architecture loaded)
2. **Validates spec file** exists and is readable
3. **Detects project type** (if not already known)
4. **Routes to technology-specific implementation handler**
5. **Executes implementation steps** from the spec file

**Context loaded:** Variable (depends on spec - auto-loads design system/domain as needed)

---

## Instructions

You are executing an implementation from a spec file. Route to appropriate technology-specific handler.

---

## Step 1: Verify Architecture Loaded

Check if architecture context is available.

**Look for indicators:**
- SwiftUI architecture patterns in context
- React architecture patterns in context
- Python architecture patterns in context

**If architecture found:**
✅ Architecture loaded - Proceed to Step 2

**If architecture NOT found:**
```
⚠️ Architecture not loaded

Please run /prime first to load project context.

Example:
/prime
/implement specs/feature-dark-mode.md
```

**Stop and wait for user to run `/prime`.**

---

## Step 2: Validate Spec File

Check that the spec file argument was provided and exists.

**Parse arguments:**
```
$ARGUMENTS - Should be a spec file path (e.g., "specs/feature-dark-mode.md")
```

**Validation checks:**

### If no argument provided:
```
❌ Spec file path required

Usage:
/implement <spec-file-path>

Examples:
/implement specs/feature-user-authentication.md
/implement specs/bug-login-crash.md
/implement specs/chore-refactor-services.md

Tip: First create a spec with /feature, /bug, or /chore
```

**Stop and wait for user.**

### If file doesn't exist:
```
❌ Spec file not found: [path]

Please check:
1. File path is correct
2. File exists in specs/ directory
3. You've run /feature, /bug, or /chore first

Available specs:
[List files in specs/ directory]
```

**Stop and wait for user.**

### If file exists:
```
✅ Spec file found: [path]
📄 Reading implementation plan...
```

**Proceed to Step 3.**

---

## Step 3: Route to Implementation Handler

**Execute:** `.claude/routers/implement.md`

The router will:
1. Detect project type (SwiftUI, React, Python)
2. Route to appropriate technology-specific implementation handler
3. Pass through the spec file path

**Pass arguments:**
```
[spec-file-path] - Path to the spec file
```

The technology-specific handler will:
- Read the spec file
- Parse implementation steps
- Auto-load context (design system, domain if needed)
- Execute each step in order
- Create/modify files as specified
- Follow architecture patterns
- Report progress and completion

---

## Arguments

```
$ARGUMENTS - Spec file path (required)
```

**Usage:**

```bash
/implement specs/feature-user-authentication.md
/implement specs/bug-login-crash.md
/implement specs/chore-refactor-services.md
```

---

## Examples

### Example 1: Implement Feature

```
/implement specs/feature-dark-mode-toggle.md
```

**What happens:**
1. Validates spec file exists
2. Routes to SwiftUI implementation handler
3. Reads implementation plan
4. Auto-loads design system (if UI feature)
5. Executes each step in order:
   - Creates SettingsView.swift modifications
   - Updates App struct with dark mode support
   - Uses design system tokens
6. Reports completion

**Output:**
```
✅ Implementation complete

Files created:
(none)

Files modified:
- BakingApp/Views/SettingsView.swift
- BakingApp/BakingAppApp.swift

Next steps:
1. Build and test the app
2. Verify dark mode toggle works
3. Check persistence across app restarts
```

### Example 2: Implement Bug Fix

```
/implement specs/bug-login-crash.md
```

**What happens:**
1. Validates spec file exists
2. Routes to SwiftUI implementation handler
3. Reads bug fix plan
4. Executes fix steps:
   - Adds nil checks to AuthService.swift
   - Updates EmailValidator.swift
   - Adds test cases
5. Runs tests (if MCP configured)
6. Reports completion

**Output:**
```
✅ Bug fix implemented

Files modified:
- BakingApp/Services/AuthService.swift
- BakingApp/Utilities/EmailValidator.swift
- BakingAppTests/AuthServiceTests.swift

Tests: All passing ✓

Next steps:
1. Manually test the login flow
2. Verify fix resolves the crash
3. Test with edge cases
```

### Example 3: Implement Chore/Refactor

```
/implement specs/chore-refactor-auth-service.md
```

**What happens:**
1. Validates spec file exists
2. Routes to SwiftUI implementation handler
3. Reads refactor plan
4. Executes refactor steps:
   - Updates AuthService to use new OAuth API
   - Migrates existing code
   - Updates tests
5. Reports completion

---

## Output

Implementation handler:
- Creates/modifies files as specified in spec
- Reports progress during execution
- Summarizes changes when complete
- Suggests next steps for testing/verification

**No new spec file created** - Implementation executes the existing spec.

---

## Error Handling

### No Architecture Loaded

```
❌ Architecture not loaded

Run /prime first:
/prime
/implement specs/feature-dark-mode.md
```

### Missing Spec File Argument

```
❌ Spec file path required

Usage:
/implement <spec-file-path>

First create a spec:
/feature "your feature description"
/bug "bug description"
/chore "chore description"

Then implement it:
/implement specs/[generated-spec].md
```

### Spec File Not Found

```
❌ Spec file not found: specs/feature-missing.md

Available specs in specs/:
- specs/feature-dark-mode.md
- specs/bug-login-crash.md
- specs/chore-refactor-services.md

Check the file path and try again.
```

### Invalid Spec File Format

```
❌ Invalid spec file format

The spec file must be created by /feature, /bug, or /chore commands.

Expected structure:
- Feature/Bug/Chore description
- Implementation Plan section
- Steps to execute

Please regenerate the spec or fix the format.
```

### Implementation Error

```
❌ Error during implementation

Step: Create AuthService.swift
Error: File already exists

Options:
1. Modify the spec to update instead of create
2. Delete the existing file first
3. Use a different file name

Implementation stopped at this step.
```

---

## Performance

**Speed:** Varies by complexity

- **Simple implementation** (1-2 files): 1-2 minutes
- **Medium implementation** (3-5 files): 2-4 minutes
- **Complex implementation** (6+ files): 4-10 minutes

**Context loading:**
- Spec reading: ~1-3K tokens
- Design system (if needed): ~2K tokens
- Domain knowledge (if needed): ~5K tokens
- Total: ~3-10K tokens (< 5% of window)

---

## Workflow

**Typical workflow:**

1. **Prime project** (once per session)
   ```
   /prime
   ```

2. **Plan work**
   ```
   /feature "add dark mode"
   ```
   Creates: `specs/feature-dark-mode.md`

3. **Review and edit the spec** (optional)
   ```
   # Open specs/feature-dark-mode.md
   # Edit steps, add details, adjust approach
   # Save changes
   ```

4. **Implement the spec**
   ```
   /implement specs/feature-dark-mode.md
   ```
   Executes the plan, creates/modifies files

5. **Test and iterate**
   - Build and run
   - Fix issues with `/bug "description"`
   - Refine with `/chore "description"`

---

## Notes

- **Reads spec files** - Created by /feature, /bug, or /chore
- **Executes steps** - Follows the implementation plan in order
- **Architecture-compliant** - Enforces patterns during execution
- **Context-aware** - Auto-loads design system/domain as needed
- **Idempotent** - Can run multiple times (within reason)
- **Safe** - Stops on errors, reports what happened

---

## Related Commands

- `/prime` - Load project context (run first)
- `/feature` - Plan a new feature (creates spec)
- `/bug` - Plan a bug fix (creates spec)
- `/chore` - Plan a chore/refactor (creates spec)

---

## Workflow Loop

```
/prime
  ↓
/feature "description"
  ↓ Creates specs/feature-*.md
/implement specs/feature-*.md
  ↓ Executes plan, creates/modifies files
Build & Test
  ↓ (if bugs found)
/bug "description"
  ↓ Creates specs/bug-*.md
/implement specs/bug-*.md
  ↓ Executes fix
Done!
```

---

**This is the implementation execution command - the final step in the plan → implement workflow.**
