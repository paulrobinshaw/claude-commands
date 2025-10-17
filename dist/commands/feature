# Feature - Universal Feature Planner

Plan a new feature using architecture patterns and domain knowledge.

**Philosophy:** Smart routing to technology-specific feature planners with auto-loading context.

---

## What This Does

1. **Verifies project is primed** (architecture loaded)
2. **Detects project type** (if not already known)
3. **Routes to technology-specific feature planner**
4. **Auto-loads relevant context** (design system for UI, domain for business logic)

**Context loaded:** Variable (0-10K tokens depending on feature type)

---

## Instructions

You are planning a feature. Route to appropriate technology-specific planner.

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
/feature "add user authentication"
```

**Stop and wait for user to run `/prime`.**

---

## Step 2: Route to Feature Planner

**Execute:** `.claude/routers/feature.md`

The router will:
1. Detect project type (SwiftUI, React, Python)
2. Route to appropriate technology-specific feature planner
3. Pass through the feature description

**Pass arguments:**
```
$ARGUMENTS - Feature description from user
```

The technology-specific planner will:
- Auto-load design system (if UI feature)
- Auto-load domain knowledge (if domain keywords detected)
- Generate architecture-compliant implementation plan
- Output to `specs/feature-[name].md`

---

## Arguments

```
$ARGUMENTS - Feature description
```

**Usage:**

```bash
/feature "add user authentication with email and password"
/feature "add dark mode support"
/feature "add recipe scaling with baker's percentages"
/feature "refactor payment processing to use new API"
```

---

## Examples

### Example 1: UI Feature

```
/feature "add dark mode toggle to settings screen"
```

**What happens:**
1. Detects UI keywords ("screen", "toggle", "settings")
2. Auto-loads design system (~2K tokens)
3. Routes to SwiftUI feature planner
4. Generates plan using design system tokens
5. Outputs to `specs/feature-dark-mode-toggle.md`

### Example 2: Domain Feature

```
/feature "add recipe scaling with baker's percentages"
```

**What happens:**
1. Detects domain keywords ("recipe", "baker's percentages")
2. Auto-loads domain knowledge (~5K tokens)
3. Routes to SwiftUI feature planner
4. Generates plan using domain entities and calculations
5. Outputs to `specs/feature-recipe-scaling.md`

### Example 3: Combined Feature

```
/feature "add hydration calculator to recipe card"
```

**What happens:**
1. Detects UI keywords ("card") + domain keywords ("hydration", "recipe")
2. Auto-loads design system (~2K tokens)
3. Auto-loads domain knowledge (~5K tokens)
4. Routes to SwiftUI feature planner
5. Generates comprehensive plan
6. Outputs to `specs/feature-hydration-calculator.md`

---

## Output

Feature planner creates:

```
specs/feature-[name].md
```

**Contents:**
- Feature overview
- User stories
- Architecture decisions
- Component breakdown
- Implementation steps
- Testing strategy
- Files to create/modify

**Example output structure:**
```markdown
# Feature: Dark Mode Toggle

## Overview
Add dark mode toggle to Settings screen.

## User Stories
- As a user, I want to toggle dark mode
- As a user, I want my preference saved

## Architecture
- Use @AppStorage for persistence
- Update ColorScheme in App struct
- Follow design system tokens

## Components
1. SettingsView (modify)
   - Add dark mode toggle row
   - Use DS.Colors.* tokens

2. App struct (modify)
   - Add @AppStorage("darkMode")
   - Apply .preferredColorScheme()

## Implementation Steps
[Detailed steps...]

## Testing
[Test cases...]

## Files to Modify
- BakingApp/Views/SettingsView.swift
- BakingApp/BakingAppApp.swift
```

---

## Error Handling

### No Architecture Loaded

```
❌ Architecture not loaded

Run /prime first:
/prime
/feature "your feature"
```

### Invalid Feature Description

```
❌ Feature description required

Usage:
/feature "feature description"

Examples:
/feature "add user login"
/feature "refactor data layer"
```

### Multiple Technologies Detected

Router will handle this - see `routers/feature.md`

---

## Smart Context Loading

The feature planner intelligently loads context based on keywords:

**UI Keywords** → Load design system:
- screen, view, component, button, card, list, navigation, modal, sheet
- color, font, spacing, layout, animation
- UI, interface, display

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

**UI Feature (design system loaded):**
- Context: ~2,000 tokens
- Speed: ~2 seconds

**Domain Feature (domain knowledge loaded):**
- Context: ~5,000 tokens
- Speed: ~3 seconds

**Complex Feature (both loaded):**
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

2. **Plan features** (as needed)
   ```
   /feature "add user authentication"
   /feature "add payment processing"
   /feature "add dark mode"
   ```

3. **Implement features** (from plans)
   ```
   /implement specs/feature-user-authentication.md
   /implement specs/feature-payment-processing.md
   ```

4. **Fix bugs** (as they arise)
   ```
   /bug "login fails with special characters"
   ```

---

## Notes

- **Zero-config** - Just works after `/prime`
- **Smart loading** - Only loads what's needed
- **Fast** - < 4 seconds even for complex features
- **Consistent** - Always follows architecture patterns
- **Documented** - Creates detailed implementation plan

---

## Related Commands

- `/prime` - Load project context (run first)
- `/implement` - Implement from a feature plan
- `/bug` - Plan a bug fix
- `/chore` - Plan a chore/refactor

---

**This is the main command for planning features.**
