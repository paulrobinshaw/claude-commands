# Templates

Starting point templates for customizing Claude Commands for your project.

## Purpose

Templates provide **example knowledge files** with:
- Proper structure and formatting
- Header blocks explaining file purpose
- Placeholder content to guide customization
- Best practices and patterns

**Copy templates to `.claude/project/`** and customize with your project data.

## Available Templates

### `domain-template.md`

**Copy to:** `.claude/project/domain.md`
**Purpose:** Business domain knowledge template

**Contains:**
- Domain overview structure
- Core concepts section
- Business rules examples
- Calculation/formula patterns
- Terminology glossary structure
- Data relationships examples

**When to use:**
- Domain-heavy applications (finance, healthcare, specialized tools)
- Complex business rules need to be enforced
- Domain-specific calculations required
- Industry terminology needs to be understood

**How to use:**
```bash
cp .claude/templates/domain-template.md .claude/project/domain.md
# Edit domain.md: Replace placeholders with YOUR:
#   - Business rules
#   - Domain formulas
#   - Core concepts
#   - Terminology
```

**Context:** ~8,000 tokens when loaded (4%)

### `design-system-template.md`

**Copy to:** `.claude/project/design-system.md`
**Purpose:** Design system tokens template

**Contains:**
- Color palette structure (primary, secondary, semantic)
- Typography scale (fonts, sizes, weights)
- Spacing scale (padding, margins)
- Component patterns
- Accessibility guidelines
- Dark mode considerations

**When to use:**
- Want consistent UI across features
- Have brand colors and typography
- Use design tokens instead of hardcoded values
- Building a component library

**How to use:**
```bash
cp .claude/templates/design-system-template.md .claude/project/design-system.md
# Edit design-system.md: Replace placeholders with YOUR:
#   - Brand colors
#   - Typography scale
#   - Spacing values
#   - Component patterns
```

**Context:** ~2,000 tokens when loaded (1%)

### `version-template.md`

**Copy to:** `.claude/project/version.md`
**Purpose:** Version requirements template

**Contains:**
- Platform version requirements
- Language version
- Key dependencies
- Deployment targets
- Technology constraints

**When to use:**
- Recommended for all projects
- Ensures correct API usage for platform version
- Documents minimum requirements

**How to use:**
```bash
cp .claude/templates/version-template.md .claude/project/version.md
# Edit version.md: Update with YOUR:
#   - iOS/platform version
#   - Swift/language version
#   - Key frameworks
#   - Deployment targets
```

**Context:** ~500 tokens (0.25%)

### `mcp-template.md`

**Copy to:** `.claude/project/mcp.md`
**Purpose:** MCP server configuration template

**Contains:**
- Build server configuration
- Test runner setup
- Filesystem access patterns
- Available tool capabilities

**When to use:**
- Using MCP (Model Context Protocol) tools
- Want automated builds during development
- Need test execution capabilities
- Want filesystem operations

**How to use:**
```bash
cp .claude/templates/mcp-template.md .claude/project/mcp.md
# Edit mcp.md: Configure YOUR:
#   - Build commands
#   - Test commands
#   - File operations
#   - Tool setup
```

**Context:** ~500 tokens (0.25%)

### `project-README-template.md`

**Copy to:** `.claude/project/README.md`
**Purpose:** Project directory documentation

**Contains:**
- Explanation of project directory purpose
- Quick start guide
- File descriptions
- Usage instructions

**When to use:**
- Want documentation in your project directory
- Team onboarding
- Future reference

**How to use:**
```bash
cp .claude/templates/project-README-template.md .claude/project/README.md
# Can customize or use as-is
```

## Quick Start Workflow

**Step 1:** Choose what you need

```bash
# Minimal setup (recommended)
cp .claude/templates/version-template.md .claude/project/version.md

# UI-focused project
cp .claude/templates/design-system-template.md .claude/project/design-system.md

# Domain-heavy project
cp .claude/templates/domain-template.md .claude/project/domain.md

# Using MCP tools
cp .claude/templates/mcp-template.md .claude/project/mcp.md
```

**Step 2:** Customize templates

```bash
# Edit each file in .claude/project/
# Replace placeholders with your actual data
```

**Step 3:** Verify

```bash
/prime                    # Should load your version info
/domain                   # If created domain.md
/design-system            # If created design-system.md
```

## Template Structure

All templates follow this structure:

```markdown
# [Name] Template

**File Type:** Project-Specific Knowledge (Template)
**Loaded by:** `.claude/loaders/[name].md` command
**Usage:** Copy to `.claude/project/[name].md` and customize
**Auto-loaded:** [When it auto-loads]

---

**INSTRUCTIONS:** [How to use this template]

---

## [Sections with example content and placeholders]
```

## Customization Guidelines

### What to Replace

Templates use placeholders like:
- `[Your Project Name]` - Replace with actual project name
- `[e.g., Finance, Healthcare]` - Replace with your domain
- `#[HEX]` - Replace with actual color values
- `[Description]` - Replace with actual descriptions

**Find all placeholders:**
```bash
# Search for brackets in your copied file
grep '\[' .claude/project/domain.md
```

### What to Keep

Keep the structure:
- File headers (explaining file purpose)
- Section organization
- Formatting patterns
- Best practice notes

### What to Remove

Remove after customization:
- `**INSTRUCTIONS:**` blocks (they're for setup only)
- Placeholder content in brackets `[like this]`
- Example content you don't need

## Common Patterns

### Colors (Design System)

**Template provides:**
```markdown
**Primary:**
- **Token:** `DS.Colors.primary`
- **Value:** `#[HEX]`
- **Usage:** [Description]
```

**You customize to:**
```markdown
**Primary:**
- **Token:** `DS.Colors.primary`
- **Value:** `#007AFF` (SwiftUI .blue)
- **Usage:** Main brand color, primary buttons, links
```

### Business Rules (Domain)

**Template provides:**
```markdown
**Rule:** [Rule name]
- **Description:** [What this rule enforces]
- **Formula:** [If applicable]
- **Validation:** [How to validate]
```

**You customize to:**
```markdown
**Rule:** Hydration Calculation
- **Description:** Calculate dough hydration percentage
- **Formula:** hydration = (water weight / flour weight) × 100
- **Validation:** Must be between 50-100%
```

## Template Headers Explained

Each template starts with a header block:

```markdown
**File Type:** Project-Specific Knowledge (Template)
```
Indicates this is data (not command logic)

```markdown
**Loaded by:** `.claude/loaders/domain.md` command
```
Shows which loader command reads this file

```markdown
**Usage:** Copy to `.claude/project/domain.md` and customize
```
Instructions for where to put the file

```markdown
**Auto-loaded:** When feature planners detect domain keywords
```
Explains when this knowledge auto-loads

**Keep these headers** after copying - they help future you understand the file.

## Loader/Knowledge Pattern

Templates follow the **loader/knowledge separation pattern**:

| Template | Becomes | Loaded by |
|----------|---------|-----------|
| `domain-template.md` | `project/domain.md` | `loaders/domain.md` |
| `design-system-template.md` | `project/design-system.md` | `loaders/design-system.md` |
| `version-template.md` | `project/version.md` | (loaded by /prime) |
| `mcp-template.md` | `project/mcp.md` | (loaded by /prime) |

**Key insight:**
- Template = Starting point
- Project file = Your customized version
- Loader = Command that reads your file

See: [../docs/architecture.md](../.claude/docs/architecture.md) for full pattern explanation.

## Context Budget

Templates help you stay within context budget:

| Template | Typical Size | Percentage | When Loaded |
|----------|-------------|------------|-------------|
| domain | ~8,000 tokens | 4% | On-demand/auto |
| design-system | ~2,000 tokens | 1% | On-demand/auto |
| version | ~500 tokens | 0.25% | Always (/prime) |
| mcp | ~500 tokens | 0.25% | Always (/prime) |

**Total (all files):** ~11,000 tokens (5.5%)
**Remaining for work:** ~189,000 tokens (94.5%)

**Strategy:**
- Only create files you need
- Templates show recommended size
- Stay within suggested token budgets

## Sharing Templates

Templates can be shared:

**Project to project:**
```bash
# Use your customized file as a template for another project
cp ~/project1/.claude/project/domain.md ~/project2/.claude/project/domain.md
```

**Team sharing:**
```bash
# Commit your templates to version control
git add .claude/project/
git commit -m "Add customized knowledge templates"
```

**Template library:**
```bash
# Create reusable templates
~/my-templates/
  ├── fintech-domain-template.md
  ├── brand-design-system-template.md
  └── ios-version-template.md
```

## Updating Templates

**When claude-commands updates:**
- Templates may have improved versions
- Your customized files in project/ are NOT affected
- Compare new template features with your files
- Optionally adopt new sections

**Process:**
```bash
# Compare new template with your file
diff .claude/templates/domain-template.md .claude/project/domain.md

# Manually add new sections you like
# Keep your existing customizations
```

## Troubleshooting

### "Template not found"

**Problem:** Template file doesn't exist

**Check:**
```bash
ls .claude/templates/
```

**Solution:** Ensure claude-commands is properly installed

### "Which template do I need?"

**Decision tree:**
1. **Version** - Yes (recommended for all projects)
2. **Design System** - If doing UI work with design tokens
3. **Domain** - If domain-heavy app with business rules
4. **MCP** - If using MCP tools for build/test

**Start minimal, add as needed.**

### "Template has placeholders"

**That's normal!** Templates are meant to be customized:

1. Copy template to project/
2. Edit file
3. Replace all `[placeholders]` with your data
4. Remove instruction blocks

### "File exists in project/"

**Problem:** File already exists at destination

**Options:**
```bash
# Option 1: Backup existing, then copy template
mv .claude/project/domain.md .claude/project/domain.md.backup
cp .claude/templates/domain-template.md .claude/project/domain.md

# Option 2: Compare and merge manually
diff .claude/templates/domain-template.md .claude/project/domain.md
```

## Examples

### Example: Setting Up SwiftUI Project

```bash
# Step 1: Install claude-commands
cp -r /path/to/claude-commands/dist/* .claude/

# Step 2: Copy essential templates
cp .claude/templates/version-template.md .claude/project/version.md
cp .claude/templates/design-system-template.md .claude/project/design-system.md

# Step 3: Customize
# Edit .claude/project/version.md:
#   - iOS 18+
#   - Swift 6
#   - SwiftUI

# Edit .claude/project/design-system.md:
#   - Brand colors
#   - Typography scale
#   - Spacing tokens

# Step 4: Use
/prime
/feature "add user profile screen"
# Design system auto-loads, provides tokens
```

### Example: Setting Up Domain-Heavy App

```bash
# Step 1: Install claude-commands
# Step 2: Copy templates
cp .claude/templates/domain-template.md .claude/project/domain.md
cp .claude/templates/version-template.md .claude/project/version.md

# Step 3: Customize
# Edit .claude/project/domain.md:
#   - Business rules (e.g., baking formulas)
#   - Calculations
#   - Terminology

# Step 4: Use
/prime
/feature "calculate hydration percentage"
# Domain auto-loads, provides formulas
```

## Related Documentation

- **Architecture:** [../docs/architecture.md](../.claude/docs/architecture.md) - Pattern explanation
- **Loaders:** [../loaders/README.md](../.claude/loaders/README.md) - Loader commands
- **Project:** [../project/README.md](../.claude/project/README.md) - Knowledge files
- **Main README:** [../README.md](../.claude/README.md) - Installation guide

## Questions?

**Q: Do I need all templates?**
A: No - only copy what you need

**Q: Can I modify templates?**
A: After copying to project/, yes - they're yours

**Q: What if I skip all templates?**
A: Commands still work - templates are optional

**Q: Can I create custom templates?**
A: Yes - follow the existing pattern (see architecture.md)

**Q: Templates are too detailed**
A: Feel free to simplify after copying - they're starting points
