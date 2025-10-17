# Prime - Project Context Loader

Universal entry point that detects project type and loads minimal context.

**Philosophy:** Load only essentials, let specialized commands load the rest.

---

## What This Does

1. **Detects project type** (SwiftUI, React, Python, etc.)
2. **Routes to technology-specific primer** (e.g., `swiftui/prime.md`)
3. **Loads minimal architecture context** (~4-5K tokens)
4. **Reports what's available** (design system, domain, version, MCP)

**Context loaded:** ~4,500 tokens (2% of context window)

---

## Instructions

You are the universal project primer. Detect technology and route to appropriate tech-specific primer.

---

## Step 1: Detect Project Type

Check for technology indicators in current directory:

### SwiftUI Detection

Look for:
```bash
# Check for SwiftUI files
ls -la *.xcodeproj 2>/dev/null
ls -la *.xcworkspace 2>/dev/null
find . -name "*.swift" -type f | head -3
```

**If found:**
- ✅ SwiftUI project detected
- 📂 Xcode project: [project name]
- 📱 Technology: iOS/macOS

**Route to:** `.claude/commands/swiftui/prime.md`

### React Detection

Look for:
```bash
# Check for React files
ls -la package.json 2>/dev/null
grep -l "react" package.json 2>/dev/null
find . -name "*.jsx" -o -name "*.tsx" | head -3
```

**If found:**
- ✅ React project detected
- 📦 Package: package.json found
- 🌐 Technology: Web/React Native

**Route to:** `.claude/commands/react/prime.md` (Coming in v2.0)

### Python Detection

Look for:
```bash
# Check for Python files
ls -la requirements.txt 2>/dev/null
ls -la pyproject.toml 2>/dev/null
ls -la setup.py 2>/dev/null
find . -name "*.py" -type f | head -3
```

**If found:**
- ✅ Python project detected
- 🐍 Technology: Python

**Route to:** `.claude/commands/python/prime.md` (Coming in v2.0)

---

## Step 2: Route to Technology-Specific Primer

### If SwiftUI Detected

```
✅ Detected: SwiftUI project
📋 Loading SwiftUI context...
```

**Execute:** Read and follow `.claude/commands/swiftui/prime.md`

The SwiftUI primer will:
1. Load SwiftUI architecture patterns
2. Check (but not load) design system
3. Check (but not load) domain knowledge
4. Check version strategy
5. Check MCP configuration
6. Report what's available

**Pass control** to SwiftUI primer completely.

### If React Detected

```
✅ Detected: React project
📋 Loading React context...
```

**Execute:** `.claude/commands/react/prime.md`

(Coming in v2.0.0)

### If Python Detected

```
✅ Detected: Python project
📋 Loading Python context...
```

**Execute:** `.claude/commands/python/prime.md`

(Coming in v2.0.0)

### If Multiple Technologies Detected

```
⚠️ Multiple technologies detected:
- SwiftUI: Yes (*.swift files, .xcodeproj)
- React: Yes (package.json with react)

Which technology are you working with?
1. SwiftUI
2. React

Please clarify, or use technology-specific prime:
- SwiftUI: /swiftui-prime
- React: /react-prime
```

**Wait for user input.**

### If No Technology Detected

```
❌ Unable to detect project type

Checked for:
- SwiftUI (*.swift, .xcodeproj): Not found
- React (package.json, *.jsx): Not found
- Python (*.py, requirements.txt): Not found

Are you in a project directory?

Current directory: [show pwd]

Supported technologies:
- SwiftUI/iOS (v1.0)
- React (Coming in v2.0)
- Python (Coming in v2.0)

Please:
1. Navigate to your project directory
2. Run /prime again
```

**Stop and wait for user.**

---

## Step 3: Verify Context Loaded

After tech-specific primer completes, verify:

```
✅ Project primed successfully

Technology: [SwiftUI/React/Python]
Architecture: Loaded (~3K tokens)
Design System: Available (lazy load)
Domain Knowledge: Available (lazy load)
Version Strategy: Loaded (~500 tokens)
MCP Config: Loaded (~500 tokens)

Total context: ~4,500 tokens (2% of window)

Next steps:
- /feature "your feature" - Plan a new feature
- /bug "issue description" - Plan a bug fix
- /chore "task description" - Plan a chore

Need more context?
- Design system will auto-load on UI features
- Domain knowledge will auto-load on domain keywords
```

---

## Error Handling

### .claude Directory Not Found

```
❌ .claude directory not found

Claude Commands requires .claude/commands/ to be set up.

Installation:
1. Clone or install claude-commands
2. Set up .claude structure:
   mkdir -p .claude/commands
   ln -s path/to/claude-commands/commands/* .claude/commands/

Or follow: docs/getting-started.md
```

### No Architecture Files Found

```
⚠️ No architecture files found

Expected: .claude/commands/[technology]/architecture.md

Please ensure:
1. Claude Commands is properly installed
2. .claude/commands/ contains technology commands
3. You're using a supported technology

See: docs/customization-guide.md
```

---

## Performance

**Speed:** < 2 seconds
**Context:** ~4,500 tokens (2% of 200K window)
**Files Read:** 3-5 small files

**Why Fast:**
- Lazy loading (don't load design system/domain unless needed)
- Small architecture files
- Minimal detection commands

---

## Arguments

No arguments required. Just run:

```
/prime
```

---

## Notes

- **Universal entry point** - Works for any supported technology
- **Minimal context** - Only loads essentials
- **Smart routing** - Detects and routes automatically
- **Extensible** - Easy to add new technologies
- **Fast** - < 2 seconds, ~4.5K tokens

---

## Adding New Technologies

To add support for a new technology:

1. Create `commands/[technology]/prime.md`
2. Create `commands/[technology]/architecture.md`
3. Add detection logic to Step 1 above
4. Add routing logic to Step 2 above

Example for Go:
```bash
# In Step 1, add:
### Go Detection
ls -la go.mod 2>/dev/null
find . -name "*.go" -type f | head -3

# In Step 2, add routing:
### If Go Detected
Execute: .claude/commands/go/prime.md
```

---

**This is the main entry point for Claude Commands.**
