# Customization Guide

Learn how to customize Claude Commands for your project.

---

## Overview

Claude Commands is designed to be **fully customizable** while providing sensible defaults. This guide walks you through customizing the system for your specific project needs.

---

## Quick Start

**Step 1:** Copy templates to your project:
```bash
mkdir -p .claude/project
cp path/to/claude-commands/templates/design-system-template.md .claude/project/design-system.md
cp path/to/claude-commands/templates/domain-template.md .claude/project/domain.md
cp path/to/claude-commands/templates/version-template.md .claude/project/version.md  
cp path/to/claude-commands/templates/mcp-template.md .claude/project/mcp.md
```

**Step 2:** Customize each file for your project (see sections below)

**Step 3:** Run `/prime` to verify setup

---

## Design System Customization

### Purpose

Define your visual design language:
- Color palette  
- Typography scale
- Spacing system
- Component styles

### When It's Used

Auto-loads when planning UI features (keywords: screen, view, button, card, etc.)

### Template Location

`templates/design-system-template.md`

### How to Customize

1. **Define Your Colors:**
   - Primary/secondary brand colors
   - Semantic colors (success, error, warning, info)
   - Neutral colors (background, surface, text)
   - Custom domain colors (optional)

2. **Set Typography:**
   - Font family
   - Text styles (title, headline, body, caption)
   - Font sizes and weights
   - Line heights

3. **Document Spacing:**
   - Spacing scale (xs, sm, md, lg, xl, etc.)
   - Usage guidelines
   - Examples

4. **Add Implementation:**
   - Code snippets for your platform (SwiftUI, React, etc.)
   - Token definitions
   - Usage examples

### Example

See `examples/baking-app/design-system.md` for a complete example with:
- Metric colors (flour, water, salt, yeast)
- Professional baking UI components
- SwiftUI implementation

---

## Domain Knowledge Customization

### Purpose

Document your business domain:
- Entities and relationships
- Calculations and formulas
- Workflows and processes  
- Validation rules

### When It's Used

Auto-loads when planning domain features (your custom keywords + calculation, formula, etc.)

### Template Location

`templates/domain-template.md`

### How to Customize

1. **Define Entities:**
   - Core business objects (User, Order, Recipe, etc.)
   - Properties and types
   - Relationships
   - Validation rules

2. **Document Calculations:**
   - Business logic formulas
   - Inputs and outputs
   - Examples with real numbers
   - Edge cases

3. **Describe Workflows:**
   - Step-by-step processes
   - Success criteria
   - Error handling

4. **Add Terminology:**
   - Domain-specific terms
   - Acronyms and abbreviations
   - Definitions and context

### Example

See `examples/baking-app/domain.md` for:
- Baker's percentage system
- Hydration calculations
- Recipe scaling workflows
- Baking terminology

---

## Version Strategy Customization

### Purpose

Define platform versions and patterns:
- Minimum supported version
- Target version  
- Patterns to use (✅)
- Patterns to avoid (❌)

### When It's Used

Always loaded (small file, ~500 tokens)

### Template Location

`templates/version-template.md`

### How to Customize

1. **Set Versions:**
   - Minimum version (for device coverage)
   - Target version (for latest features)
   - Rationale for each

2. **List Modern Patterns:**
   - Patterns to use (with examples)
   - Why to use them
   - Code samples

3. **List Deprecated Patterns:**
   - Patterns to avoid (with examples)
   - What they're replaced by
   - Migration guidance

4. **Document Strategy:**
   - When to upgrade minimum version
   - Adoption criteria
   - Migration process

### Example

See `examples/baking-app/version.md` for:
- iOS 17+ minimum (for @Observable)
- Modern SwiftUI patterns
- Deprecated pattern migration

---

## MCP Configuration Customization

### Purpose

Configure build/test/git automation:
- Build commands
- Test commands
- Pre-commit validation
- CI/CD integration

### When It's Used

Always loaded (small file, ~500 tokens)

### Template Location

`templates/mcp-template.md`

### How to Customize

1. **Add Build Commands:**
   - Platform-specific build (Xcode, Gradle, npm, etc.)
   - Clean commands
   - Configuration options

2. **Add Test Commands:**
   - Unit test execution
   - Integration test execution  
   - Coverage generation

3. **Define Validation:**
   - Pre-commit checks
   - Architecture compliance
   - Code quality checks

4. **Document Workflows:**
   - Build-test-commit flow
   - CI/CD integration
   - Error handling

### Example

See `examples/baking-app/mcp.md` for:
- XcodeBuildMCP configuration
- Architecture validation (no ViewModels)
- Design system token enforcement

---

## Complete Example: Baking App

Location: `examples/baking-app/`

**Context:** Professional baking app for iOS

**Customizations:**
1. **Design System:** Metric colors for baker's percentages
2. **Domain:** Baker's percentages, formulas, calculations
3. **Version:** iOS 17+ with @Observable pattern
4. **MCP:** Xcode build/test with architecture checks

**Study this example** to understand how all pieces fit together!

---

## Best Practices

### 1. Start Small

Don't customize everything at once:
1. Start with just architecture (no customization)
2. Add design system when you have UI consistency needs
3. Add domain when you have complex business logic
4. Add version/MCP as needed

### 2. Keep It Updated

Update customization when:
- Design system changes
- New business logic added
- Platform version updated
- Build process changes

### 3. Use Real Examples

In customization files:
- Use real values from your project
- Include actual code examples
- Reference actual components/services
- Show real workflows

### 4. Be Specific

Avoid:
- Generic placeholders
- "TBD" sections
- Incomplete examples

Include:
- Concrete values
- Real code snippets
- Actual workflows
- Specific guidelines

---

## Testing Your Customization

### Step 1: Prime

```
/prime
```

**Expected output:**
```
✅ Project primed successfully

Technology: SwiftUI  
Architecture: Loaded (~3K tokens)
Design System: Available ✅
Domain Knowledge: Available ✅  
Version Strategy: Loaded (~500 tokens)
MCP Config: Loaded (~500 tokens)
```

### Step 2: Plan a UI Feature

```
/feature "add dark mode toggle"
```

**Verify:**
- Design system auto-loaded
- Plan uses design system tokens
- No hardcoded colors/fonts

### Step 3: Plan a Domain Feature

```
/feature "add recipe scaling"
```

**Verify:**
- Domain knowledge auto-loaded
- Plan uses domain entities
- Calculations use domain formulas

---

## Common Issues

### Design System Not Loading

**Problem:** Feature planner doesn't load design system

**Solutions:**
1. Check file exists: `.claude/project/design-system.md`
2. Verify UI keywords in feature description (screen, view, button, etc.)
3. Run `/prime` to verify "Design System: Available ✅"

### Domain Knowledge Not Loading

**Problem:** Feature planner doesn't load domain knowledge

**Solutions:**
1. Check file exists: `.claude/project/domain.md`
2. Add domain keywords to feature description
3. Define custom keywords in domain.md
4. Run `/prime` to verify "Domain Knowledge: Available ✅"

### Commands Not Found

**Problem:** `/prime` or `/feature` not recognized

**Solutions:**
1. Check `.claude/commands/` exists
2. Verify symlinks: `ls -la .claude/commands/`
3. Ensure claude-commands is installed
4. Re-run installation steps

---

## Advanced Customization

### Custom Keywords

Add project-specific keywords to trigger domain loading.

In `.claude/project/domain.md`, add:
```markdown
## Keywords

**Domain Keywords (trigger auto-loading):**
- recipe, formula, baker's percentage
- hydration, preferment, scaling
- ingredient, dough, fermentation
```

### Custom Commands

Create project-specific commands.

**Example:** Add `/scale` command for recipe scaling:

1. Create: `.claude/commands/scale.md`
2. Document: Recipe scaling workflow
3. Test: `/scale "double the recipe"`

---

## Support

- **Templates:** See `templates/`
- **Examples:** See `examples/baking-app/`
- **Issues:** https://github.com/yourusername/claude-commands/issues
- **Discussions:** https://github.com/yourusername/claude-commands/discussions

---

**Happy customizing!** 🎨
