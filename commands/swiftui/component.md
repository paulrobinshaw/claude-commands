# SwiftUI Component Planning

Creates plans for reusable UI components with design system integration.

**Philosophy:** Small, focused, reusable, design-system-compliant components.

---

## What This Does

1. **Checks prerequisites** (architecture loaded)
2. **Auto-loads design system** (always needed for components)
3. **Generates component plan** following design system
4. **Outputs to** `specs/component-*.md`

---

## Instructions

You are creating a plan for a reusable SwiftUI component. Components should be small, focused, and use design system tokens exclusively.

---

## Pre-Flight: Context Check & Auto-Loading

### Check Architecture

If NOT in context: `.claude/commands/swiftui/architecture.md`

❌ Architecture not loaded

Please run /prime first to load SwiftUI architecture.

**Stop and ask user to run `/prime`.**

### Auto-Load Design System

Components ALWAYS need design system.

**Check if design system is in context.**

**If NOT loaded:**

📚 Auto-loading design system for component planning...

Read: `.claude/project/design-system.md`

✅ Design system loaded

**If file doesn't exist:**

⚠️ No design system found

Components should use design system tokens.
Will plan with generic guidance.

### Domain Knowledge

Components should be domain-agnostic.

ℹ️ Components should not contain domain logic

**Do NOT load domain knowledge for components.**

---

## Step 1: Analyze Component Requirements

Determine:
- What does this component display?
- Is it truly reusable?
- Is it domain-agnostic?
- Where will it be used?

---

## Step 2: Generate Component Plan

Create plan in `specs/component-[name].md`

### Plan Template

# Component: [ComponentName]

## Component Description

**Purpose:** [What this component displays]

**Usage:** [Where it will be used]

**Reusability:** High/Medium/Low

## Design System Integration

**Colors Used:**
- `Color.[token]` - [usage]

**Typography Used:**
- `Font.[token]` - [usage]

**Spacing Used:**
- `.padding(.space[n])` - [usage]

## Component API

struct [ComponentName]: View {
    // Required props
    let prop1: Type

    // Optional props
    var prop2: Type = default

    var body: some View {
        // Implementation
    }
}

## Implementation Plan

### Step 1: Create Component File

File: `Components/[ComponentName].swift`

**Tasks:**
- [ ] Create component file
- [ ] Define props
- [ ] Implement layout using DS tokens
- [ ] Keep < 100 lines
- [ ] Add accessibility

### Step 2: Add Preview

#Preview {
    [ComponentName](prop1: value1)
}

**Tasks:**
- [ ] Add preview with variants
- [ ] Test dark mode
- [ ] Test different sizes

### Step 3: Validation

**Checklist:**
- [ ] Uses design system tokens exclusively
- [ ] No hardcoded colors/fonts/spacing
- [ ] < 100 lines
- [ ] Accessible
- [ ] Works in light/dark mode
- [ ] Preview looks good

## Notes

[Any additional context]

---

## Arguments

$ARGUMENTS - Component name and description

**Usage:**

/component "RecipeCard to display recipe summary with image, title, and metadata"
/component "MetricChip for displaying recipe metrics"

---

**This generates focused, reusable component plans.**
