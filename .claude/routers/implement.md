# Implementation Router

Detects project type and routes to appropriate technology-specific implementation handler.

**Philosophy:** Universal entry point, smart routing to tech-specific executors.

---

## What This Does

1. **Checks if primed** (architecture loaded)
2. **Detects project type** (if not already known)
3. **Routes to tech-specific implementation handler** (e.g., `swiftui/implement.md`)

**Context loaded:** ~0 tokens (just routing)

---

## Instructions

You are routing an implementation request to the appropriate technology-specific handler.

---

## Step 1: Verify Architecture Loaded

**Check if architecture is in context:**

Architecture should have been loaded by `/prime`. If not loaded:
```
⚠️ Architecture not loaded

Please run /prime first to load project context.

Example:
/prime
/implement specs/feature-dark-mode.md
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

## Step 3: Route to Technology-Specific Implementation Handler

Based on detection:

### If SwiftUI
```
✅ Detected: SwiftUI project
⚙️ Routing to: .claude/swiftui/implement.md
```

**Execute:** `.claude/swiftui/implement.md`

**Pass through arguments:**
```
$ARGUMENTS
```

The SwiftUI implementation handler will:
- Read the spec file
- Parse implementation steps
- Auto-load design system (if UI implementation)
- Auto-load domain (if domain-related implementation)
- Execute steps: create files, modify files
- Follow architecture patterns
- Report progress and completion

### If React
```
✅ Detected: React project
⚙️ Routing to: .claude/commands/react/implement.md
```

**Execute:** `.claude/commands/react/implement.md`

(Coming in v2.0.0)

### If Python
```
✅ Detected: Python project
⚙️ Routing to: .claude/commands/python/implement.md
```

**Execute:** `.claude/commands/python/implement.md`

(Coming in v2.0.0)

---

## Error Handling

### No Technology Detected
```
❌ Unable to route implementation

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

Please clarify which technology you're implementing for.

Or use technology-specific command:
- SwiftUI: /swiftui-implement "..."
- React: /react-implement "..."
```

---

## Arguments
```
$ARGUMENTS - Spec file path
```

**Usage:**
```
/implement specs/feature-user-authentication.md
/implement specs/bug-login-crash.md
/implement specs/chore-refactor-services.md
```

---

## Notes

- **Zero context usage** - Just routing logic
- **Fast** - No file reads, just detection and routing
- **Universal** - Works for any supported technology
- **Extensible** - Easy to add new technologies

---

**This is the universal entry point for implementation execution.**
