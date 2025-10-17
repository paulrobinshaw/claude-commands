# Design System Template

**INSTRUCTIONS:** Copy this template to `.claude/project/design-system.md` and customize for your project.

---

## Design System

**Project:** [Your Project Name]

**Technology:** [iOS/Android/Web/React Native/etc.]

**Last Updated:** [YYYY-MM-DD]

---

## Color Palette

### Primary Colors

**Primary:**
- **Token:** `DS.Colors.primary`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Main brand color, primary actions, key UI elements
- **Accessibility:** WCAG AA compliant on white background
- **Example:** Buttons, links, selected states

**Primary Variant (Optional):**
- **Token:** `DS.Colors.primaryVariant`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Hover states, pressed states, secondary emphasis
- **Example:** Button hover, active navigation

### Secondary Colors

**Secondary:**
- **Token:** `DS.Colors.secondary`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Secondary actions, supporting UI elements
- **Accessibility:** WCAG AA compliant
- **Example:** Secondary buttons, badges, chips

**Secondary Variant (Optional):**
- **Token:** `DS.Colors.secondaryVariant`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Secondary hover/pressed states
- **Example:** Secondary button hover

### Semantic Colors

**Success:**
- **Token:** `DS.Colors.success`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Success messages, positive feedback, completed states
- **Example:** "Recipe saved successfully", checkmarks, completed tasks

**Warning:**
- **Token:** `DS.Colors.warning`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Warning messages, caution states, alerts requiring attention
- **Example:** "Low storage", validation warnings, pending states

**Error:**
- **Token:** `DS.Colors.error`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Error messages, failed states, destructive actions
- **Example:** "Failed to load", validation errors, delete actions

**Info:**
- **Token:** `DS.Colors.info`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Informational messages, tips, neutral notifications
- **Example:** "Tip: Try this feature", help text, informational badges

### Neutral Colors

**Background:**
- **Token:** `DS.Colors.background`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Main app background
- **Light Mode:** `#FFFFFF` (white)
- **Dark Mode:** `#000000` (black) or `#121212`

**Surface:**
- **Token:** `DS.Colors.surface`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Cards, sheets, elevated surfaces
- **Light Mode:** `#FFFFFF` or light gray
- **Dark Mode:** `#1C1C1E` or dark gray

**Text Primary:**
- **Token:** `DS.Colors.textPrimary`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Main body text, headings
- **Light Mode:** `#000000` or near-black
- **Dark Mode:** `#FFFFFF` or near-white
- **Accessibility:** WCAG AAA on background

**Text Secondary:**
- **Token:** `DS.Colors.textSecondary`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Supporting text, captions, metadata
- **Light Mode:** `#666666` or medium gray
- **Dark Mode:** `#999999` or light gray
- **Accessibility:** WCAG AA on background

**Divider:**
- **Token:** `DS.Colors.divider`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** Lines, borders, separators
- **Light Mode:** `#E0E0E0` or light gray
- **Dark Mode:** `#333333` or dark gray

### Custom Semantic Colors (Optional)

Add project-specific semantic colors here if needed. Examples:
- Status colors (active, inactive, pending)
- Category colors (by type, priority, etc.)
- Role colors (admin, user, guest)
- Data visualization colors (charts, graphs)

**[Custom Color Name]:**
- **Token:** `DS.Colors.[customName]`
- **Value:** `#[HEX]` or SwiftUI Color definition
- **Usage:** [Describe specific usage]
- **Example:** [Where it appears in UI]

---

## Typography

### Font Family

**Primary Font:**
- **Token:** `DS.Typography.fontFamily`
- **Value:** System default (`.system` on iOS, `Roboto` on Android, `system-ui` on Web) OR custom font
- **Usage:** All text unless otherwise specified
- **Example:** SF Pro on iOS, Roboto on Android

**Monospace Font (Optional):**
- **Token:** `DS.Typography.monospaceFontFamily`
- **Value:** `.monospaced` or `Courier New`
- **Usage:** Code, timestamps, technical data
- **Example:** API responses, log output

### Text Styles

**Large Title (iOS) / H1 (Web):**
- **Token:** `DS.Typography.largeTitle`
- **Font Size:** 34pt (iOS) / 32px (Web)
- **Weight:** Bold or Regular
- **Line Height:** 41pt / 40px
- **Usage:** Main screen titles
- **Example:** "Recipes", "Settings"

**Title 1 / H2:**
- **Token:** `DS.Typography.title1`
- **Font Size:** 28pt / 28px
- **Weight:** Bold or Regular
- **Line Height:** 34pt / 36px
- **Usage:** Section headers
- **Example:** "My Recipes", "Recent Activity"

**Title 2 / H3:**
- **Token:** `DS.Typography.title2`
- **Font Size:** 22pt / 24px
- **Weight:** Bold or Regular
- **Line Height:** 28pt / 32px
- **Usage:** Card titles, subsection headers
- **Example:** Recipe name in card

**Title 3 / H4:**
- **Token:** `DS.Typography.title3`
- **Font Size:** 20pt / 20px
- **Weight:** Semibold or Regular
- **Line Height:** 25pt / 28px
- **Usage:** Smaller headers
- **Example:** Form section titles

**Headline:**
- **Token:** `DS.Typography.headline`
- **Font Size:** 17pt / 18px
- **Weight:** Semibold
- **Line Height:** 22pt / 24px
- **Usage:** Emphasized text, important labels
- **Example:** List item titles, button labels

**Body:**
- **Token:** `DS.Typography.body`
- **Font Size:** 17pt / 16px
- **Weight:** Regular
- **Line Height:** 22pt / 24px
- **Usage:** Main body text, paragraphs
- **Example:** Recipe descriptions, article content

**Callout:**
- **Token:** `DS.Typography.callout`
- **Font Size:** 16pt / 15px
- **Weight:** Regular
- **Line Height:** 21pt / 22px
- **Usage:** Secondary content
- **Example:** Metadata, supporting text

**Subheadline:**
- **Token:** `DS.Typography.subheadline`
- **Font Size:** 15pt / 14px
- **Weight:** Regular
- **Line Height:** 20pt / 20px
- **Usage:** Labels, form fields
- **Example:** Text field labels

**Footnote:**
- **Token:** `DS.Typography.footnote`
- **Font Size:** 13pt / 13px
- **Weight:** Regular
- **Line Height:** 18pt / 18px
- **Usage:** Captions, fine print
- **Example:** Image captions, timestamps

**Caption 1:**
- **Token:** `DS.Typography.caption1`
- **Font Size:** 12pt / 12px
- **Weight:** Regular
- **Line Height:** 16pt / 16px
- **Usage:** Small supporting text
- **Example:** Helper text, hints

**Caption 2:**
- **Token:** `DS.Typography.caption2`
- **Font Size:** 11pt / 11px
- **Weight:** Regular
- **Line Height:** 13pt / 14px
- **Usage:** Very small text
- **Example:** Legal text, tiny metadata

---

## Spacing

### Spacing Scale

**Token System:** `DS.Spacing.[size]`

**Values:**

| Token | Value (pt/px) | Usage | Example |
|-------|---------------|-------|---------|
| `DS.Spacing.xxs` | 2 | Minimal spacing | Icon padding |
| `DS.Spacing.xs` | 4 | Very tight spacing | Chip padding |
| `DS.Spacing.sm` | 8 | Tight spacing | Card internal padding |
| `DS.Spacing.md` | 12 | Standard spacing | Between elements |
| `DS.Spacing.lg` | 16 | Comfortable spacing | Section padding |
| `DS.Spacing.xl` | 24 | Generous spacing | Between sections |
| `DS.Spacing.xxl` | 32 | Large spacing | Screen edges |
| `DS.Spacing.xxxl` | 48 | Extra large spacing | Major sections |

**Usage Guidelines:**
- **Screen padding:** Use `lg` (16pt) or `xl` (24pt) for screen edge padding
- **Card padding:** Use `md` (12pt) or `lg` (16pt) internal padding
- **Element spacing:** Use `sm` (8pt) or `md` (12pt) between related elements
- **Section spacing:** Use `xl` (24pt) or `xxl` (32pt) between sections
- **Button padding:** Use `md` (12pt) horizontal, `sm` (8pt) vertical

---

## Corner Radius

**Token System:** `DS.CornerRadius.[size]`

**Values:**

| Token | Value (pt/px) | Usage | Example |
|-------|---------------|-------|---------|
| `DS.CornerRadius.none` | 0 | No rounding | Dividers, lines |
| `DS.CornerRadius.sm` | 4 | Subtle rounding | Buttons, chips |
| `DS.CornerRadius.md` | 8 | Standard rounding | Cards, text fields |
| `DS.CornerRadius.lg` | 12 | Prominent rounding | Dialogs, sheets |
| `DS.CornerRadius.xl` | 16 | Large rounding | Large cards |
| `DS.CornerRadius.full` | 9999 | Pill shape | Pills, circular avatars |

**Usage Guidelines:**
- **Cards:** Use `md` (8pt) or `lg` (12pt)
- **Buttons:** Use `sm` (4pt) or `md` (8pt)
- **Text fields:** Use `md` (8pt)
- **Chips/Tags:** Use `full` for pill shape
- **Avatars:** Use `full` for circles

---

## Shadows

**Token System:** `DS.Shadow.[level]`

**Values:**

**None:**
- **Token:** `DS.Shadow.none`
- **Value:** No shadow
- **Usage:** Flat UI elements

**Subtle (Level 1):**
- **Token:** `DS.Shadow.sm`
- **Value:** Radius 2, Y 1, opacity 0.1
- **Usage:** Slight elevation, hover states
- **Example:** Hovered cards

**Standard (Level 2):**
- **Token:** `DS.Shadow.md`
- **Value:** Radius 4, Y 2, opacity 0.15
- **Usage:** Normal elevation, cards
- **Example:** Recipe cards

**Prominent (Level 3):**
- **Token:** `DS.Shadow.lg`
- **Value:** Radius 8, Y 4, opacity 0.2
- **Usage:** Elevated elements, dialogs
- **Example:** Modal sheets

**Strong (Level 4):**
- **Token:** `DS.Shadow.xl`
- **Value:** Radius 16, Y 8, opacity 0.25
- **Usage:** Floating elements, popovers
- **Example:** Context menus

---

## Implementation

### iOS (SwiftUI)

Create a `DesignSystem.swift` file:

```swift
import SwiftUI

enum DS {
    enum Colors {
        // Primary
        static let primary = Color("Primary") // Or Color(hex: "#...")
        static let primaryVariant = Color("PrimaryVariant")

        // Secondary
        static let secondary = Color("Secondary")
        static let secondaryVariant = Color("SecondaryVariant")

        // Semantic
        static let success = Color("Success")
        static let warning = Color("Warning")
        static let error = Color("Error")
        static let info = Color("Info")

        // Neutral
        static let background = Color("Background")
        static let surface = Color("Surface")
        static let textPrimary = Color("TextPrimary")
        static let textSecondary = Color("TextSecondary")
        static let divider = Color("Divider")

        // Custom semantic colors (if any)
        // static let [customName] = Color("[CustomName]")
    }

    enum Typography {
        // Font family
        static let fontFamily = "System" // Or custom font name

        // Text styles
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

// Extension for custom color init (if using hex)
extension Color {
    init(hex: String) {
        // Implement hex to Color conversion
    }
}
```

**Usage in Views:**

```swift
struct ExampleView: View {
    var body: some View {
        VStack(spacing: DS.Spacing.md) {
            Text("Title")
                .font(DS.Typography.title1)
                .foregroundColor(DS.Colors.textPrimary)

            Button("Action") {
                // Action
            }
            .padding(.horizontal, DS.Spacing.md)
            .padding(.vertical, DS.Spacing.sm)
            .background(DS.Colors.primary)
            .foregroundColor(.white)
            .cornerRadius(DS.CornerRadius.md)
        }
        .padding(DS.Spacing.lg)
        .background(DS.Colors.surface)
        .cornerRadius(DS.CornerRadius.lg)
        .shadow(radius: DS.Shadow.md)
    }
}
```

### Android (Compose)

Create a `DesignSystem.kt` file:

```kotlin
object DS {
    object Colors {
        // Define colors using Color(0xFF...)
        val primary = Color(0xFF...)
        val secondary = Color(0xFF...)
        // ... etc
    }

    object Typography {
        val largeTitle = TextStyle(fontSize = 34.sp, fontWeight = FontWeight.Bold)
        val title1 = TextStyle(fontSize = 28.sp, fontWeight = FontWeight.Bold)
        // ... etc
    }

    object Spacing {
        val xxs = 2.dp
        val xs = 4.dp
        // ... etc
    }

    object CornerRadius {
        val sm = 4.dp
        val md = 8.dp
        // ... etc
    }

    object Shadow {
        val sm = 2.dp
        val md = 4.dp
        // ... etc
    }
}
```

### Web (React/CSS)

Create a `design-system.css` file:

```css
:root {
    /* Colors */
    --color-primary: #...;
    --color-secondary: #...;
    --color-success: #...;
    --color-warning: #...;
    --color-error: #...;
    --color-info: #...;
    --color-background: #...;
    --color-surface: #...;
    --color-text-primary: #...;
    --color-text-secondary: #...;
    --color-divider: #...;

    /* Typography */
    --font-family: system-ui, -apple-system, sans-serif;
    --font-size-large-title: 32px;
    --font-size-title1: 28px;
    --font-size-body: 16px;
    --line-height-body: 24px;

    /* Spacing */
    --spacing-xxs: 2px;
    --spacing-xs: 4px;
    --spacing-sm: 8px;
    --spacing-md: 12px;
    --spacing-lg: 16px;
    --spacing-xl: 24px;
    --spacing-xxl: 32px;
    --spacing-xxxl: 48px;

    /* Corner Radius */
    --radius-sm: 4px;
    --radius-md: 8px;
    --radius-lg: 12px;
    --radius-xl: 16px;
    --radius-full: 9999px;

    /* Shadows */
    --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.1);
    --shadow-md: 0 2px 4px rgba(0, 0, 0, 0.15);
    --shadow-lg: 0 4px 8px rgba(0, 0, 0, 0.2);
    --shadow-xl: 0 8px 16px rgba(0, 0, 0, 0.25);
}

/* Usage */
.card {
    background: var(--color-surface);
    padding: var(--spacing-lg);
    border-radius: var(--radius-md);
    box-shadow: var(--shadow-md);
}
```

---

## Design System Rules

### Must Use Design System Tokens

**Requirement:** All views MUST use design system tokens. NEVER hardcode values.

**Examples:**

❌ **Don't do this:**
```swift
Text("Title")
    .font(.system(size: 28, weight: .bold))  // Hardcoded
    .foregroundColor(Color(red: 0.2, green: 0.4, blue: 0.8))  // Hardcoded

VStack(spacing: 16) {  // Hardcoded
    // ...
}
.padding(24)  // Hardcoded
.background(Color(hex: "#F5F5F5"))  // Hardcoded
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
.background(DS.Colors.surface)  // Token
.cornerRadius(DS.CornerRadius.md)  // Token
```

### Validation

**Pre-commit checks:**

```bash
# Check for hardcoded colors (iOS)
git diff main | grep -E "Color\(red:|Color\(hex:"

# Check for hardcoded fonts (iOS)
git diff main | grep -E "\.system\(size:"

# Check for hardcoded spacing (iOS)
git diff main | grep -E "\.padding\([0-9]+\)|spacing: [0-9]+"

# Expected: No results (all should use DS tokens)
```

**If violations found:**
- ❌ Block commit
- 📝 Report violations to developer
- ✏️ Suggest token replacements

---

## Dark Mode Support

**Requirement:** All colors must support both light and dark modes.

**Implementation:**

**iOS (Asset Catalog):**
1. Add color sets to `Assets.xcassets`
2. Define "Any Appearance" (light) and "Dark" values
3. Use `Color("ColorName")` to access

**iOS (Code):**
```swift
static let surface = Color(
    light: Color(hex: "#FFFFFF"),
    dark: Color(hex: "#1C1C1E")
)

extension Color {
    init(light: Color, dark: Color) {
        self.init(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
    }
}
```

**Android (Compose):**
```kotlin
val LightColorScheme = lightColorScheme(
    primary = Color(0xFF...),
    // ...
)

val DarkColorScheme = darkColorScheme(
    primary = Color(0xFF...),
    // ...
)

@Composable
fun AppTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    content: @Composable () -> Unit
) {
    MaterialTheme(
        colorScheme = if (darkTheme) DarkColorScheme else LightColorScheme,
        content = content
    )
}
```

**Web (CSS):**
```css
:root {
    --color-background: #FFFFFF;
    --color-text-primary: #000000;
}

@media (prefers-color-scheme: dark) {
    :root {
        --color-background: #000000;
        --color-text-primary: #FFFFFF;
    }
}
```

---

## Accessibility

### Color Contrast

**Requirement:** All text must meet WCAG AA standards (4.5:1 for normal text, 3:1 for large text)

**Guidelines:**
- **Text Primary on Background:** AAA (7:1+)
- **Text Secondary on Background:** AA (4.5:1+)
- **Primary button text on Primary background:** AA (4.5:1+)

**Validation:**
- Use contrast checker tools during design
- Test with accessibility inspector during development

### Text Size

**Requirement:** Support Dynamic Type (iOS) / Font Scaling (Android)

**Implementation:**
- Use semantic text styles (.body, .title, etc.) not fixed sizes
- Test with largest accessibility sizes
- Ensure layouts adapt to larger text

### Touch Targets

**Requirement:** Minimum 44x44pt (iOS) / 48x48dp (Android) for interactive elements

**Implementation:**
- Add `.frame(minWidth: 44, minHeight: 44)` to small buttons
- Use `.contentShape()` to expand tap area if needed

---

## Notes

- This design system is the source of truth for all UI styling
- Update when design changes
- All views MUST use tokens (no hardcoded values)
- Run `/prime` after updates to reload design system
- Validate token usage in pre-commit hooks
- Support light and dark modes for all colors
- Test accessibility contrast and text scaling
