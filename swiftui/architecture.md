# SwiftUI Architecture Guidelines

Core architecture patterns and rules for SwiftUI development.

**Loaded by:** `swiftui/prime.md` (always loaded, ~3K tokens)

---

## Core Philosophy

### NO ViewModels

We do NOT use the traditional MVVM pattern with ViewModels. Instead, we use native SwiftUI data flow patterns.

**Why?**
- ✅ Apple's recommended approach (WWDC 2023)
- ✅ Less code duplication
- ✅ Better separation of concerns
- ✅ Easier testing
- ✅ More scalable

---

## Data Flow Architecture

### The Pattern
```
┌─────────────────────────────────────────┐
│            SwiftUI Views                │
│   (@State for local, @Environment       │
│    for services, @Binding for parent)   │
└─────────────────┬───────────────────────┘
                  │
                  │ @Environment
                  │
┌─────────────────▼───────────────────────┐
│         @Observable Services            │
│   (Business logic, data management)     │
└─────────────────┬───────────────────────┘
                  │
                  │ async/await
                  │
┌─────────────────▼───────────────────────┐
│          SwiftData Models               │
│        (Data persistence)               │
└─────────────────────────────────────────┘
```

---

## Layer 1: Views (Presentation)

### Responsibilities

- **Presentation only** - How things look
- **User interaction** - Buttons, gestures, input
- **View state** - Loading, error states
- **NO business logic** - Calculations belong in services

### Patterns

#### Local UI State

Use `@State` for view-local UI state:
```swift
struct RecipeListView: View {
    @State private var searchText = ""
    @State private var isShowingFilter = false
    
    var body: some View {
        // Use searchText, isShowingFilter
    }
}
```

#### Service Access

Use `@Environment` to access services:
```swift
struct RecipeListView: View {
    @Environment(RecipeService.self) private var recipeService
    
    var body: some View {
        List(recipeService.recipes) { recipe in
            RecipeRow(recipe: recipe)
        }
    }
}
```

#### Parent-Child Communication

Use `@Binding` for parent-child:
```swift
struct RecipeFilterSheet: View {
    @Binding var isPresented: Bool
    @Binding var selectedCategory: Category?
    
    var body: some View {
        // Modify bindings, parent sees changes
    }
}
```

### Component Decomposition Rules

**Rule 1: Views < 150 lines**
- If a view exceeds 150 lines, decompose into components
- Extract logical sections into separate components

**Rule 2: Components < 100 lines**
- Reusable components should be focused and small
- Single responsibility per component

**Rule 3: Extract Complex Layouts**
- Complex layouts (3+ levels of nesting) → component
- Repeated UI patterns → component

**Example:**
```swift
// ❌ Too large (300 lines)
struct RecipeDetailView: View {
    var body: some View {
        ScrollView {
            // 300 lines of mixed content
        }
    }
}

// ✅ Decomposed
struct RecipeDetailView: View {  // 50 lines
    var body: some View {
        ScrollView {
            RecipeHeaderComponent(recipe: recipe)
            RecipeIngredientsSection(ingredients: ingredients)
            RecipeInstructionsSection(instructions: instructions)
            RecipeNotesSection(notes: notes)
        }
    }
}

// Each component: 60-80 lines, focused responsibility
```

---

## Layer 2: Services (Business Logic)

### Responsibilities

- **Business logic** - Calculations, rules, algorithms
- **Data management** - Fetching, caching, state
- **Domain operations** - Domain-specific functionality
- **NO UI logic** - Don't know about views

### @Observable Pattern

Use `@Observable` (iOS 17+) for services:
```swift
import Observation

@Observable
class RecipeService {
    // Published state (automatically observed)
    var recipes: [Recipe] = []
    var isLoading = false
    var error: Error?
    
    // Dependencies (injected)
    private let dataStore: DataStore
    
    init(dataStore: DataStore) {
        self.dataStore = dataStore
    }
    
    // Business logic
    func loadRecipes() async throws {
        isLoading = true
        defer { isLoading = false }
        
        recipes = try await dataStore.fetchRecipes()
    }
    
    func scaleRecipe(_ recipe: Recipe, servings: Int) -> Recipe {
        // Domain calculation logic
    }
}
```

### Injection Pattern

**Inject at app level:**
```swift
@main
struct MyApp: App {
    @State private var recipeService = RecipeService(
        dataStore: DataStore()
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(recipeService)
        }
    }
}
```

**Access in any view:**
```swift
struct AnyView: View {
    @Environment(RecipeService.self) private var service
    
    var body: some View {
        // Use service
    }
}
```

### Service Naming

- **Suffix with "Service":** `RecipeService`, `AuthService`
- **Domain-focused names:** Not `RecipeManager`, not `RecipeHelper`
- **Single responsibility:** One service per domain area

---

## Layer 3: Models (Data)

### SwiftData Models

Use `@Model` for persistence:
```swift
import SwiftData

@Model
final class Recipe {
    var id: UUID
    var name: String
    var ingredients: [Ingredient]
    var createdAt: Date
    
    init(name: String, ingredients: [Ingredient]) {
        self.id = UUID()
        self.name = name
        self.ingredients = ingredients
        self.createdAt = Date()
    }
}
```

### Model Guidelines

- **Domain entities** - Represent your domain objects
- **Persistence focused** - Data storage, relationships
- **Minimal logic** - Computed properties OK, complex logic in services
- **Value types where possible** - Use structs for non-persisted models

---

## Modern SwiftUI Patterns (iOS 17+)

### Use These

✅ **@Observable** (not ObservableObject)
```swift
@Observable
class MyService { }
```

✅ **#Preview macro** (not PreviewProvider)
```swift
#Preview {
    MyView()
}
```

✅ **@Bindable** (for bindings to Observable objects)
```swift
@Bindable var service: MyService
TextField("Name", text: $service.name)
```

✅ **.task modifier** (for async work, not .onAppear)
```swift
.task {
    try? await service.load()
}
```

✅ **NavigationStack** (not NavigationView)
```swift
NavigationStack {
    // content
}
```

### Avoid These

❌ **ObservableObject** (legacy)
```swift
// Don't use anymore
class MyViewModel: ObservableObject {
    @Published var data: [Item]
}
```

❌ **PreviewProvider** (legacy)
```swift
// Don't use anymore
struct MyView_Previews: PreviewProvider {
    static var previews: some View { }
}
```

❌ **.onAppear for async** (use .task)
```swift
// Avoid
.onAppear {
    Task {
        await service.load()
    }
}

// Use instead
.task {
    await service.load()
}
```

❌ **NavigationView** (deprecated)
```swift
// Deprecated
NavigationView { }

// Use
NavigationStack { }
```

---

## Design System Integration

### Use Tokens, Not Hardcoded Values

**Colors:**
```swift
// ❌ Hardcoded
.foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.95))

// ✅ Semantic token
.foregroundColor(.primary)
.foregroundColor(.metricBlue)  // From design system
```

**Typography:**
```swift
// ❌ Hardcoded
.font(.system(size: 17, weight: .semibold))

// ✅ Semantic token
.font(.headline)
.font(.cardTitle)  // From design system
```

**Spacing:**
```swift
// ❌ Magic numbers
.padding(12)

// ✅ Spacing token
.padding(.space3)  // From design system
```

---

## Testing Strategy

### What to Test

**Services (Heavy testing):**
- ✅ Business logic
- ✅ Data transformations
- ✅ Error handling
- ✅ State management

**Views (Light testing):**
- ✅ Critical user flows
- ✅ Accessibility
- ❌ Don't test appearance

### Service Testing Example
```swift
@Test func scaleRecipe() async throws {
    let service = RecipeService(dataStore: MockDataStore())
    let recipe = Recipe(name: "Test", servings: 4)
    
    let scaled = service.scaleRecipe(recipe, servings: 8)
    
    #expect(scaled.servings == 8)
    #expect(scaled.ingredients[0].amount == recipe.ingredients[0].amount * 2)
}
```

---

## Architecture Checklist

Every feature should:

- [ ] **NO ViewModels** - Use @Observable services
- [ ] **Views < 150 lines** - Decompose if larger
- [ ] **Components < 100 lines** - Focused and reusable
- [ ] **Services injected** - Use .environment()
- [ ] **Design system tokens** - No hardcoded values
- [ ] **Modern patterns** - @Observable, #Preview, .task
- [ ] **Tested services** - 80%+ coverage on business logic
- [ ] **SwiftData for persistence** - Use @Model

---

## References

- [WWDC 2023: Discover Observation in SwiftUI](https://developer.apple.com/videos/play/wwdc2023/10149/)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata)

---

**This architecture ensures scalable, maintainable, testable SwiftUI apps.**