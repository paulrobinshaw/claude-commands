# Chore Planning Router

Detects project type and routes to appropriate technology-specific chore planner.

**Philosophy:** Universal entry point, smart routing to tech-specific templates.

---

## What This Does

1. **Checks if primed** (architecture loaded)
2. **Detects project type** (if not already known)
3. **Routes to tech-specific chore planner** (e.g., `swiftui/chore.md`)

**Context loaded:** ~0 tokens (just routing)

---

## Instructions

You are routing a chore planning request to the appropriate technology-specific planner.

---

## Step 1: Verify Architecture Loaded

**Check if architecture is in context:**

Architecture should have been loaded by `/prime`. If not loaded:
```
⚠️ Architecture not loaded

Please run /prime first to load project context.

Example:
/prime
/chore "your chore description"
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

## Step 3: Route to Technology-Specific Chore Planner

Based on detection:

### If SwiftUI
```
✅ Detected: SwiftUI project
🔧 Routing to: .claude/commands/swiftui/chore.md
```

**Execute:** `.claude/commands/swiftui/chore.md`

**Pass through arguments:**
```
$ARGUMENTS
```

The SwiftUI chore planner will:
- Generate chore plan (refactor, dependency update, etc.)
- Output to `specs/chore-*.md`

### If React
```
✅ Detected: React project
🔧 Routing to: .claude/commands/react/chore.md
```

**Execute:** `.claude/commands/react/chore.md`

(Coming in v2.0.0)

### If Python
```
✅ Detected: Python project
🔧 Routing to: .claude/commands/python/chore.md
```

**Execute:** `.claude/commands/python/chore.md`

(Coming in v2.0.0)

---

## Error Handling

### No Technology Detected
```
❌ Unable to route chore planning

No project type detected. Please:
1. Run /prime to detect project type
2. Ensure you're in a project directory
3. Check that .claude is properly installed

Current directory: [show pwd]
```

---

## Arguments
```
$ARGUMENTS - Chore description
```

**Usage:**
```
/chore "update to iOS 18 SDK"
/chore "refactor authentication service to use async/await"
/chore "migrate from UserDefaults to SwiftData"
```

---

## Notes

- **Zero context usage** - Just routing logic
- **Fast** - No file reads, just detection and routing
- **Universal** - Works for any supported technology
- **Extensible** - Easy to add new technologies

---

**This is the universal entry point for chore planning.**