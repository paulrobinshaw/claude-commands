# Professional Baking App - Example Customization

This directory contains a complete example of how to customize the Claude Commands repository for a **Professional Baking Application** built with SwiftUI.

## What This Example Shows

This example demonstrates how to take the base Claude Commands templates and customize them for a specific domain (professional baking) with unique requirements:

- **Domain-specific design system** with metric colors for baker's percentages
- **Complex domain knowledge** including formulas, calculations, and workflows
- **Modern iOS version strategy** requiring iOS 17+ for @Observable
- **Specialized MCP configuration** for automated Xcode builds and architecture validation

## Project Context

**Project:** Professional Baking App
**Technology:** iOS (SwiftUI)
**Target Users:** Professional bakers, bakery managers, culinary students
**Core Feature:** Baker's percentage calculations and recipe scaling

## Files in This Example

### 1. `design-system.md`

**Purpose:** Defines the visual design language for the baking app.

**Key Customizations:**
- **Metric Colors:** Special color palette for visualizing baker's percentages (flour, water, salt, yeast, etc.)
- **Baking-specific UI:** Card designs for recipes, chip components for metrics
- **Professional aesthetic:** Clean, professional design for commercial kitchen use

**Highlights:**
- Uses SwiftUI design tokens (DS.Colors.*, DS.Typography.*, etc.)
- Enforces token usage (no hardcoded colors/fonts/spacing)
- Supports light and dark modes for all colors
- Includes metric-specific colors (flourOrange, waterBlue, etc.)

### 2. `domain.md`

**Purpose:** Captures all domain knowledge about professional baking and baker's percentages.

**Key Customizations:**
- **Baker's Percentage System:** Core concept where all ingredients are expressed as percentages of flour weight (flour = 100%)
- **Domain Calculations:** Formulas for hydration, scaling, preferment calculations
- **Baking Terminology:** Poolish, biga, levain, autolyse, bulk fermentation, etc.
- **Domain Workflows:** Creating formulas, scaling recipes, managing preferments
- **Validation Rules:** Flour must equal 100%, hydration ranges, salt limits

**Highlights:**
- 5 core calculations with formulas, examples, and edge cases
- 15+ domain-specific terms with definitions and context
- Step-by-step workflows for common baking tasks
- Validation rules for preventing baking errors

### 3. `version.md`

**Purpose:** Defines the iOS version strategy and modern SwiftUI patterns.

**Key Customizations:**
- **Minimum Version:** iOS 17+ (required for @Observable)
- **Architecture Pattern:** NO ViewModels approach using @Observable services
- **Modern SwiftUI:** #Preview macro, NavigationStack, SwiftData, .task modifier
- **Deprecated Patterns:** ObservableObject, PreviewProvider, NavigationView, .onAppear with Task

**Highlights:**
- Explains why iOS 17+ is required (@Observable is critical)
- Lists all patterns to use (✅) and avoid (❌)
- Migration strategy for upgrading to iOS 18+
- Device support, performance targets, testing matrix

### 4. `mcp.md`

**Purpose:** Configures MCPs (Model Context Protocols) for automated operations.

**Key Customizations:**
- **XcodeBuildMCP:** Automated building and testing
- **GitMCP:** Pre-commit validation (no ViewModels, DS tokens used)
- **FilesystemMCP:** Project structure navigation
- **Build-Test-Commit Workflow:** Automated validation before commits

**Highlights:**
- Architecture compliance checks (grep for ViewModels, hardcoded colors)
- Automated build/test before commits
- Project structure with Services/, Models/, Views/, Components/, DesignSystem/
- Pre-commit validation checklist

### 5. `version.md` (Extended)

**Additional Context:**
- Explains version-specific SwiftUI patterns
- Migration from ObservableObject to @Observable
- When to use @available checks (iOS 18+ features only)
- Testing strategy across iOS versions

## How This Example Was Created

### Step 1: Started with Templates

Copied the base templates:
```bash
cp templates/design-system-template.md examples/baking-app/design-system.md
cp templates/domain-template.md examples/baking-app/domain.md
cp templates/version-template.md examples/baking-app/version.md
cp templates/mcp-template.md examples/baking-app/mcp.md
```

### Step 2: Analyzed Domain Requirements

**Domain Analysis:**
- Identified core domain: Baker's percentages
- Key calculation: All ingredients as % of flour weight
- Critical rule: Flour = 100% always
- Complex workflows: Formula creation, recipe scaling
- Technical terms: Poolish, hydration, preferment, etc.

### Step 3: Customized Design System

**Design Decisions:**
- Added metric colors (flourOrange, waterBlue, saltPink, yeastGreen) for visualizing percentages
- Kept standard semantic colors (success, error, warning, info)
- Used iOS system fonts for professional appearance
- Enforced design token usage (no hardcoded values)

**Color Palette:**
```swift
// Metric colors (domain-specific)
static let flourOrange = Color(hex: "#E67E22")
static let waterBlue = Color(hex: "#3498DB")
static let saltPink = Color(hex: "#E91E63")
static let yeastGreen = Color(hex: "#27AE60")

// Standard semantic colors
static let success = Color(hex: "#27AE60")
static let error = Color(hex: "#E74C3C")
// ... etc
```

### Step 4: Documented Domain Knowledge

**Domain Documentation:**
- Defined 5 core calculations with formulas
- Documented 15+ domain terms with examples
- Created 2 step-by-step workflows
- Added 4 validation rules with error messages

**Example Calculation:**
```
Calculation: Hydration Percentage

Formula:
hydration_percentage = (water_weight / flour_weight) × 100

Example:
Flour: 1000g
Water: 700g
Hydration: (700 / 1000) × 100 = 70%

Output: "This bread has 70% hydration"
```

### Step 5: Defined Version Strategy

**Version Decisions:**
- Minimum: iOS 17+ (required for @Observable)
- Target: iOS 18+ (latest features)
- Pattern: NO ViewModels (use @Observable services)
- Deprecated: ObservableObject, PreviewProvider, NavigationView

**Architecture:**
```
@Observable services (not ObservableObject ViewModels)
#Preview (not PreviewProvider)
NavigationStack (not NavigationView)
.task (not .onAppear with Task)
```

### Step 6: Configured MCPs

**MCP Setup:**
- XcodeBuildMCP for automated builds/tests
- GitMCP for pre-commit checks
- FilesystemMCP for project navigation
- Build-Test-Commit workflow

**Pre-commit Validation:**
```bash
# No ViewModels
git diff main | grep -i "viewmodel"  # Expected: Nothing

# Design system tokens used
git diff main | grep -E "Color\(red:"  # Expected: Nothing

# @Observable (not ObservableObject)
git diff main | grep "ObservableObject"  # Expected: Nothing
```

## Using This Example for Your Project

### If You're Building a Similar App (iOS SwiftUI)

1. **Copy the files:**
   ```bash
   mkdir -p .claude/project
   cp examples/baking-app/*.md .claude/project/
   ```

2. **Customize for your domain:**
   - Update `domain.md` with your business logic
   - Keep the @Observable pattern (it's great!)
   - Adjust `design-system.md` colors for your brand
   - Keep `version.md` strategy if targeting iOS 17+

3. **Run `/prime`** to load your configuration

### If You're Building a Different Type of App

1. **Use as inspiration:**
   - See how domain knowledge is structured
   - See how design system tokens are enforced
   - See how version strategy guides implementation
   - See how MCPs automate validation

2. **Start from templates:**
   ```bash
   mkdir -p .claude/project
   cp templates/*.md .claude/project/
   ```

3. **Customize thoroughly:**
   - Replace all [placeholders]
   - Add your domain concepts
   - Define your design system
   - Configure your MCPs
   - Document your version strategy

4. **Run `/prime`** to validate

## Key Takeaways from This Example

### 1. Domain-Driven Design

The domain knowledge (baker's percentages) drives everything:
- **Design system:** Metric colors for visualizing percentages
- **Validation:** Flour must equal 100%
- **Calculations:** All formulas documented
- **Terminology:** Baking terms explained

### 2. Architecture Enforcement

The version strategy enforces modern patterns:
- **Required:** iOS 17+ for @Observable
- **Pattern:** NO ViewModels (services instead)
- **Validation:** Pre-commit checks for compliance

### 3. Design System Rigor

The design system prevents inconsistency:
- **Tokens required:** No hardcoded values
- **Pre-commit checks:** Grep for violations
- **Dark mode:** All colors support both modes

### 4. Automation with MCPs

MCPs automate quality:
- **Build:** Automated before commits
- **Test:** Automated before commits
- **Validation:** Check architecture compliance

## Real-World Application

This example is based on a real professional baking app concept where:

- **Bakers** need to scale recipes from 1kg to 50kg flour
- **Formulas** must be precise (baker's percentages)
- **Hydration** varies by bread type (60% for bagels, 80% for ciabatta)
- **Preferments** add flavor (poolish, biga, levain)
- **Mobile** is critical (bakers work in kitchens, not offices)

The customization ensures:
- ✅ Calculations are always correct (domain.md formulas)
- ✅ UI is consistent (design-system.md tokens)
- ✅ Code uses modern patterns (version.md strategy)
- ✅ Quality is automated (mcp.md validation)

## Next Steps

1. **Study this example** to understand the customization approach
2. **Try `/prime`** to see how Claude Code loads this configuration
3. **Try `/feature recipe-scaling`** to see how domain knowledge guides planning
4. **Copy and adapt** for your own project
5. **Run `/prime`** after customizing to validate your setup

## Questions?

This example demonstrates the full power of Claude Commands customization. Use it as a reference when creating your own `.claude/project/` files!

---

**Remember:** The templates are just starting points. This example shows how to turn them into a comprehensive, domain-specific development guide.
