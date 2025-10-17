# SwiftUI Feature Planning

Creates architecture-aware, design-system-compliant feature plans for SwiftUI.

**Philosophy:** Auto-load context, enforce architecture, generate comprehensive plans.

---

## What This Does

1. **Checks prerequisites** (architecture loaded)
2. **Auto-loads context** (design system, domain if needed)
3. **Generates feature plan** following architecture patterns
4. **Outputs to** `specs/feature-*.md`

---

## Instructions

You are creating a detailed implementation plan for a SwiftUI feature. Follow the architecture patterns and use design system tokens.

---

## Pre-Flight: Context Check & Auto-Loading

### Check Architecture

If NOT in context: `.claude/commands/swiftui/architecture.md`
````
❌ Architecture not loaded

Please run /prime first to load SwiftUI architecture.
````

**Stop and ask user to run `/prime`.**

### Auto-Load Design System

Check if design system is in context.

**If NOT loaded:**
````
📚 Auto-loading design system for UI feature planning...
````

Read: `.claude/project/design-system.md`
````
✅ Design system loaded (~2,000 tokens)
````

**If file doesn't exist:**
````
⚠️ No design system found

Will flag hardcoded values during planning.
Consider creating: .claude/project/design-system.md
````

### Auto-Load Domain Knowledge

Analyze feature description for domain keywords.

**Domain keyword detection:**
````
Keywords to check: recipe, formula, scaling, ingredient, baker, dough, 
                   hydration, preferment, levain, yield, percentage,
                   calculation, conversion, measurement
````

**If domain keywords found AND domain not in context:**
````
📚 Auto-loading domain knowledge for domain-specific feature...
````

Read: `.claude/project/domain.md`
````
✅ Domain knowledge loaded (~8,000 tokens)
````

**If no domain keywords:**
````
ℹ️ Generic feature (no domain-specific requirements detected)
````

**If domain file doesn't exist but keywords found:**
````
⚠️ Domain keywords detected but no domain knowledge file

Feature will be planned generically.
Add domain knowledge: .claude/project/domain.md
````

---

## Step 1: Analyze Feature Requirements

Parse the feature description and identify:

### Scope

- What is the user trying to accomplish?
- What are the acceptance criteria?
- What are the edge cases?

### Architecture Layers Affected

Determine which layers need changes:

- [ ] **View Layer** - New views, modified views
- [ ] **Service Layer** - New services, modified services  
- [ ] **Data Layer** - New models, modified models

### Design System Needs

Identify design system usage:

- Colors needed (semantic tokens from DS)
- Typography needed (font tokens from DS)
- Spacing needed (spacing tokens from DS)
- Components needed (existing or new)

### Domain Requirements

If domain knowledge loaded:

- Domain concepts involved
- Business rules to apply
- Domain calculations needed
- Domain terminology to use

---

## Step 2: Plan Architecture

### Services Needed

List services required (if any):

**New services:**
````
- ServiceName (@Observable)
  Purpose: [what it does]
  Responsibilities: [list]
````

**Modified services:**
````
- ExistingService
  Changes: [what needs to change]
````

**Plan with:** `/service ServiceName` for each new service

### Models Needed

List models required (if any):

**New models:**
````
- ModelName (@Model)
  Purpose: [what it represents]
  Properties: [list]
  Relationships: [list]
````

**Modified models:**
````
- ExistingModel
  Changes: [what needs to change]
````

**Plan with:** `/model ModelName` for each new model

### Views Architecture

Plan view structure following decomposition rules:

**Main view(s):**
````
- MainViewName (container, < 150 lines)
  Purpose: [what it coordinates]
  Responsibilities: [list]
````

**Components:**
````
- ComponentName (< 100 lines)
  Purpose: [what it displays]
  Reusable: Yes/No
  Design system: [DS components used]
````

---

## Step 3: Generate Implementation Plan

Create detailed plan in specs/ directory.

### Plan File Name
````
specs/feature-[brief-description].md
````

Examples:
- `specs/feature-user-authentication.md`
- `specs/feature-dark-mode.md`
- `specs/feature-recipe-scaling.md`

### Plan Template
````markdown
# Feature: [Feature Name]

## Feature Description

[Detailed description of what this feature does and why it's needed]

**User Story:**
As a [user type], I want to [action] so that [benefit].

**Acceptance Criteria:**
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Architecture Impact

**Layers Affected:**
- [x] View Layer (SwiftUI views and components)
- [x] Service Layer (@Observable services)
- [x] Data Layer (SwiftData @Model)

**New Components:**
- Services: [list services to create]
- Models: [list models to create]
- Views: [list views to create]
- Components: [list reusable components to create]

**Modified Components:**
- [list files that need modification]

## Design System Integration

**Colors Used:**
- `Color.[token]` - [usage description]
- `Color.[token]` - [usage description]

**Typography Used:**
- `Font.[token]` - [usage description]
- `Font.[token]` - [usage description]

**Spacing Used:**
- `CGFloat.[token]` - [usage description]

**Components Used:**
- `[DSComponent]` - [usage description]

**New Components Needed:**
- `[ComponentName]` - [description, will use /component to plan]

## Domain Knowledge Application

[If domain loaded]

**Domain:** [domain name from domain.md]

**Business Rules Applied:**
- [Rule 1 from domain knowledge]
- [Rule 2 from domain knowledge]

**Domain Calculations:**
- [Calculation 1 with formula]
- [Calculation 2 with formula]

**Domain Language:**
- [Term 1]: [definition from domain knowledge]
- [Term 2]: [definition from domain knowledge]

[If domain not loaded]

**Domain:** Generic feature (no domain-specific requirements)

## Implementation Plan

### Phase 1: Services

[If services needed]

#### 1.1 Create [ServiceName]
````
/service "[ServiceName]"
````

**Purpose:** [what this service does]

**Key Methods:**
- `[method1]()` - [description]
- `[method2]()` - [description]

**State:**
- `var [property]: Type` - [description]

**Dependencies:**
- [list dependencies]

#### 1.2 Implement Service Logic

File: `[ProjectName]/Services/[ServiceName].swift`

**Tasks:**
- [ ] Create service with @Observable
- [ ] Implement [method1]
- [ ] Implement [method2]
- [ ] Add error handling
- [ ] Add loading states

**Architecture Notes:**
- ✅ Use @Observable (NO ObservableObject)
- ✅ Pure business logic (NO UI concerns)
- ✅ Async/await for async operations
- ✅ Inject dependencies via init

[If no services needed]

**No new services required for this feature.**

### Phase 2: Models

[If models needed]

#### 2.1 Create [ModelName]
````
/model "[ModelName]"

struct [ViewName]: View {
    @Environment([ServiceName].self) private var service
    @State private var [localState]: Type
    
    var body: some View {
        // Layout using components
    }
}
````

**Tasks:**
- [ ] Create view file
- [ ] Inject service via @Environment
- [ ] Add local @State for UI state
- [ ] Compose layout with components
- [ ] Keep < 150 lines (decompose if needed)

**Architecture Notes:**
- ✅ Presentation only (no business logic)
- ✅ Use @Environment for services
- ✅ Use @State for local UI state
- ✅ Use @Binding for parent-child communication

#### 3.2 Create Components

[For each component]

##### Component: [ComponentName]
````
/component "[ComponentName]"

@main
struct MyApp: App {
    @State private var [serviceName] = [ServiceName](
        // inject dependencies
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment([serviceName])
        }
    }
}