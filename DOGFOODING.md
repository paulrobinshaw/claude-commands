# Dogfooding: Using Claude Commands to Develop Claude Commands

This guide shows how to use Claude Commands to improve Claude Commands itself.

---

## What is Dogfooding?

**Dogfooding** = "Eating your own dog food" = Using your own product

**Why it's valuable:**
- Tests the system in real-world usage
- Validates that patterns actually work
- Finds UX issues developers would hit
- Ensures quality (we use what we build)
- Provides authentic examples

---

## Setup (Already Done!)

The repository is already set up for dogfooding:

```
.claude/
├── commands/              ← Symlinks to commands/core/
│   ├── prime
│   ├── feature
│   ├── bug
│   └── chore
│
└── project/               ← Claude Commands customization
    ├── README.md          ← Usage guide
    ├── domain.md          ← Command structure, workflows
    └── version.md         ← File standards, conventions
```

**This means:** When you work on Claude Commands, you can use `/prime`, `/feature`, `/bug`, `/chore` to plan your work!

---

## How to Use

### Example 1: Adding React Support

**Scenario:** You want to add React support to Claude Commands

**Steps:**

1. **Prime the project:**
   ```
   /prime
   ```

2. **Plan the feature:**
   ```
   /feature "add React support with component templates"
   ```

3. **What happens:**
   - Loads `.claude/project/domain.md` (Claude Commands knowledge)
   - Understands command structure, workflows, patterns
   - Generates comprehensive plan
   - Outputs to `specs/feature-add-react-support.md`

4. **Review the plan:**
   ```bash
   cat specs/feature-add-react-support.md
   ```

5. **Implement:**
   Follow the plan step by step, or use:
   ```
   /implement specs/feature-add-react-support.md
   ```

---

### Example 2: Fixing a Bug

**Scenario:** Prime doesn't detect Python projects

**Steps:**

1. **Prime:** (if not already done)
   ```
   /prime
   ```

2. **Plan the fix:**
   ```
   /bug "prime doesn't detect Python projects"
   ```

3. **What happens:**
   - Analyzes the issue
   - Identifies root cause (likely in commands/core/prime.md detection logic)
   - Generates fix plan
   - Outputs to `specs/bug-prime-python-detection.md`

4. **Implement the fix:**
   Follow the plan's steps

---

### Example 3: Refactoring

**Scenario:** Router detection logic is getting complex

**Steps:**

1. **Prime:**
   ```
   /prime
   ```

2. **Plan the refactor:**
   ```
   /chore "refactor router detection logic into helper functions"
   ```

3. **What happens:**
   - Analyzes current router structure
   - Plans extraction of helper functions
   - Identifies files to modify
   - Generates refactoring steps
   - Outputs to `specs/chore-refactor-router.md`

4. **Implement:**
   Follow the plan carefully to maintain functionality

---

## What Gets Loaded

When you run `/prime` in the Claude Commands repository:

### Always Loaded
- **Architecture:** Command structure patterns (~3K tokens)
- **Version:** File standards, git conventions (~1K tokens)

### Auto-Loaded (if keywords detected)
- **Domain Knowledge:** When you mention "command", "router", "technology", "lazy loading", etc. (~5K tokens)

### Total Context
- ~4-9K tokens (2-4.5% of 200K window)
- Fast loading (< 2 seconds)
- Comprehensive knowledge of the system

---

## Domain Knowledge Included

### Entities
- **Command:** Structure, types, routing
- **Context:** Loading strategies, token budgets
- **Technology:** Supported platforms, structure

### Calculations
- **Token Budget:** Calculate if loading would exceed budget
- **Routing Path:** Trace command execution flow

### Workflows
- **Adding New Command:** Step-by-step process
- **Adding New Technology:** Complete checklist

### Terminology
- Lazy loading, smart routing, context window
- Architecture enforcement, dogfooding
- Token budget, technology-agnostic

---

## Example Sessions

### Session 1: Adding a New Command Type

```bash
# Prime
/prime

# Plan
/feature "add /analyze command for code analysis"

# Result: specs/feature-add-analyze-command.md
# Contains:
# - Core command structure
# - Router logic
# - Technology handlers (SwiftUI, React, Python)
# - Symlink setup
# - Testing strategy
# - Documentation updates
```

### Session 2: Fixing Documentation

```bash
# Prime
/prime

# Plan
/bug "README.md installation instructions unclear"

# Result: specs/bug-readme-installation.md
# Contains:
# - Issue analysis
# - User perspective
# - Improved instructions
# - Testing steps
```

### Session 3: Performance Optimization

```bash
# Prime
/prime

# Plan
/chore "optimize token usage in context loading"

# Result: specs/chore-optimize-token-usage.md
# Contains:
# - Current token usage analysis
# - Optimization opportunities
# - Implementation plan
# - Testing/verification
```

---

## Benefits You'll Experience

### 1. Better Planning
- Systematic approach to changes
- Nothing forgotten
- Clear implementation steps

### 2. Consistent Patterns
- Follows established conventions
- Maintains code quality
- Architecture compliance

### 3. Better Documentation
- Plans become documentation
- Future reference
- Onboarding new contributors

### 4. Faster Development
- Less decision fatigue
- Clear next steps
- Validated approach

### 5. Quality Assurance
- Tests the system
- Finds rough edges
- Proves patterns work

---

## Tips for Effective Dogfooding

### 1. Use It Regularly
- Don't just use it once
- Make it part of your workflow
- Every feature, bug, chore

### 2. Update Domain Knowledge
When you discover new patterns:
```bash
# Edit .claude/project/domain.md
# Add new entities, workflows, or terminology
# Commit changes
```

### 3. Iterate on Customization
- If plans are missing info, enhance domain.md
- If patterns aren't followed, update version.md
- System gets better as you use it

### 4. Share Your Experience
- What worked well?
- What was confusing?
- What could be better?
- Use insights to improve the product

---

## Meta Learning

**The interesting part:** As you use Claude Commands to develop Claude Commands, you'll learn:

1. **What users need** - You experience the system as a user
2. **What's unclear** - You find documentation gaps
3. **What's missing** - You discover needed features
4. **What works well** - You validate good decisions

This feedback loop makes Claude Commands better for everyone!

---

## Current Status

**Dogfooding is ready!** ✅

- ✅ Commands installed (.claude/commands/)
- ✅ Domain knowledge documented (.claude/project/domain.md)
- ✅ Version strategy defined (.claude/project/version.md)
- ✅ Usage guide provided (.claude/project/README.md)

**Try it now:**
```bash
/prime
/feature "your idea here"
```

---

## Next Steps

1. **Try it:** Run `/prime` right now
2. **Plan something:** Pick a feature, bug, or chore
3. **Evaluate:** Did the plan help? What could be better?
4. **Iterate:** Update domain.md or version.md if needed
5. **Share:** Your experience helps everyone

---

**Dogfooding = Better Product** 🐕🍖

Happy meta-development! 🎉
