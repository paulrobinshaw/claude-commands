# Bug - Universal Bug Fix Planner

Plan a bug fix using architecture patterns and root cause analysis.

**Philosophy:** Smart routing to technology-specific bug fix planners with systematic debugging.

---

## What This Does

1. **Verifies project is primed** (architecture loaded)
2. **Detects project type** (if not already known)
3. **Routes to technology-specific bug fix planner**
4. **Analyzes issue and generates fix plan**

**Context loaded:** Variable (0-10K tokens depending on bug type)

---

## Instructions

You are planning a bug fix. Route to appropriate technology-specific planner.

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
/bug "login fails with special characters"
```

**Stop and wait for user to run `/prime`.**

---

## Step 2: Route to Bug Fix Planner

**Execute:** `.claude/commands/routers/bug.md`

The router will:
1. Detect project type (SwiftUI, React, Python)
2. Route to appropriate technology-specific bug fix planner
3. Pass through the bug description

**Pass arguments:**
```
$ARGUMENTS - Bug description from user
```

The technology-specific planner will:
- Analyze the issue systematically
- Identify root cause
- Auto-load design system (if UI bug)
- Auto-load domain knowledge (if business logic bug)
- Generate fix plan with steps
- Output to `specs/bug-[name].md`

---

## Arguments

```
$ARGUMENTS - Bug description
```

**Usage:**

```bash
/bug "login fails when email contains plus sign"
/bug "app crashes on iPad in landscape mode"
/bug "recipe hydration calculation wrong for preferments"
/bug "dark mode toggle doesn't persist after app restart"
```

---

## Examples

### Example 1: UI Bug

```
/bug "dark mode toggle doesn't persist after app restart"
```

**What happens:**
1. Detects UI keywords ("toggle", "app")
2. Auto-loads design system (~2K tokens)
3. Routes to SwiftUI bug fix planner
4. Analyzes: Likely @AppStorage issue
5. Generates fix plan with steps
6. Outputs to `specs/bug-dark-mode-persistence.md`

### Example 2: Domain Bug

```
/bug "recipe hydration calculation wrong for preferments"
```

**What happens:**
1. Detects domain keywords ("recipe", "hydration", "preferments")
2. Auto-loads domain knowledge (~5K tokens)
3. Routes to SwiftUI bug fix planner
4. Analyzes: Preferment water not included in total
5. Generates fix with correct formula
6. Outputs to `specs/bug-hydration-calculation.md`

### Example 3: Crash Bug

```
/bug "app crashes when opening recipe with nil ingredients"
```

**What happens:**
1. Detects domain keywords ("recipe", "ingredients")
2. Auto-loads domain knowledge (~5K tokens)
3. Routes to SwiftUI bug fix planner
4. Analyzes: Nil safety issue in SwiftData relationship
5. Generates fix with nil checks
6. Outputs to `specs/bug-recipe-nil-crash.md`

---

## Output

Bug fix planner creates:

```
specs/bug-[name].md
```

**Contents:**
- Bug description
- Steps to reproduce
- Root cause analysis
- Affected files
- Fix implementation steps
- Testing verification
- Regression prevention

**Example output structure:**
```markdown
# Bug: Login Fails with Special Characters

## Description
Users cannot log in when email contains plus sign (+)

## Steps to Reproduce
1. Enter email with +: user+test@example.com
2. Enter password
3. Tap login
4. Error: "Invalid email format"

## Root Cause
Email validation regex doesn't allow + character
Location: AuthService.swift:42

## Affected Files
- AuthService.swift
- EmailValidator.swift

## Fix Implementation
1. Update regex pattern in EmailValidator
2. Add test cases for + character
3. Test with other special characters

## Testing
- Unit test: EmailValidatorTests
- Manual test: Login with user+test@example.com
- Regression: Verify normal emails still work

## Prevention
Add comprehensive email test suite
```

---

## Error Handling

### No Architecture Loaded

```
❌ Architecture not loaded

Run /prime first:
/prime
/bug "your bug description"
```

### Invalid Bug Description

```
❌ Bug description required

Usage:
/bug "description of the bug"

Examples:
/bug "app crashes on launch"
/bug "button not responding to taps"
```

### Multiple Technologies Detected

Router will handle this - see `commands/routers/bug.md`

---

## Smart Context Loading

The bug fix planner intelligently loads context based on keywords:

**UI Keywords** → Load design system:
- screen, view, component, button, UI, display, layout
- crash, freeze, unresponsive, render
- animation, transition, gesture

**Domain Keywords** → Load domain knowledge:
- Project-specific terms from `.claude/project/domain.md`
- Business logic terms
- Calculation, formula, validation
- Entity names (Recipe, Order, User, etc.)

**No Keywords** → Load nothing extra, use only architecture

---

## Performance

**Minimum (no extra loading):**
- Context: ~0 tokens (just routing)
- Speed: < 1 second

**UI Bug (design system loaded):**
- Context: ~2,000 tokens
- Speed: ~2 seconds

**Domain Bug (domain knowledge loaded):**
- Context: ~5,000 tokens
- Speed: ~3 seconds

**Complex Bug (both loaded):**
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

2. **Plan bug fix**
   ```
   /bug "description of the bug"
   ```

3. **Review the plan**
   ```
   cat specs/bug-[name].md
   ```

4. **Implement the fix** (from plan)
   ```
   /implement specs/bug-[name].md
   ```

5. **Verify fix**
   - Run tests
   - Manual verification
   - Check for regressions

---

## Bug Analysis Process

The technology-specific planner will:

1. **Understand the Issue**
   - What's the symptom?
   - When does it occur?
   - What's the expected behavior?

2. **Identify Root Cause**
   - Analyze code flow
   - Check common patterns
   - Review recent changes

3. **Assess Impact**
   - What's broken?
   - What else might be affected?
   - Is data at risk?

4. **Plan the Fix**
   - Minimal change to fix issue
   - Follow architecture patterns
   - Add tests to prevent regression

5. **Verify the Solution**
   - Unit tests
   - Integration tests
   - Manual verification

---

## Notes

- **Zero-config** - Just works after `/prime`
- **Smart loading** - Only loads what's needed
- **Fast** - < 4 seconds even for complex bugs
- **Systematic** - Follows debugging methodology
- **Architecture-compliant** - Fixes follow patterns

---

## Related Commands

- `/prime` - Load project context (run first)
- `/feature` - Plan a new feature
- `/chore` - Plan a refactor/chore
- `/implement` - Implement from a bug fix plan

---

**This is the main command for planning bug fixes.**
