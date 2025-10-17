# Feature: Implement Command

## Feature Description

Add `/implement` command that reads spec files (created by `/feature`, `/bug`, `/chore`) and executes the implementation steps, following architecture patterns and handling technology-specific implementations.

**User Story:**
As a developer using Claude Commands, I want to run `/implement specs/feature-dark-mode.md` so that Claude reads my feature plan and implements it step-by-step, following the architecture patterns automatically.

**Acceptance Criteria:**
- [ ] `/implement <spec-file>` reads the spec file
- [ ] Command follows implementation steps in order
- [ ] Architecture patterns are enforced during implementation
- [ ] Works with all spec types (feature, bug, chore)
- [ ] Handles technology-specific implementations (SwiftUI, React, Python)
- [ ] Creates/modifies files as specified in plan
- [ ] Runs tests if specified in plan

## Architecture Impact

**Layers Affected:**
- [x] Command Layer (new core command)
- [x] Router Layer (new router for technology detection)
- [x] Technology Layer (technology-specific implementation handlers)

**New Components:**
- Commands: `/implement` (core entry point)
- Routers: `routers/implement.md` (technology router)
- Technology Handlers: `swiftui/implement.md`, `react/implement.md` (future), `python/implement.md` (future)

**Modified Components:**
- `scripts/build-dist.sh` - Add implement command to distribution
- `README.md` - Document `/implement` command
- `docs/getting-started.md` - Add to workflow examples

## Design System Integration

N/A - This is a command system feature, not a UI feature.

## Domain Knowledge Application

**Domain:** Claude Commands system (from `.claude/project/domain.md`)

**Business Rules Applied:**
- Commands must verify architecture is loaded
- Routers must detect technology and route appropriately
- Technology handlers generate/modify files following architecture patterns
- All commands follow the same structure (core → router → technology)

**Domain Workflows:**
- Command Routing Path (see domain.md line 162-192)
- Implementation workflow: read spec → parse steps → execute in order → verify

## Implementation Plan

### Phase 1: Core Command

#### 1.1 Create core/implement.md

**Purpose:** Universal entry point for implementing from spec files

**File:** `core/implement.md`

**Structure:**
```markdown
# Implement - Universal Implementation Executor

Execute implementation from a spec file.

## What This Does

1. Verifies project is primed (architecture loaded)
2. Reads the spec file
3. Detects project type
4. Routes to technology-specific implementation handler
5. Executes implementation steps

## Instructions

1. Verify architecture loaded
2. Validate spec file exists and is readable
3. Route to `.claude/routers/implement.md`
```

**Tasks:**
- [ ] Create core/implement.md
- [ ] Add architecture verification
- [ ] Add spec file validation
- [ ] Add routing to routers/implement.md
- [ ] Add error handling for missing/invalid specs
- [ ] Follow same pattern as core/feature.md, core/bug.md

**Architecture Notes:**
- ✅ Core commands are technology-agnostic
- ✅ Verify prerequisites before routing
- ✅ Pass spec file path to router
- ✅ Clear error messages

### Phase 2: Router

#### 2.1 Create routers/implement.md

**Purpose:** Detect technology and route to appropriate implementation handler

**File:** `routers/implement.md`

**Structure:**
```markdown
# Implementation Router

Routes to technology-specific implementation handler.

## What This Does

1. Checks architecture is loaded
2. Detects project type (SwiftUI, React, Python)
3. Routes to technology-specific handler
4. Passes spec file path

## Instructions

1. Verify architecture loaded
2. Detect technology (same as routers/feature.md)
3. Route to `.claude/swiftui/implement.md` (or react/python)
4. Pass spec file path as argument
```

**Tasks:**
- [ ] Create routers/implement.md
- [ ] Add technology detection logic
- [ ] Add routing for SwiftUI
- [ ] Add routing for React (placeholder)
- [ ] Add routing for Python (placeholder)
- [ ] Follow same pattern as routers/feature.md

**Architecture Notes:**
- ✅ Zero context usage (just routing)
- ✅ Fast detection
- ✅ Clear routing messages
- ✅ Handle unknown technology gracefully

### Phase 3: SwiftUI Implementation Handler

#### 3.1 Create swiftui/implement.md

**Purpose:** Execute SwiftUI implementation from spec file

**File:** `swiftui/implement.md`

**Structure:**
```markdown
# SwiftUI Implementation Handler

Executes implementation plan for SwiftUI projects.

## What This Does

1. Reads spec file
2. Parses implementation steps
3. Loads required context (design system, domain if needed)
4. Executes each step in order:
   - Creates new files
   - Modifies existing files
   - Follows architecture patterns
   - Uses design system tokens
5. Runs tests if specified
6. Reports completion

## Instructions

### Step 1: Read Spec File
- Read the spec file passed as argument
- Parse structure (Feature/Bug/Chore sections)
- Extract implementation steps

### Step 2: Context Loading
- Check if design system is needed (UI-related implementation)
- Check if domain is needed (business logic implementation)
- Auto-load as necessary

### Step 3: Execute Implementation
- Process each step in "Implementation Plan" section
- For each file to create: Use Write tool
- For each file to modify: Use Read, then Edit tool
- Follow architecture patterns from .claude/swiftui/architecture.md
- Use design system tokens where applicable

### Step 4: Verification
- Run tests if "Testing" section present
- Verify files were created/modified
- Report any errors or warnings

### Step 5: Summary
- List files created
- List files modified
- Report test results (if tests run)
- Suggest next steps
```

**Tasks:**
- [ ] Create swiftui/implement.md
- [ ] Add spec file reading logic
- [ ] Add step parsing logic
- [ ] Add file creation logic (use Write tool)
- [ ] Add file modification logic (use Read + Edit tools)
- [ ] Add architecture pattern enforcement
- [ ] Add design system token usage
- [ ] Add test execution (if MCP configured)
- [ ] Add progress reporting
- [ ] Add error handling

**Architecture Notes:**
- ✅ Follow SwiftUI architecture patterns
- ✅ NO ViewModels (@Observable services only)
- ✅ Use design system tokens (no hardcoded values)
- ✅ Keep views < 150 lines
- ✅ Business logic in services, not views

### Phase 4: Testing

#### 4.1 Test with Existing Spec

**Test Case 1: Implement from feature spec**

Use existing bug fix spec to test:
```bash
/implement specs/bug-installation-symlink-pollution.md
```

Expected:
- Reads spec file
- Routes to appropriate handler
- Executes Phase 1 (build script creation)
- Creates `scripts/build-dist.sh`
- Reports completion

**Test Case 2: Implement from new feature spec**

Create simple test spec:
```bash
# Create test spec
cat > specs/test-simple-view.md << 'EOF'
# Feature: Simple Test View

## Implementation Plan

### Phase 1: Create View

#### 1.1 Create SimpleTestView.swift

File: `SimpleTestView.swift`

Content:
\```swift
import SwiftUI

struct SimpleTestView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
\```
EOF

# Test implementation
/implement specs/test-simple-view.md
```

Expected:
- Creates `SimpleTestView.swift`
- File contains correct SwiftUI code
- Reports success

**Test Case 3: Error handling**

Test with non-existent spec:
```bash
/implement specs/does-not-exist.md
```

Expected:
- Clear error message
- Suggests running /feature, /bug, or /chore first

#### 4.2 Integration Testing

Test full workflow:
```bash
# 1. Plan a feature
/feature "add simple counter view"

# 2. Implement it
/implement specs/feature-simple-counter-view.md

# 3. Verify files created
ls -la SimpleCounterView.swift
```

Expected:
- Feature plan created
- Implementation executes
- Files created match plan
- Architecture patterns followed

### Phase 5: Documentation

#### 5.1 Update README.md

Add `/implement` to Commands section:

```markdown
### `/implement` - Execute Implementation

**What it does:**
- Reads a spec file (feature, bug, or chore plan)
- Executes implementation steps in order
- Creates/modifies files following architecture patterns
- Runs tests if specified

**Usage:**
\```bash
/implement specs/feature-user-authentication.md
/implement specs/bug-login-crash.md
/implement specs/chore-refactor-services.md
\```

**Output:** Creates/modifies files as specified in the plan

**Speed:** Varies by complexity (typically 1-5 minutes)
```

**Tasks:**
- [ ] Add to Commands section
- [ ] Add usage examples
- [ ] Add to workflow section
- [ ] Add troubleshooting tips

#### 5.2 Update docs/getting-started.md

Add to workflow examples:

```markdown
## Typical Workflow

1. **Prime your project** (once per session):
   \```
   /prime
   \```

2. **Plan a feature**:
   \```
   /feature "add dark mode toggle"
   \```

3. **Review the plan**:
   \```
   Open specs/feature-dark-mode-toggle.md
   Edit if needed
   \```

4. **Implement the feature**:
   \```
   /implement specs/feature-dark-mode-toggle.md
   \```

5. **Test and iterate**:
   - Build and run
   - Fix any issues with /bug
   - Refine with /chore
```

**Tasks:**
- [ ] Update workflow section
- [ ] Add /implement examples
- [ ] Add tips for editing specs before implementing
- [ ] Add troubleshooting section

#### 5.3 Add to CHANGELOG.md

```markdown
## [1.0.1] - 2025-XX-XX

### Added
- **`/implement` command** - Execute implementations from spec files
  - Reads feature/bug/chore specs
  - Executes steps in order
  - Follows architecture patterns
  - Works with SwiftUI (React/Python coming in v2.0)
```

**Tasks:**
- [ ] Add to CHANGELOG.md
- [ ] Update version number
- [ ] Add to roadmap completion

### Phase 6: Distribution

#### 6.1 Update scripts/build-dist.sh

Add implement command to distribution:

```bash
# In build-dist.sh, add:
cp core/implement.md dist/commands/implement
```

**Tasks:**
- [ ] Update build script
- [ ] Test build process
- [ ] Verify dist/ contains implement command
- [ ] Test installation with new command

#### 6.2 Test Installation

```bash
# Build distribution
./scripts/build-dist.sh

# Check dist includes implement
ls -la dist/commands/
# Should show: prime, feature, bug, chore, implement

# Test installation
mkdir -p /tmp/test-project
./scripts/install.sh /tmp/test-project

# Verify
ls -la /tmp/test-project/.claude/commands/
# Should include implement
```

**Tasks:**
- [ ] Build dist
- [ ] Verify implement included
- [ ] Test fresh installation
- [ ] Test command execution

## Testing Strategy

### Unit Tests

**Test 1: Spec file validation**
- Valid spec file → Proceeds
- Missing spec file → Clear error
- Invalid spec file → Clear error
- Wrong format → Clear error

**Test 2: Technology routing**
- SwiftUI project → Routes to swiftui/implement.md
- React project → Routes to react/implement.md (future)
- Unknown project → Clear error

**Test 3: Step execution**
- Create file step → File created
- Modify file step → File modified correctly
- Multiple steps → Executed in order
- Error in step → Stops, reports error

### Integration Tests

**Test 1: Full workflow**
```bash
/prime
/feature "test feature"
/implement specs/feature-test-feature.md
# Verify files created match plan
```

**Test 2: Complex feature**
```bash
/feature "add user authentication with login screen and auth service"
/implement specs/feature-user-authentication.md
# Verify:
# - Service created with @Observable
# - View created with proper structure
# - Design system tokens used
# - No hardcoded values
```

**Test 3: Bug fix**
```bash
/bug "login crashes with nil email"
/implement specs/bug-login-crash.md
# Verify:
# - Fix applied correctly
# - Tests pass
# - No regressions
```

### Acceptance Tests

- [ ] Can implement simple feature (single file)
- [ ] Can implement complex feature (multiple files)
- [ ] Can implement bug fix
- [ ] Can implement chore/refactor
- [ ] Architecture patterns enforced
- [ ] Design system tokens used
- [ ] No hardcoded values introduced
- [ ] Tests run successfully (if specified)
- [ ] Clear progress reporting
- [ ] Clear error messages

## Files to Create

```
core/implement.md                 # Core command entry point
routers/implement.md              # Technology router
swiftui/implement.md              # SwiftUI implementation handler
```

## Files to Modify

```
scripts/build-dist.sh             # Add implement to distribution
README.md                         # Document /implement command
docs/getting-started.md           # Add to workflow
CHANGELOG.md                      # Add to v1.0.1 changes
```

## Success Criteria

- ✅ `/implement specs/file.md` reads and executes the spec
- ✅ All implementation steps executed in order
- ✅ Files created/modified as specified
- ✅ Architecture patterns enforced
- ✅ Design system tokens used (no hardcoded values)
- ✅ Works with feature, bug, and chore specs
- ✅ Clear progress reporting
- ✅ Clear error messages
- ✅ Documentation complete
- ✅ Tests passing

## Notes

This command completes the core workflow loop:

```
/prime → /feature → /implement
         /bug → /implement
         /chore → /implement
```

**Key Design Decisions:**

1. **Spec file as input** - Allows users to review and edit plans before implementation
2. **Step-by-step execution** - Follows the plan's implementation steps in order
3. **Architecture enforcement** - Patterns built into the implementation logic
4. **Context loading** - Auto-loads design system/domain as needed (same as /feature)
5. **Technology routing** - Same pattern as other commands (core → router → technology)

**Future Enhancements:**

- Interactive mode: Confirm each step before executing
- Dry-run mode: Show what would be done without doing it
- Partial implementation: Resume from specific step
- Rollback: Undo implementation if tests fail
- AI review: Suggest improvements before executing

---

**Priority:** High (blocks v1.0 release, referenced in README)
**Effort:** ~4-5 hours (3 command files + testing + docs)
**Dependencies:** Requires architecture to be loaded (/prime must run first)
