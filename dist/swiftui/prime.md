# SwiftUI Project Primer

Loads minimal SwiftUI context with lazy loading strategy.

**Philosophy:** Load only essentials (~4.5K tokens), let templates auto-load the rest.

---

## What This Does

1. **Loads SwiftUI architecture** (~3K tokens)
2. **Loads small files** (version, MCP config)
3. **Checks** (but doesn't load) design system and domain
4. **Reports** what's available

**Context loaded:** ~4,500 tokens (2% of context window)

---

## Instructions

Called by `core/prime.md` after detecting SwiftUI project.

---

## Step 1: Load SwiftUI Architecture

Read: `.claude/swiftui/architecture.md`
```
📚 Loading SwiftUI architecture patterns...
```

**Loaded (~3,000 tokens):**
- ✅ NO ViewModel philosophy
- ✅ @Observable services pattern
- ✅ Component decomposition rules (views < 150 lines)
- ✅ State management (@State, @Binding, @Environment)
- ✅ Modern SwiftUI patterns (NavigationStack, #Preview, etc.)
```
✅ SwiftUI architecture loaded
```

---

## Step 2: Explore Project Structure

Quick exploration:
```bash
# Find Xcode project
find . -maxdepth 3 -name "*.xcodeproj" -o -name "*.xcworkspace" | head -1

# Get project name
basename *.xcodeproj .xcodeproj 2>/dev/null || echo "Unknown"

# Check README
head -5 README.md 2>/dev/null
```

**Extract project name and brief description.**

---

## Step 3: Load Small Always-Needed Files

### Version Strategy

If exists: `.claude/project/version.md`
```
📚 Loading version strategy...
```

Read full file (~1,000 tokens)

**Loaded:**
- Target iOS: [version]
- Minimum iOS: [version]
- Patterns to use/avoid
```
✅ Version strategy loaded (iOS [target]+, min [minimum])
```

If not found:
```
ℹ️ No version strategy found (assuming latest iOS patterns)
```

### MCP Configuration

If exists: `.claude/project/mcp.md`
```
📚 Loading MCP configuration...
```

Read full file (~500 tokens)

**Loaded:**
- Available MCPs
- Configuration details
```
✅ MCP configuration loaded
```

If not found:
```
ℹ️ No MCP config found (will auto-detect)
```

---

## Step 4: Check for Lazy-Load Files (DON'T LOAD YET)

### Design System Check

If exists: `.claude/project/design-system.md`
```bash
# Read just the first 10 lines to get name
head -10 .claude/project/design-system.md
```

Extract design system name from header.
```
📚 Design System available: [Name]
   Load with: /ds
   Auto-loaded by: /feature, /component
   Size: ~2,000 tokens

   NOT loaded yet (lazy loading)
```

If not found:
```
⚠️ No design system found

Hardcoded values will be flagged during implementation.
Consider creating: .claude/project/design-system.md
```

### Domain Knowledge Check

If exists: `.claude/project/domain.md`
```bash
# Read just the first 10 lines to get domain name
head -10 .claude/project/domain.md
```

Extract domain name from header.
```
📚 Domain knowledge available: [Domain]
   Load with: /domain
   Auto-loaded by: /feature (if keywords match)
   Size: ~8,000 tokens

   NOT loaded yet (lazy loading)
```

If not found:
```
ℹ️ No domain knowledge

Generic feature planning available.
Add domain-specific knowledge: .claude/project/domain.md
```

---

## Step 5: Detect Available MCPs

Auto-detect MCP servers:
```
🔧 Detecting MCPs...
```

### XcodeBuildMCP

Check if XcodeBuildMCP is available (environment-specific check)

If available:
```
✅ XcodeBuildMCP
   - Automated building
   - Automated testing
   - Auto-validation in /implement
```

If not available:
```
❌ XcodeBuildMCP (not detected)
   - Manual build/test required
   - Install: https://github.com/example/xcode-build-mcp
```

### GitMCP

Similar check for GitMCP.

### Other MCPs

Check for other known MCPs.

---

## Step 6: Project Summary Report

Generate comprehensive summary:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Ready to work on: [Project Name]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**Project Type:** SwiftUI iOS Application

**Architecture:** Component-based + @Observable Services (NO ViewModels)

**Context Loaded (~4,500 tokens / 2%):**
- ✅ SwiftUI architecture patterns
- ✅ iOS version strategy ([target]+, min [minimum])
- ✅ MCP configuration

**Context Available (lazy-load when needed):**
- 📚 Design System: [Name] (~2K tokens)
     Load: /ds
     Auto-loaded by: /feature, /component

- 📚 Domain Knowledge: [Domain] (~8K tokens)
     Load: /domain
     Auto-loaded by: /feature (if domain keywords detected)

**MCPs Available:**
- ✅ XcodeBuildMCP - Automated build/test
- ✅ GitMCP - Git operations
- ❌ [Other] - Not configured

**Available Commands:**

Planning:
  /feature "description"  - Plan new features (auto-loads DS + domain)
  /bug "description"      - Fix bugs (auto-loads as needed)
  /chore "description"    - Plan chores (refactor, updates)
  /component "Name"       - Create UI components (auto-loads DS)
  /service "Name"         - Create @Observable services (auto-loads domain)
  /model "Name"           - Create SwiftData models
  /tests "Target"         - Plan test suites

Implementation:
  /implement specs/*.md   - Execute plans (auto-validates with MCP)

Manual Context Loaders:
  /ds                     - Load design system manually
  /domain                 - Load domain knowledge manually

Utilities:
  /tools                  - Show all available commands

**Context Efficiency:**
- Loaded: ~4,500 tokens (2%)
- Available for work: ~195,500 tokens (98%)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Ready! Start with /feature, /bug, or /component
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Notes

- **Minimal loading** - Only ~4.5K tokens (2%)
- **Smart checking** - Knows what's available without loading
- **Clear reporting** - User knows exactly what they can do
- **Lazy loading ready** - Templates will auto-load as needed

---

**This is the SwiftUI-specific primer with efficient context management.**