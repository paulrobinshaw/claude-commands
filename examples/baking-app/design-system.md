# Design System: Professional Baking App

This design system is specific to the professional baking application example.

---

## Design System

**Project:** Professional Baking App (Example)

**Technology:** iOS

**Last Updated:** 2024-10-17

---

## Color Palette

### Primary Colors

**Primary:**
- **Token:** `DS.Colors.primary`
- **Value:** `#2C3E50` (Dark blue-gray)
- **Usage:** Main brand color, primary buttons, headers
- **Accessibility:** WCAG AAA compliant on white (#FFFFFF)
- **Example:** "Scale Recipe" button, navigation bar, active states

### Secondary Colors

**Secondary:**
- **Token:** `DS.Colors.secondary`
- **Value:** `#34495E` (Medium gray-blue)
- **Usage:** Secondary actions, supporting UI elements
- **Example:** Secondary buttons, inactive tabs

### Metric Colors (Domain-Specific)

**Flour (Orange):**
- **Token:** `DS.Colors.flourOrange`
- **Value:** `#E67E22` (Warm orange)
- **Usage:** Flour-related metrics, 100% baseline indicator
- **Example:** Flour percentage chip, formula baseline

**Water (Blue):**
- **Token:** `DS.Colors.waterBlue`
- **Value:** `#3498DB` (Bright blue)
- **Usage:** Hydration metrics, water percentage
- **Example:** Hydration percentage chip, water indicator

**Salt (Pink):**
- **Token:** `DS.Colors.saltPink`
- **Value:** `#E91E63` (Vibrant pink)
- **Usage:** Salt percentage, seasoning metrics
- **Example:** Salt percentage chip

**Yeast (Green):**
- **Token:** `DS.Colors.yeastGreen`
- **Value:** `#27AE60` (Fresh green)
- **Usage:** Yeast percentage, leavening indicators
- **Example:** Yeast percentage chip

**Preferment (Purple):**
- **Token:** `DS.Colors.prefermentPurple`
- **Value:** `#9B59B6` (Rich purple)
- **Usage:** Preferment indicators (poolish, biga, levain)
- **Example:** Preferment percentage chip

### Semantic Colors

**Success:**
- **Token:** `DS.Colors.success`
- **Value:** `#27AE60` (Green, matches yeast for positive growth)
- **Usage:** Success messages, completed actions
- **Example:** "Recipe saved successfully", formula validated

**Warning:**
- **Token:** `DS.Colors.warning`
- **Value:** `#F39C12` (Amber)
- **Usage:** Warnings, caution states
- **Example:** "High hydration (>80%)", "Low salt (<1.8%)"

**Error:**
- **Token:** `DS.Colors.error`
- **Value:** `#E74C3C` (Red)
- **Usage:** Errors, failed validations
- **Example:** "Flour must equal 100%", "Invalid percentage"

**Info:**
- **Token:** `DS.Colors.info`
- **Value:** `#3498DB` (Blue, matches water for flow of information)
- **Usage:** Informational messages, tips
- **Example:** "Tip: Try 70% hydration for artisan bread"

### Neutral Colors

**Background:**
- **Token:** `DS.Colors.background`
- **Light Mode:** `#F5F5F5` (Light gray)
- **Dark Mode:** `#121212` (Near black)
- **Usage:** Main app background

**Surface:**
- **Token:** `DS.Colors.surface`
- **Light Mode:** `#FFFFFF` (White)
- **Dark Mode:** `#1C1C1E` (Dark gray)
- **Usage:** Cards, recipe cards, formula sheets

**Text Primary:**
- **Token:** `DS.Colors.textPrimary`
- **Light Mode:** `#212121` (Near black)
- **Dark Mode:** `#FFFFFF` (White)
- **Usage:** Main text, headings, recipe names
- **Accessibility:** WCAG AAA on background

**Text Secondary:**
- **Token:** `DS.Colors.textSecondary`
- **Light Mode:** `#757575` (Medium gray)
- **Dark Mode:** `#B0B0B0` (Light gray)
- **Usage:** Supporting text, metadata, timestamps
- **Accessibility:** WCAG AA on background

**Divider:**
- **Token:** `DS.Colors.divider`
- **Light Mode:** `#E0E0E0` (Light gray)
- **Dark Mode:** `#333333` (Dark gray)
- **Usage:** Section dividers, card borders

---

## Typography

### Font Family

**Primary Font:**
- **Token:** `DS.Typography.fontFamily`
- **Value:** `.system` (SF Pro on iOS)
- **Usage:** All text
- **Rationale:** SF Pro is optimized for iOS, excellent readability

### Text Styles

**Large Title:**
- **Token:** `DS.Typography.largeTitle`
- **Font Size:** 34pt
- **Weight:** Bold
- **Line Height:** 41pt
- **Usage:** Main screen titles
- **Example:** "My Recipes", "Formulas"

**Title 1:**
- **Token:** `DS.Typography.title1`
- **Font Size:** 28pt
- **Weight:** Bold
- **Line Height:** 34pt
- **Usage:** Section headers
- **Example:** "Bread Formulas", "Recent Activity"

**Title 2:**
- **Token:** `DS.Typography.title2`
- **Font Size:** 22pt
- **Weight:** Bold
- **Line Height:** 28pt
- **Usage:** Card titles, recipe names
- **Example:** "Artisan Sourdough" in recipe card

**Title 3:**
- **Token:** `DS.Typography.title3`
- **Font Size:** 20pt
- **Weight:** Semibold
- **Line Height:** 25pt
- **Usage:** Subsection headers
- **Example:** "Ingredients", "Method"

**Headline:**
- **Token:** `DS.Typography.headline`
- **Font Size:** 17pt
- **Weight:** Semibold
- **Line Height:** 22pt
- **Usage:** Emphasized text, metric labels
- **Example:** "Hydration: 70%", button labels

**Body:**
- **Token:** `DS.Typography.body`
- **Font Size:** 17pt
- **Weight:** Regular
- **Line Height:** 22pt
- **Usage:** Main body text, descriptions
- **Example:** Recipe descriptions, instructions

**Callout:**
- **Token:** `DS.Typography.callout`
- **Font Size:** 16pt
- **Weight:** Regular
- **Line Height:** 21pt
- **Usage:** Secondary content
- **Example:** Formula notes, tips

**Subheadline:**
- **Token:** `DS.Typography.subheadline`
- **Font Size:** 15pt
- **Weight:** Regular
- **Line Height:** 20pt
- **Usage:** Labels, metadata
- **Example:** "Last modified", "Prep time"

**Footnote:**
- **Token:** `DS.Typography.footnote`
- **Font Size:** 13pt
- **Weight:** Regular
- **Line Height:** 18pt
- **Usage:** Captions, timestamps
- **Example:** "Modified 2 hours ago"

**Caption 1:**
- **Token:** `DS.Typography.caption1`
- **Font Size:** 12pt
- **Weight:** Regular
- **Line Height:** 16pt
- **Usage:** Small supporting text
- **Example:** Helper text, formula details

**Caption 2:**
- **Token:** `DS.Typography.caption2`
- **Font Size:** 11pt
- **Weight:** Regular
- **Line Height:** 13pt
- **Usage:** Very small text
- **Example:** Legal text, fine print

---

## Spacing

**Token System:** `DS.Spacing.[size]`

| Token | Value (pt) | Usage | Example |
|-------|------------|-------|---------|
| `DS.Spacing.xxs` | 2 | Minimal spacing | Icon padding |
| `DS.Spacing.xs` | 4 | Very tight spacing | Metric chip padding |
| `DS.Spacing.sm` | 8 | Tight spacing | Card internal padding |
| `DS.Spacing.md` | 12 | Standard spacing | Between metrics |
| `DS.Spacing.lg` | 16 | Comfortable spacing | Card padding |
| `DS.Spacing.xl` | 24 | Generous spacing | Between sections |
| `DS.Spacing.xxl` | 32 | Large spacing | Screen edges |
| `DS.Spacing.xxxl` | 48 | Extra large spacing | Major sections |

---

## Corner Radius

**Token System:** `DS.CornerRadius.[size]`

| Token | Value (pt) | Usage | Example |
|-------|------------|-------|---------|
| `DS.CornerRadius.none` | 0 | No rounding | Dividers |
| `DS.CornerRadius.sm` | 4 | Subtle rounding | Chips |
| `DS.CornerRadius.md` | 8 | Standard rounding | Recipe cards |
| `DS.CornerRadius.lg` | 12 | Prominent rounding | Dialogs |
| `DS.CornerRadius.xl` | 16 | Large rounding | Large cards |
| `DS.CornerRadius.full` | 9999 | Pill shape | Metric chips |

---

## Shadows

**Token System:** `DS.Shadow.[level]`

**None:**
- **Token:** `DS.Shadow.none`
- **Value:** No shadow

**Subtle:**
- **Token:** `DS.Shadow.sm`
- **Value:** Radius 2, Y 1, opacity 0.1

**Standard:**
- **Token:** `DS.Shadow.md`
- **Value:** Radius 4, Y 2, opacity 0.15
- **Usage:** Recipe cards

**Prominent:**
- **Token:** `DS.Shadow.lg`
- **Value:** Radius 8, Y 4, opacity 0.2

**Strong:**
- **Token:** `DS.Shadow.xl`
- **Value:** Radius 16, Y 8, opacity 0.25

---

## Implementation

### iOS (SwiftUI)

```swift
import SwiftUI

enum DS {
    enum Colors {
        // Primary
        static let primary = Color(hex: "#2C3E50")
        static let secondary = Color(hex: "#34495E")

        // Metric colors (domain-specific)
        static let flourOrange = Color(hex: "#E67E22")
        static let waterBlue = Color(hex: "#3498DB")
        static let saltPink = Color(hex: "#E91E63")
        static let yeastGreen = Color(hex: "#27AE60")
        static let prefermentPurple = Color(hex: "#9B59B6")

        // Semantic
        static let success = Color(hex: "#27AE60")
        static let warning = Color(hex: "#F39C12")
        static let error = Color(hex: "#E74C3C")
        static let info = Color(hex: "#3498DB")

        // Neutral
        static let background = Color("Background")
        static let surface = Color("Surface")
        static let textPrimary = Color("TextPrimary")
        static let textSecondary = Color("TextSecondary")
        static let divider = Color("Divider")
    }

    enum Typography {
        static let largeTitle = Font.largeTitle.weight(.bold)
        static let title1 = Font.title.weight(.bold)
        static let title2 = Font.title2.weight(.bold)
        static let title3 = Font.title3.weight(.semibold)
        static let headline = Font.headline.weight(.semibold)
        static let body = Font.body
        static let callout = Font.callout
        static let subheadline = Font.subheadline
        static let footnote = Font.footnote
        static let caption1 = Font.caption
        static let caption2 = Font.caption2
    }

    enum Spacing {
        static let xxs: CGFloat = 2
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 24
        static let xxl: CGFloat = 32
        static let xxxl: CGFloat = 48
    }

    enum CornerRadius {
        static let none: CGFloat = 0
        static let sm: CGFloat = 4
        static let md: CGFloat = 8
        static let lg: CGFloat = 12
        static let xl: CGFloat = 16
        static let full: CGFloat = 9999
    }

    enum Shadow {
        static let none: CGFloat = 0
        static let sm: CGFloat = 2
        static let md: CGFloat = 4
        static let lg: CGFloat = 8
        static let xl: CGFloat = 16
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
```

### Usage Example

```swift
struct RecipeCard: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.md) {
            Text(recipe.name)
                .font(DS.Typography.title2)
                .foregroundColor(DS.Colors.textPrimary)
            
            HStack(spacing: DS.Spacing.sm) {
                MetricChip(label: "Flour", value: "100%", color: DS.Colors.flourOrange)
                MetricChip(label: "Water", value: "\(recipe.hydration)%", color: DS.Colors.waterBlue)
                MetricChip(label: "Salt", value: "\(recipe.salt)%", color: DS.Colors.saltPink)
            }
        }
        .padding(DS.Spacing.lg)
        .background(DS.Colors.surface)
        .cornerRadius(DS.CornerRadius.md)
        .shadow(radius: DS.Shadow.md)
    }
}
```

---

## Design System Rules

### Must Use Design System Tokens

❌ **Don't do this:**
```swift
Text("Title")
    .font(.system(size: 28, weight: .bold))  // Hardcoded
    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))  // Hardcoded

VStack(spacing: 16) {  // Hardcoded
    // ...
}
.padding(24)  // Hardcoded
.cornerRadius(12)  // Hardcoded
```

✅ **Do this:**
```swift
Text("Title")
    .font(DS.Typography.title1)  // Token
    .foregroundColor(DS.Colors.textPrimary)  // Token

VStack(spacing: DS.Spacing.lg) {  // Token
    // ...
}
.padding(DS.Spacing.xl)  // Token
.cornerRadius(DS.CornerRadius.md)  // Token
```

---

## Notes

- This design system is specific to Professional Baking App
- Metric colors visualize baker's percentages
- All views MUST use tokens (no hardcoded values)
- Run `/prime` after updates
- Validate token usage in pre-commit hooks
