# Domain Knowledge: Claude Commands Project

Documentation of domain knowledge for the Claude Commands project itself.

---

## Domain Overview

**Purpose:** Claude Commands is a command routing and context loading system for Claude Code that enables architecture-consistent, AI-assisted development.

**Key Concepts:**
1. **Lazy Loading:** Load minimal context, only what's needed
2. **Smart Routing:** Universal entry points that route to technology-specific handlers
3. **Context Management:** Keep token usage under 5% of 200K window
4. **Architecture Enforcement:** Patterns built into commands

**Target Users:**
- Developers using Claude Code
- Teams wanting consistent AI-generated code
- Projects needing architecture patterns enforced

---

## Domain Entities

### Entity 1: Command

**Description:** A Markdown file containing instructions for Claude Code to execute.

**Properties:**
- `name` (String): Command name (prime, feature, bug, chore)
- `type` (String): "core", "router", "technology-specific", or "loader"
- `path` (String): File path (e.g., commands/core/prime.md)
- `arguments` (String): User-provided description

**Relationships:**
- Core commands route to routers
- Routers route to technology-specific handlers
- Technology handlers may invoke loaders

**Business Rules:**
1. Core commands must verify architecture is loaded
2. Routers must detect technology and route appropriately
3. Technology handlers generate plans in specs/ directory
4. All commands follow the same structure

**Example:**
```
Command: /feature "add dark mode"
Type: core
Path: commands/core/feature.md
Routes to: commands/routers/feature.md
Then to: commands/swiftui/feature.md
Output: specs/feature-dark-mode.md
```

---

### Entity 2: Context

**Description:** Project-specific information loaded into Claude's context window.

**Properties:**
- `type` (String): "architecture", "design-system", "domain", "version", "mcp"
- `size_tokens` (Integer): Approximate token count
- `load_strategy` (String): "always", "lazy-ui", "lazy-domain"
- `path` (String): File location

**Business Rules:**
1. Architecture always loaded (~3K tokens)
2. Design system lazy-loaded for UI features (~2K tokens)
3. Domain lazy-loaded for business logic features (~5K tokens)
4. Version/MCP always loaded (~1K tokens total)
5. Total context should be < 5% of 200K window (~10K max)

**Example:**
```
Context: Design System
Type: design-system
Size: 2000 tokens
Strategy: lazy-ui
Path: .claude/project/design-system.md
Loaded when: UI keywords detected (screen, view, button, etc.)
```

---

### Entity 3: Technology

**Description:** Supported development platform/framework.

**Properties:**
- `name` (String): Technology name (SwiftUI, React, Python)
- `status` (String): "supported", "planned", "experimental"
- `version` (String): Version support (e.g., "iOS 17+")
- `commands_path` (String): Directory (e.g., commands/swiftui/)

**Relationships:**
- One technology has many commands
- One technology has one architecture file
- One technology may have many component templates

**Business Rules:**
1. Each technology must have primer (prime.md)
2. Each technology must have architecture (architecture.md)
3. Each technology should have feature planner (feature.md)
4. Technology-specific commands inherit from core patterns

**Example:**
```
Technology: SwiftUI
Status: supported (v1.0)
Version: iOS 17+
Commands: 7 files (prime, architecture, feature, component, service, model, tests)
```

---

## Domain Calculations

### Calculation 1: Context Token Budget

**Purpose:** Calculate if loading context would exceed budget.

**Formula:**
```
current_tokens = architecture + version + mcp
if (UI feature) current_tokens += design_system
if (domain feature) current_tokens += domain
percentage = (current_tokens / 200000) × 100
```

**Inputs:**
- `feature_type` - "UI", "domain", "both", or "neither"
- `current_context` - Already loaded tokens

**Output:**
- `total_tokens` - Total context after loading
- `percentage` - Percentage of 200K window
- `within_budget` - Boolean (< 5% budget)

**Example:**

Input: UI feature, current 4500 tokens
Calculation:
- Architecture: 3000 tokens (loaded)
- Version/MCP: 1000 tokens (loaded)
- Design system: 2000 tokens (to load)
- Domain: 0 tokens (not needed)
Total: 3000 + 1000 + 2000 = 6000 tokens
Percentage: (6000 / 200000) × 100 = 3%
Within budget: Yes (< 5%)

**Edge Cases:**
- If both UI + domain: ~11.5K tokens (5.75%)
- If neither: ~4.5K tokens (2.25%)
- Never exceed 6% in practice

---

### Calculation 2: Command Routing Path

**Purpose:** Determine the path a command takes through the system.

**Formula:**
```
path = [core_command]
if (needs_routing):
    path.append(router)
path.append(technology_handler)
if (needs_context):
    path.append(loaders)
```

**Inputs:**
- `command_name` - Command invoked (prime, feature, bug, chore)
- `technology` - Detected technology (SwiftUI, React, Python)
- `feature_type` - UI, domain, both, or neither

**Output:**
- `execution_path` - Ordered list of files executed

**Example:**

Input: /feature "add dark mode", technology=SwiftUI, feature_type=UI
Path:
1. commands/core/feature.md (entry point)
2. commands/routers/feature.md (detect and route)
3. commands/swiftui/feature.md (SwiftUI handler)
4. commands/loaders/design-system.md (load DS)
5. Generate: specs/feature-dark-mode.md

---

## Domain Language

### Key Terms

**Lazy Loading**
- **Definition:** Loading context only when needed, not upfront
- **Context:** Core principle of Claude Commands
- **Example:** "Design system is lazy-loaded for UI features"

**Smart Routing**
- **Definition:** Technology detection and automatic routing to appropriate handler
- **Context:** How core commands delegate to technology-specific handlers
- **Example:** "/feature routes to swiftui/feature.md for SwiftUI projects"

**Context Window**
- **Definition:** Claude's 200K token limit for input
- **Context:** Budget constraint for context loading
- **Example:** "Keep context under 5% of 200K window (10K tokens)"

**Architecture Enforcement**
- **Definition:** Patterns built into commands that ensure consistency
- **Context:** How commands generate architecture-compliant code
- **Example:** "SwiftUI commands enforce @Observable pattern"

**Technology-Agnostic**
- **Definition:** Core commands that work for any supported technology
- **Context:** Design principle for core/router layer
- **Example:** "/prime works for SwiftUI, React, Python"

**Dogfooding**
- **Definition:** Using Claude Commands to develop Claude Commands itself
- **Context:** Meta-usage for testing and improvement
- **Example:** "Run /feature to add new commands to Claude Commands"

**Token Budget**
- **Definition:** Maximum tokens allocated for context loading
- **Context:** Performance constraint
- **Example:** "Token budget is 10K tokens (5% of 200K)"

---

### Acronyms

**DS** - Design System
- **Meaning:** Design system customization
- **Usage:** "DS tokens", "DS.Colors.primary"

**MCP** - Model Context Protocol
- **Meaning:** Build/test/git automation configuration
- **Usage:** "MCP configuration", "XcodeBuildMCP"

**UI** - User Interface
- **Meaning:** Visual/interaction layer
- **Usage:** "UI feature", "UI keywords"

---

## Domain Workflows

### Workflow 1: Adding a New Command

**Purpose:** Add a new command to Claude Commands

**Steps:**

1. **Create Core Command**
   - Input: Command name (e.g., "refactor")
   - Action: Create commands/core/refactor.md
   - Output: Universal entry point
   - Example: Similar to feature.md or bug.md

2. **Create Router**
   - Input: Core command
   - Action: Create commands/routers/refactor.md
   - Output: Technology routing logic
   - Example: Detect tech, route to handlers

3. **Create Technology Handlers**
   - Input: Router
   - Action: Create commands/swiftui/refactor.md (and others)
   - Output: Technology-specific logic
   - Example: SwiftUI-specific refactoring patterns

4. **Create Symlink**
   - Input: Core command
   - Action: ln -s ../../commands/core/refactor.md .claude/commands/refactor
   - Output: Command available to users
   - Example: /refactor now works

5. **Test**
   - Input: New command
   - Action: Run /refactor "test task"
   - Output: Verify routing and plan generation
   - Example: Check specs/refactor-*.md created

6. **Document**
   - Input: Tested command
   - Action: Update README, CHANGELOG, docs
   - Output: Users can discover and use
   - Example: Add to command list in README

**Success Criteria:**
- Command executes without errors
- Routes to correct technology handler
- Generates plan in specs/ directory
- Documentation updated

---

### Workflow 2: Adding a New Technology

**Purpose:** Add support for a new technology (e.g., React)

**Steps:**

1. **Create Technology Directory**
   - Action: mkdir commands/react
   - Output: commands/react/

2. **Create Primer**
   - Action: Create commands/react/prime.md
   - Output: React-specific context loading

3. **Create Architecture**
   - Action: Create commands/react/architecture.md
   - Output: React patterns documented

4. **Create Feature Planner**
   - Action: Create commands/react/feature.md
   - Output: React-specific feature planning

5. **Update Core Prime**
   - Action: Add React detection to commands/core/prime.md
   - Output: Auto-detects React projects

6. **Update Routers**
   - Action: Add React routing to all routers
   - Output: Commands route to React handlers

7. **Test**
   - Action: Test in React project
   - Output: Verify detection and routing

8. **Document**
   - Action: Update README, add examples
   - Output: Users know React is supported

**Success Criteria:**
- React projects detected
- All commands route correctly
- Architecture patterns enforced
- Documentation complete

---

## Data Validation Rules

### Validation 1: Command File Structure

**Field:** Command markdown file

**Rules:**
- Must have title (# Command Name)
- Must have "What This Does" section
- Must have "Instructions" section
- Must have step-by-step instructions

**Error Messages:**
- Missing title → "Command file must start with # title"
- Missing sections → "Required sections missing"

---

### Validation 2: Context Token Budget

**Field:** Context loading

**Rules:**
- Architecture always loaded (3K)
- Design system optional (2K)
- Domain optional (5K)
- Total must be < 12K tokens (6% max)

**Error Messages:**
- Over budget → "Context loading would exceed 6% budget"

---

## Domain Constraints

### Constraint 1: Lazy Loading Requirement

**Constraint:** Context must be loaded lazily, not upfront

**Applies To:** All context loaders

**Rationale:** Keep prime fast, minimize token usage

**Enforcement:** Prime loads only architecture/version/MCP

---

### Constraint 2: Technology Agnostic Core

**Constraint:** Core commands cannot contain technology-specific logic

**Applies To:** commands/core/*, commands/routers/*

**Rationale:** Enable easy addition of new technologies

**Enforcement:** Code review, no tech-specific patterns in core

---

## Notes

- This domain knowledge documents Claude Commands itself
- Use this when adding features to Claude Commands
- Update when adding new commands or technologies
- Run /prime to load this context when developing Claude Commands
