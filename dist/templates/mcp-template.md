# MCP Configuration Template

**INSTRUCTIONS:** Copy this template to `.claude/project/mcp.md` and customize for your project's MCP setup.

---

## MCP Configuration

**Project:** [Your Project Name]

**Last Updated:** [YYYY-MM-DD]

---

## Available MCPs

### [MCP Name 1, e.g., XcodeBuildMCP, GradleMCP, etc.]

**Status:** [✅ Available / ❌ Not Available / ⚠️ Partially Available]

**Purpose:** [What this MCP does for your project]

**Version:** [Version requirement]

**Configuration:**

**Project Settings:**
- [Setting 1]: [Value]
- [Setting 2]: [Value]
- [Setting 3]: [Value]

**[Category 1] Commands:**

```bash
# [Command description]
[command example]

# [Command description]
[command example]
```

**[Category 2] Commands:**

```bash
# [Command description]
[command example]

# [Command description]
[command example]
```

**Usage in Commands:**
- [Command 1, e.g., "/implement"] - [How this MCP is used]
- [Command 2, e.g., "/feature"] - [How this MCP is used]
- [Validation 1] - [What gets validated]
- [Validation 2] - [What gets validated]

**Notes:**
- [Note 1 about usage]
- [Note 2 about performance]
- [Note 3 about limitations]

---

### [MCP Name 2, e.g., GitMCP]

**Status:** [Status]

**Purpose:** [Purpose]

**Configuration:**

**Repository:**
- Remote: [Remote URL]
- Main Branch: [Branch name]
- Development Branch: [Branch name]

**Branch Naming:**
- Features: [Pattern, e.g., "feature/feature-name"]
- Bugs: [Pattern, e.g., "bugfix/bug-description"]
- Chores: [Pattern, e.g., "chore/description"]

**Common Commands:**

```bash
# [Command description]
[command]

# [Command description]
[command]
```

**Usage in Commands:**
- [How used in command 1]
- [How used in command 2]

**Notes:**
- [Git-specific notes for your project]

---

### [MCP Name 3, e.g., FilesystemMCP]

**Status:** [Status]

**Purpose:** [Purpose]

**Configuration:**

**Project Structure:**

```
[ProjectRoot]/
├── [directory1]/              # [Description]
│   ├── [subdirectory]/        # [Description]
│   └── [file]                 # [Description]
├── [directory2]/              # [Description]
│   ├── [subdirectory]/        # [Description]
│   └── [file]                 # [Description]
└── [directory3]/              # [Description]
    └── [file]                 # [Description]
```

**Allowed Directories:**
- Source: [Path]
- Tests: [Path]
- Config: [Path]
- Docs: [Path]

**Common Operations:**

```bash
# [Operation description]
[command]

# [Operation description]
[command]
```

**Usage in Commands:**
- [Usage scenario 1]
- [Usage scenario 2]

**Notes:**
- [File system notes for your project]

---

## Project-Specific MCP Patterns

### [Workflow Name, e.g., Build-Test-Commit Workflow]

**Workflow for [Purpose]:**

1. **[Step 1]**
   - [Description]
   - [Command or action]

2. **[Step 2]**
   - [Description]
   - [Command or action]
   - Expected: [Expected result]
   - If [failure]: [How to handle]

3. **[Step 3]**
   - [Description]
   - [Commands]
   - Expected: [Expected results]

4. **[Step 4]**
   - [Description]
   - [Commands]
   - Expected: [Expected results]

5. **[Step 5]**
   - [Description]
   - [Final command]

**Success Criteria:**
- ✅ [Criterion 1]
- ✅ [Criterion 2]
- ✅ [Criterion 3]
- ✅ [Criterion 4]

---

### [Workflow Name 2, e.g., Pre-Commit Validation]

**Always run before committing:**

```bash
# 1. [Step name]
[command]
# Expected: [Result]

# 2. [Step name]
[command]
# Expected: [Result]

# 3. [Step name]
[command]
# Expected: [Result]

# 4. [Validation checks]
[commands]

# 5. If all green: commit
[commit command]
```

---

## MCP Error Handling

### [Error Category 1, e.g., Build Failures]

**Common Issues in [Your Project]:**

**Issue:** [Issue description]
- **Solution:** [How to fix]

**Issue:** [Issue description]
- **Solution:** [How to fix]

**Issue:** [Issue description]
- **Solution:** [How to fix]

**If [error type] fails:**
1. [Step 1]
2. [Step 2]
3. [Step 3]
4. Repeat up to [X] times
5. If still failing, report to user with error details

---

### [Error Category 2, e.g., Test Failures]

**Common [Error Type] Failures:**

**Issue:** [Test failure description]
- **Cause:** [Why it happens]
- **Solution:** [How to fix]

**Issue:** [Test failure description]
- **Cause:** [Why it happens]
- **Solution:** [How to fix]

**If [error type] fail:**
1. Identify which [items] failed
2. Read failure messages
3. Determine cause:
   - [Cause A] → [Action]
   - [Cause B] → [Action]
   - [Cause C] → [Action]
4. [Re-run step]
5. Report if unable to fix automatically

---

### [Error Category 3, e.g., Git Conflicts]

**If [error type] operations fail:**
1. [Check command]
2. Identify [issue]
3. If simple ([condition]): Resolve
4. If complex ([condition]): Ask user to resolve
5. Report status to user

---

## MCP Integration with Commands

### [Command Name 1, e.g., /implement] Command Flow

**Step-by-step MCP usage:**

1. **[MCP Name]:** [Action, e.g., "Read plan from file"]
2. **[MCP Name]:** [Action, e.g., "Read existing files"]
3. **[MCP Name]:** [Action, e.g., "Create/modify files"]
4. **[MCP Name]:** [Action, e.g., "Build project"]
   - If fails: [How to handle]
5. **[MCP Name]:** [Action, e.g., "Run tests"]
   - If fails: [How to handle]
6. **[MCP Name]:** [Action, e.g., "Check compliance"]
   - [Check 1]
   - [Check 2]
   - [Check 3]
7. **Report:** Results to user

---

### [Command Name 2, e.g., /feature] Command Flow

**Step-by-step MCP usage:**

1. **[MCP Name]:** [Action]
2. **[MCP Name]:** [Action]
3. **[MCP Name]:** [Action]
4. **[MCP Name]:** [Action]
5. **Report:** [What to report]

---

## MCP Availability Detection

**Auto-detect on [trigger, e.g., "/prime"]:**

```bash
# Check [MCP 1]
[detection command]
# Expected: [Expected output]

# Check [MCP 2]
[detection command]
# Expected: [Expected output]
```

**Report in [output location]:**

```
✅ [MCP 1] - [Version/status], [capabilities]
✅ [MCP 2] - [Version/status], [capabilities]
✅ [MCP 3] - [Version/status], [capabilities]
```

---

## Installation and Setup

### [MCP Name 1]

**Requirements:**
- [Requirement 1]
- [Requirement 2]

**Installation:**

```bash
# [Installation step 1]
[command]

# [Installation step 2]
[command]

# Verify
[verification command]
```

**Expected output:**

```
[Expected verification output]
```

---

### [MCP Name 2]

**Requirements:**
- [Requirement]

**Installation:**

```bash
# [Installation instructions]
[commands]
```

**Configuration:**

```bash
[configuration commands]
```

**Verify:**

```bash
[verification command]
```

**Expected:** [Expected result]

---

## Troubleshooting

### [MCP Name 1] Issues

**Issue:** [Issue description]
- **Solution:** [How to fix]

**Issue:** [Issue description]
- **Solution:** [How to fix]

**Issue:** [Issue description]
- **Solution:** [How to fix]

---

### [MCP Name 2] Issues

**Issue:** [Issue description]
- **Solution:** [How to fix]

**Issue:** [Issue description]
- **Solution:** [How to fix]

---

## Custom MCP Scripts

### Script 1: [Script Name]

**Purpose:** [What this script does]

**Location:** [Path to script]

**Usage:**

```bash
[script command]
```

**What it does:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Output:**
[What the script outputs]

---

### Script 2: [Script Name]

**Purpose:** [Purpose]

**Location:** [Path]

**Usage:**
```bash
[command]
```

**What it does:**
[Steps]

**Output:**
[Output]

---

## MCP Performance Optimization

### [MCP Name] Optimization

**Default Behavior:**
- [What happens by default]

**Optimization:**
```bash
# [Optimized command]
[command with flags/options]
```

**Performance Gain:**
- [Improvement description, e.g., "50% faster builds"]

---

### [MCP Name] Caching

**Cache Location:** [Path]

**Cache Invalidation:**
- [When cache is invalidated]

**Clear Cache:**
```bash
[cache clear command]
```

---

## CI/CD Integration

### [CI Platform, e.g., GitHub Actions]

**MCP Usage in CI:**

```yaml
# [CI configuration example]
[yaml config showing MCP usage]
```

**Environment Setup:**
- [How to set up MCPs in CI]

**Validation Steps:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

---

## MCP Security Considerations

### Credential Management

**[MCP Name] Credentials:**
- **Location:** [Where credentials are stored]
- **Access:** [How to securely access]
- **Never:** [What never to do]

**Best Practices:**
- [Practice 1]
- [Practice 2]
- [Practice 3]

---

### File Access Restrictions

**Allowed:**
- [Allowed directories/operations]

**Restricted:**
- [Restricted directories/operations]

**Why:** [Reason for restrictions]

---

## MCP Monitoring

### Health Checks

**Check [MCP 1] Status:**
```bash
[health check command]
```

**Check [MCP 2] Status:**
```bash
[health check command]
```

**Expected Results:**
- [What healthy status looks like]

---

### Performance Metrics

**Track:**
- [Metric 1, e.g., "Build time"]
- [Metric 2, e.g., "Test execution time"]
- [Metric 3, e.g., "Deploy time"]

**How to Measure:**
```bash
[measurement commands]
```

---

## Future MCP Plans

### Planned MCPs

**[MCP Name]:**
- **Purpose:** [What it will do]
- **Timeline:** [When to add]
- **Dependencies:** [What's needed]

**[MCP Name]:**
- **Purpose:** [Purpose]
- **Timeline:** [Timeline]
- **Dependencies:** [Dependencies]

---

### MCP Upgrades

**[MCP Name] Upgrade:**
- **Current:** [Current version]
- **Target:** [Target version]
- **Reason:** [Why upgrade]
- **Timeline:** [When]
- **Breaking Changes:** [Any breaking changes]

---

## Notes

- This MCP configuration is specific to [Project Name]
- [Key MCP 1] is critical for [functionality]
- [Key MCP 2] enables [feature]
- Update when project structure or tooling changes
- Run [refresh command] after updates to reload MCP configuration
- Document any custom scripts or workarounds
- Keep installation instructions up to date
