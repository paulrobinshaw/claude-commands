# SwiftUI Implementation Handler

Executes implementation plan from a spec file for SwiftUI projects.

**Philosophy:** Read spec, parse steps, execute systematically, enforce architecture.

---

## What This Does

1. **Reads spec file** (feature, bug, or chore plan)
2. **Parses implementation steps** from the plan
3. **Auto-loads context** (design system, domain if needed)
4. **Executes each step in order**:
   - Creates new files
   - Modifies existing files
   - Follows architecture patterns
   - Uses design system tokens
5. **Reports progress and completion**

---

## Instructions

You are executing a SwiftUI implementation from a spec file. Follow the plan systematically.

---

## Pre-Flight: Context Check & Auto-Loading

### Check Architecture

If NOT in context: `.claude/swiftui/architecture.md`
```
❌ Architecture not loaded

Please run /prime first to load SwiftUI architecture.
```

**Stop and ask user to run `/prime`.**

### Parse Spec File Argument

Extract the spec file path from arguments:
```
$ARGUMENTS - Should be a spec file path
```

Example: `specs/feature-dark-mode.md`

---

## Step 1: Read and Parse Spec File

### Read the spec file

Use the Read tool to read the entire spec file.

```
📄 Reading spec: [file-path]
```

### Parse the spec structure

Extract these sections:
- **Feature/Bug/Chore Description** - What we're implementing
- **Implementation Plan** - The steps to execute
- **Files to Create** - List of new files
- **Files to Modify** - List of existing files to update
- **Testing Strategy** - Tests to run (if any)

**Display summary:**
```
✅ Spec loaded: [Feature/Bug/Chore Name]

Implementation scope:
- Files to create: [count]
- Files to modify: [count]
- Implementation steps: [count]

Starting implementation...
```

---

## Step 2: Auto-Load Context

### Detect context needs

Analyze the spec to determine what context to load:

**Check for UI keywords:**
- view, screen, component, button, color, layout, UI
- If found AND design system not loaded → Load it

**Check for domain keywords:**
- recipe, calculation, formula, business logic, domain entities
- If found AND domain not loaded → Load it

### Auto-Load Design System

**If UI keywords found AND design system not in context:**
```
📚 Auto-loading design system for UI implementation...
```

Read: `.claude/project/design-system.md`
```
✅ Design system loaded (~2,000 tokens)
```

**If file doesn't exist:**
```
⚠️ No design system found

Will flag hardcoded values during implementation.
Consider creating: .claude/project/design-system.md
```

### Auto-Load Domain Knowledge

**If domain keywords found AND domain not in context:**
```
📚 Auto-loading domain knowledge for domain implementation...
```

Read: `.claude/project/domain.md`
```
✅ Domain knowledge loaded (~8,000 tokens)
```

**If file doesn't exist:**
```
⚠️ Domain keywords detected but no domain knowledge file

Implementation will proceed generically.
Add domain knowledge: .claude/project/domain.md
```

---

## Step 3: Execute Implementation Steps

Process the "Implementation Plan" section step by step.

### For Each Step in the Plan

#### Step Format

Steps are typically formatted as:

```markdown
## Phase 1: Services

### 1.1 Create AuthService

File: `BakingApp/Services/AuthService.swift`

**Code:**
\```swift
import SwiftUI

@Observable
class AuthService {
    // Implementation
}
\```

**Tasks:**
- [ ] Create service with @Observable
- [ ] Implement login method
- [ ] Add error handling
```

#### Execution Logic

**For "Create" steps:**

1. **Identify the file path** - Extract from spec (e.g., `BakingApp/Services/AuthService.swift`)

2. **Extract the code** - Get code block from spec

3. **Apply architecture patterns:**
   - ✅ Ensure @Observable is used (not ObservableObject)
   - ✅ Check for design system tokens (no hardcoded colors/fonts)
   - ✅ Verify structure follows patterns
   - ⚠️ Warn if anti-patterns detected

4. **Create the file** - Use Write tool

5. **Report:**
   ```
   ✅ Created: BakingApp/Services/AuthService.swift
   ```

**For "Modify" steps:**

1. **Identify the file path** - Extract from spec

2. **Read existing file** - Use Read tool

3. **Determine changes** - Based on spec instructions

4. **Apply changes** - Use Edit tool with exact string replacement

5. **Verify patterns:**
   - ✅ Still follows architecture
   - ✅ Uses design system tokens
   - ⚠️ Warn if introducing anti-patterns

6. **Report:**
   ```
   ✅ Modified: BakingApp/Views/SettingsView.swift
   ```

#### Architecture Enforcement

**During execution, enforce these patterns:**

**Services:**
- ✅ Use `@Observable` (not `ObservableObject` or `@StateObject`)
- ✅ Pure business logic (no UI concerns)
- ✅ Async/await for async operations
- ❌ NO direct SwiftUI imports in services (except @Observable)

**Views:**
- ✅ Presentation only (no business logic)
- ✅ Use `@Environment` for services
- ✅ Use `@State` for local UI state
- ✅ Keep < 150 lines (warn if longer)
- ✅ Use design system tokens for colors/fonts

**Models:**
- ✅ Use `@Model` for SwiftData
- ✅ Plain structs for value types
- ✅ Codable where appropriate

**If violations detected:**
```
⚠️ Architecture Warning

File: AuthService.swift
Issue: Using ObservableObject instead of @Observable

Recommendation: Update to @Observable for iOS 17+ pattern

Proceeding with implementation, but please review.
```

#### Design System Enforcement

**Check for hardcoded values:**

❌ **Anti-patterns to detect:**
- `Color.blue`, `Color.red`, `Color(hex: "...")`
- `.font(.system(size: 16))`
- Direct RGB values: `Color(red: 0.2, green: 0.3, blue: 0.5)`
- Hardcoded spacing: `.padding(16)`

✅ **Correct patterns:**
- `DS.Colors.primary`, `DS.Colors.secondary`
- `DS.Fonts.title`, `DS.Fonts.body`
- `DS.Spacing.medium`, `DS.Spacing.large`

**If hardcoded values detected:**
```
⚠️ Design System Warning

File: SettingsView.swift
Line: .foregroundColor(.blue)
Issue: Hardcoded color value

Recommendation: Use DS.Colors.[semantic-name]

Proceeding, but please use design system tokens.
```

---

## Step 4: Progress Reporting

Report progress as steps are executed:

```
⚙️ Implementation Progress

Phase 1: Services
  ✅ 1.1 Create AuthService
  ✅ 1.2 Implement service logic

Phase 2: Models
  ✅ 2.1 Create User model

Phase 3: Views
  ⚙️ 3.1 Create LoginView (in progress)
  ⏳ 3.2 Create RegistrationView (pending)

Files created: 3
Files modified: 1
```

---

## Step 5: Testing (Optional)

If the spec includes a "Testing" section:

### Check for MCP Configuration

Look for `.claude/project/mcp.md` - if it exists, tests can be run automatically.

**If MCP configured:**
```
🧪 Running tests...

Reading MCP configuration...
Executing: [test command from MCP]
```

Run the test command specified in MCP config.

**Report results:**
```
✅ Tests passed: 15/15
```

or

```
❌ Tests failed: 2/15

Failed tests:
- AuthServiceTests.testLoginWithInvalidEmail
- AuthServiceTests.testLoginWithNilPassword

Please review and fix failing tests.
```

**If MCP not configured:**
```
ℹ️ Testing section present in spec

MCP not configured for automatic testing.

Manual testing recommended:
- [List manual test steps from spec]

To enable automatic testing:
1. Create .claude/project/mcp.md
2. Configure test commands
3. See: templates/mcp-template.md
```

---

## Step 6: Final Summary

After all steps executed (or stopped on error):

### Success Summary

```
✅ Implementation complete

📁 Files created (3):
- BakingApp/Services/AuthService.swift
- BakingApp/Models/User.swift
- BakingApp/Views/LoginView.swift

📝 Files modified (2):
- BakingApp/BakingAppApp.swift
- BakingApp/Views/ContentView.swift

⚠️ Warnings (1):
- LoginView.swift: Hardcoded color on line 42
  → Recommendation: Use DS.Colors.primary

🧪 Tests: All passing ✓ (if run)

📋 Next steps:
1. Build and run the application
2. Test the new functionality
3. Review warnings and apply recommendations
4. Commit changes to version control

Spec implemented: specs/feature-user-authentication.md
```

### Error Summary

If implementation stopped due to error:

```
❌ Implementation stopped

✅ Completed steps (2):
- 1.1 Create AuthService
- 1.2 Create User model

❌ Failed step:
- 2.1 Create LoginView

Error: File already exists: BakingApp/Views/LoginView.swift

📁 Files created before error (2):
- BakingApp/Services/AuthService.swift
- BakingApp/Models/User.swift

💡 Resolution options:
1. Delete existing LoginView.swift and rerun
2. Modify spec to update instead of create
3. Continue manually from step 2.1

To resume: /implement specs/feature-user-authentication.md
(After fixing the issue)
```

---

## Error Handling

### Spec File Read Error

```
❌ Cannot read spec file: [path]

Please check:
1. File exists in specs/ directory
2. File is readable
3. Path is correct

Available specs:
[List files in specs/]
```

### Invalid Spec Format

```
❌ Invalid spec format

The spec file is missing required sections:
- Implementation Plan

Please regenerate the spec with /feature, /bug, or /chore.
```

### File Creation Error

```
❌ Cannot create file: [path]

Error: [error message]

Possible causes:
1. File already exists (use modify instead)
2. Parent directory doesn't exist
3. Permission denied

Implementation stopped at this step.
```

### File Modification Error

```
❌ Cannot modify file: [path]

Error: [error message]

Possible causes:
1. File doesn't exist
2. Cannot find text to replace
3. Permission denied

Implementation stopped at this step.
```

---

## Notes

- **Systematic execution** - Follows the spec step by step
- **Architecture enforcement** - Validates patterns during execution
- **Design system enforcement** - Checks for hardcoded values
- **Context-aware** - Auto-loads design system/domain as needed
- **Error handling** - Stops on errors, reports clearly
- **Progress reporting** - Shows what's happening
- **Safe** - Won't overwrite without warning

---

**This is the SwiftUI implementation executor - the engine that turns specs into code.**
