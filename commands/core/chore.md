# Chore - Universal Chore/Refactor Planner

Plan refactors, maintenance tasks, and technical improvements.

**Philosophy:** Smart routing to technology-specific chore planners with structured planning.

---

## What This Does

1. **Verifies project is primed** (architecture loaded)
2. **Detects project type** (if not already known)
3. **Routes to technology-specific chore planner**
4. **Generates detailed refactor/maintenance plan**

**Context loaded:** Variable (0-10K tokens depending on chore type)

---

## Instructions

You are planning a chore (refactor, update, or maintenance task). Route to appropriate technology-specific planner.

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
/chore "refactor authentication to use async/await"
```

**Stop and wait for user to run `/prime`.**

---

## Step 2: Route to Chore Planner

**Execute:** `.claude/commands/routers/chore.md`

The router will:
1. Detect project type (SwiftUI, React, Python)
2. Route to appropriate technology-specific chore planner
3. Pass through the chore description

**Pass arguments:**
```
$ARGUMENTS - Chore description from user
```

The technology-specific planner will:
- Analyze the refactor scope
- Identify affected files
- Auto-load design system (if UI refactor)
- Auto-load domain knowledge (if business logic refactor)
- Generate step-by-step plan
- Output to `specs/chore-[name].md`

---

## Arguments

```
$ARGUMENTS - Chore description
```

**Usage:**

```bash
/chore "update to iOS 18 SDK"
/chore "refactor authentication service to use async/await"
/chore "migrate from UserDefaults to SwiftData"
/chore "extract recipe calculations into separate service"
```

---

## Examples

### Example 1: Framework Update

```
/chore "update to iOS 18 SDK"
```

**What happens:**
1. Detects platform update task
2. Routes to SwiftUI chore planner
3. Generates plan with:
   - Xcode project updates
   - Deprecated API replacements
   - New API adoptions
   - Testing strategy
4. Outputs to `specs/chore-update-ios-18.md`

### Example 2: Architecture Refactor

```
/chore "refactor authentication service to use async/await"
```

**What happens:**
1. Detects architecture change
2. Auto-loads relevant architecture patterns
3. Routes to SwiftUI chore planner
4. Generates plan with:
   - Files to modify
   - Callback → async/await conversions
   - Error handling updates
   - Testing approach
5. Outputs to `specs/chore-refactor-auth-async.md`

### Example 3: Data Migration

```
/chore "migrate from UserDefaults to SwiftData"
```

**What happens:**
1. Detects data layer change
2. Auto-loads domain knowledge (if custom entities)
3. Routes to SwiftUI chore planner
4. Generates plan with:
   - SwiftData model creation
   - Migration code
   - Data conversion logic
   - Backwards compatibility
5. Outputs to `specs/chore-migrate-swiftdata.md`

### Example 4: Code Extraction

```
/chore "extract recipe calculations into separate service"
```

**What happens:**
1. Detects code organization task
2. Detects domain keywords ("recipe", "calculations")
3. Auto-loads domain knowledge (~5K tokens)
4. Routes to SwiftUI chore planner
5. Generates plan with:
   - New service structure
   - Code to move
   - Dependencies to update
   - Testing plan
6. Outputs to `specs/chore-extract-recipe-calculations.md`

---

## Output

Chore planner creates:

```
specs/chore-[name].md
```

**Contents:**
- Chore overview
- Motivation (why it's needed)
- Affected files
- Step-by-step implementation
- Testing strategy
- Rollback plan
- Estimated effort

**Example output structure:**
```markdown
# Chore: Refactor Authentication to Async/Await

## Overview
Modernize authentication service to use async/await instead of callbacks

## Motivation
- Simplify error handling
- Improve readability
- Adopt modern Swift patterns
- Prepare for iOS 18+ features

## Affected Files
- AuthService.swift (major changes)
- LoginView.swift (update call sites)
- RegistrationView.swift (update call sites)
- AuthServiceTests.swift (update tests)

## Implementation Steps

### Step 1: Update AuthService interface
- Change methods from callback-based to async
- Example: `login(completion:)` → `login() async throws`

### Step 2: Update method implementations
- Replace callbacks with async/await
- Add proper error throwing
- Update URLSession calls

### Step 3: Update call sites
- Update views to use .task instead of .onAppear
- Add proper error handling
- Update loading states

### Step 4: Update tests
- Convert test expectations to async
- Add error case tests
- Verify all flows work

## Testing Strategy
- Unit tests: AuthServiceTests (all pass)
- Integration: Login/logout flows
- Manual: Test all auth screens
- Regression: Verify no existing features broken

## Rollback Plan
1. Revert commit if issues found
2. Keep old callback methods temporarily (deprecated)
3. Gradual migration if needed

## Estimated Effort
- Implementation: 4 hours
- Testing: 2 hours
- Total: 6 hours
```

---

## Error Handling

### No Architecture Loaded

```
❌ Architecture not loaded

Run /prime first:
/prime
/chore "your chore description"
```

### Invalid Chore Description

```
❌ Chore description required

Usage:
/chore "description of refactor or maintenance task"

Examples:
/chore "update dependencies"
/chore "refactor data layer"
```

### Multiple Technologies Detected

Router will handle this - see `commands/routers/chore.md`

---

## Smart Context Loading

The chore planner intelligently loads context based on keywords:

**UI Keywords** → Load design system:
- view, screen, component, UI, interface
- layout, styling, theme
- design system, colors, fonts

**Domain Keywords** → Load domain knowledge:
- Project-specific terms from `.claude/project/domain.md`
- Business logic terms
- Entity names (Recipe, Order, User, etc.)
- Calculation, formula, validation

**Architecture Keywords** → Use architecture patterns only:
- refactor, migrate, update, modernize
- async, observable, service, model

---

## Performance

**Minimum (no extra loading):**
- Context: ~0 tokens (just routing)
- Speed: < 1 second

**UI Chore (design system loaded):**
- Context: ~2,000 tokens
- Speed: ~2 seconds

**Domain Chore (domain knowledge loaded):**
- Context: ~5,000 tokens
- Speed: ~3 seconds

**Complex Chore (both loaded):**
- Context: ~7,000 tokens
- Speed: ~4 seconds

**Still under 4% of context window!**

---

## Workflow

**Typical workflow:**

1. **Prime project** (once per session)
   ```
   /prime
   ```

2. **Plan chore**
   ```
   /chore "refactor authentication to async/await"
   ```

3. **Review the plan**
   ```
   cat specs/chore-refactor-auth-async.md
   ```

4. **Implement** (from plan)
   ```
   /implement specs/chore-refactor-auth-async.md
   ```

5. **Test thoroughly**
   - Run automated tests
   - Manual verification
   - Check for regressions

6. **Document changes**
   - Update CHANGELOG.md
   - Update relevant docs

---

## Chore Types

### Refactoring
- Code reorganization
- Extracting methods/classes
- Improving code structure
- No behavior change

### Dependency Updates
- Framework updates (iOS SDK, React, etc.)
- Library updates (third-party)
- Tool updates (Xcode, npm, etc.)

### Migrations
- Data layer migrations (Core Data → SwiftData)
- Storage migrations (UserDefaults → Database)
- API migrations (v1 → v2)
- Pattern migrations (callbacks → async/await)

### Code Cleanup
- Remove deprecated code
- Remove unused imports
- Fix warnings
- Improve naming

### Technical Debt
- Address TODO comments
- Improve test coverage
- Add missing documentation
- Performance improvements

---

## Notes

- **Zero-config** - Just works after `/prime`
- **Smart loading** - Only loads what's needed
- **Fast** - < 4 seconds even for complex chores
- **Structured** - Follows systematic planning
- **Architecture-compliant** - Changes follow patterns
- **Reversible** - Includes rollback plan

---

## Related Commands

- `/prime` - Load project context (run first)
- `/feature` - Plan a new feature
- `/bug` - Plan a bug fix
- `/implement` - Implement from a chore plan

---

**This is the main command for planning chores and refactors.**
