# Bug Fix Planning Router

Detects project type and routes to appropriate technology-specific bug fix planner.

**Philosophy:** Universal entry point, smart routing to tech-specific templates.

---

## What This Does

1. **Checks if primed** (architecture loaded)
2. **Detects project type** (if not already known)
3. **Routes to tech-specific bug planner** (e.g., `swiftui/bug.md`)

**Context loaded:** ~0 tokens (just routing)

---

## Instructions

You are routing a bug fix planning request to the appropriate technology-specific planner.

---

## Step 1: Verify Architecture Loaded

**Check if architecture is in context:**

Architecture should have been loaded by `/prime`. If not loaded:
```
⚠️ Architecture not loaded

Please run /prime first to load project context.

Example:
/prime
/bug "your bug description"
```

**Stop and wait for user to run `/prime`.**

---

## Step 2: Detect Project Type

**Check what technology was detected by prime:**

### If SwiftUI Detected

Look for indicators in context:
- SwiftUI architecture patterns loaded
- iOS version strategy
- @Observable mentions

**Confirmed:** SwiftUI project

### If React Detected

Look for indicators:
- React architecture patterns
- Component/hook mentions

**Confirmed:** React project (Coming in v2.0.0)

### If Python Detected

Look for indicators:
- Python architecture patterns
- Module structure

**Confirmed:** Python project (Coming in v2.0.0)

### If Unknown
```
⚠️ Unable to detect project type

Please run /prime first to detect project type.
```

**Stop and wait for user.**

---

## Step 3: Route to Technology-Specific Bug Planner

Based on detection:

### If SwiftUI
```
✅ Detected: SwiftUI project
🐛 Routing to: .claude/swiftui/bug.md
```

**Execute:** `.claude/swiftui/bug.md`

**Pass through arguments:**
```
$ARGUMENTS
```

The SwiftUI bug planner will:
- Auto-load design system (if UI bug)
- Auto-load domain (if domain-related bug)
- Generate bug fix plan
- Output to `specs/bug-*.md`

### If React
```
✅ Detected: React project
🐛 Routing to: .claude/commands/react/bug.md
```

**Execute:** `.claude/commands/react/bug.md`

(Coming in v2.0.0)

### If Python
```
✅ Detected: Python project
🐛 Routing to: .claude/commands/python/bug.md
```

**Execute:** `.claude/commands/python/bug.md`

(Coming in v2.0.0)

---

## Error Handling

### No Technology Detected
```
❌ Unable to route bug fix planning

No project type detected. Please:
1. Run /prime to detect project type
2. Ensure you're in a project directory
3. Check that .claude is properly installed

Current directory: [show pwd]
```

### Multiple Technologies Detected
```
⚠️ Multiple project types detected

Found:
- SwiftUI files: Yes
- React files: Yes

Please clarify which technology you're working with in the bug description.
```

---

## Arguments
```
$ARGUMENTS - Bug description
```

**Usage:**
```
/bug "login button not responding on iPad"
/bug "app crashes when scrolling recipe list"
/bug "dark mode colors incorrect in settings"
```

---

## Notes

- **Zero context usage** - Just routing logic
- **Fast** - No file reads, just detection and routing
- **Universal** - Works for any supported technology
- **Extensible** - Easy to add new technologies

---

**This is the universal entry point for bug fix planning.**