# Version Strategy: Professional Baking App

This version strategy is specific to the professional baking application example.

---

## Version Strategy

**Project:** Professional Baking App (Example)

**Technology:** iOS

**Last Updated:** 2024-10-17

---

## Version Targets

### Target Version

**Version:** iOS 18.0+

**Why:** Latest features, best performance, cutting-edge patterns

**Features Available:**
- All iOS 17 features (foundation)
- Enhanced animations and transitions
- Improved SwiftData performance
- Latest Swift language features
- Best debugging tools

**Release Date:** September 2024

**Adoption Rate:** ~30% of iOS users (6 months post-release)

### Minimum Supported Version

**Version:** iOS 17.0+

**Why:** Balanced approach - modern patterns with good device coverage

**Coverage:** ~85% of active iOS devices

**Key Features Available:**
- @Observable macro (critical for our NO ViewModel architecture)
- #Preview macro (modern previews)
- SwiftData (persistence)
- NavigationStack (modern navigation)
- Enhanced async/await support

**Release Date:** September 2023

**Limitations:**
- Some iOS 18-only features require @available checks
- Slightly older device support (iPhone XS and later)

### Deprecated Versions

**No Longer Supported:**
- iOS 16.x and below - Dropped October 2024

**Reason:**
- iOS 17 provides @Observable, which is critical for our NO ViewModel architecture
- Maintaining pre-@Observable code would require ViewModels
- 85% coverage is sufficient

---

## Architecture Patterns by Version

### Use These Patterns

**For iOS 17+ (Minimum Version):**

✅ **@Observable for Services**
- **Available:** iOS 17+
- **Why:** Foundation of NO ViewModel architecture, native SwiftUI data flow
- **Example:**

```swift
import Observation

@Observable
class RecipeService {
    var recipes: [Recipe] = []
    var isLoading = false
    
    func loadRecipes() async throws {
        // Business logic
    }
}

// Inject at app level
.environment(RecipeService())

// Use in any view
@Environment(RecipeService.self) private var service
```

✅ **#Preview Macro**
- **Available:** iOS 17+
- **Why:** Cleaner, more concise than PreviewProvider
- **Example:**

```swift
#Preview {
    RecipeCard(recipe: .sample)
}

#Preview("Dark Mode") {
    RecipeCard(recipe: .sample)
        .preferredColorScheme(.dark)
}
```

✅ **@Bindable for Two-Way Bindings**
- **Available:** iOS 17+
- **Why:** Works with @Observable objects
- **Example:**

```swift
struct RecipeEditView: View {
    @Bindable var recipe: Recipe
    
    var body: some View {
        TextField("Name", text: $recipe.name)
    }
}
```

✅ **.task Modifier**
- **Available:** iOS 15+ (available on our 17+ minimum)
- **Why:** Proper async lifecycle management
- **Example:**

```swift
.task {
    try? await service.loadRecipes()
}
```

✅ **NavigationStack**
- **Available:** iOS 16+ (available on our 17+ minimum)
- **Why:** Modern navigation, better than NavigationView
- **Example:**

```swift
NavigationStack {
    RecipeListView()
}
```

✅ **SwiftData @Model**
- **Available:** iOS 17+
- **Why:** Modern persistence, replaces Core Data
- **Example:**

```swift
import SwiftData

@Model
final class Recipe {
    var name: String
    var ingredients: [Ingredient]
    
    init(name: String) {
        self.name = name
        self.ingredients = []
    }
}
```

### Avoid These Patterns

**Deprecated/Legacy:**

❌ **ObservableObject ViewModels**
- **Replaced by:** @Observable services
- **Available in:** iOS 13+ (legacy)
- **Why avoid:** Old pattern, we use @Observable instead
- **Migration:** Convert ViewModels to @Observable services

```swift
// Don't do this
class RecipeViewModel: ObservableObject {  // ❌
    @Published var recipes: [Recipe] = []
}

// Do this instead
@Observable
class RecipeService {  // ✅
    var recipes: [Recipe] = []
}
```

❌ **PreviewProvider**
- **Replaced by:** #Preview macro
- **Available in:** iOS 13+ (legacy)
- **Why avoid:** Verbose, outdated
- **Migration:** Replace with #Preview macro

```swift
// Don't do this
struct RecipeCard_Previews: PreviewProvider {  // ❌
    static var previews: some View {
        RecipeCard(recipe: .sample)
    }
}

// Do this instead
#Preview {  // ✅
    RecipeCard(recipe: .sample)
}
```

❌ **.onAppear for Async Work**
- **Replaced by:** .task modifier
- **Why avoid:** Doesn't handle cancellation properly
- **Migration:** Use .task instead

```swift
// Don't do this
.onAppear {  // ❌
    Task {
        await service.load()
    }
}

// Do this instead
.task {  // ✅
    await service.load()
}
```

❌ **NavigationView**
- **Replaced by:** NavigationStack
- **Available in:** iOS 13+ (deprecated iOS 16+)
- **Why avoid:** Deprecated, use NavigationStack
- **Migration:** Replace with NavigationStack

```swift
// Don't do this
NavigationView {  // ❌
    RecipeListView()
}

// Do this instead
NavigationStack {  // ✅
    RecipeListView()
}
```

---

## Version-Specific Guidelines

### For iOS 17+ (Minimum)

#### Core Patterns

**State Management:**
- ✅ Use @Observable for all services
- ✅ Use @State for view-local state
- ✅ Use @Environment for service injection
- ✅ Use @Bindable for two-way bindings
- ❌ Never use ObservableObject

**Previews:**
- ✅ Use #Preview macro
- ✅ Create multiple previews (light/dark, sizes)
- ❌ Never use PreviewProvider

**Async Work:**
- ✅ Use .task modifier for view lifecycle async
- ✅ Use async/await throughout
- ❌ Don't use .onAppear with Task

**Navigation:**
- ✅ Use NavigationStack
- ✅ Use navigationDestination for routing
- ❌ Don't use NavigationView or NavigationLink(destination:)

**Persistence:**
- ✅ Use SwiftData @Model
- ✅ Use @Query in views
- ✅ Use .modelContainer() at app level

#### When to Use @available

Use @available sparingly, only for iOS 18+ features:

```swift
if #available(iOS 18, *) {
    // iOS 18-only feature
    // (use sparingly, most code should work on iOS 17+)
} else {
    // iOS 17 fallback
}
```

**When to use @available:**
- New iOS 18 animations
- iOS 18-only APIs
- Experimental features

**When NOT to use @available:**
- @Observable (iOS 17+, our minimum)
- NavigationStack (iOS 16+, below our minimum)
- SwiftData (iOS 17+, our minimum)

---

## Migration Strategy

### Upgrading Minimum Version

**Current:** iOS 17.0+

**When to Upgrade to iOS 18+:**
- Adoption rate > 80% (estimated: September 2025)
- iOS 18 features become critical
- iOS 17 significant bugs

**Migration Steps:**
1. Monitor adoption rates quarterly
2. When iOS 18 adoption > 80%:
   - Update minimum deployment target
   - Remove @available checks for iOS 18 features
   - Use iOS 18 features directly
   - Update documentation

**Deprecation Notice:**
- Announce 3 months before dropping iOS 17
- Notify users via app update notes
- Provide migration guide for affected features

### Adopting New Features

**Evaluation Criteria:**
- Adoption rate: 80% of users on version with feature
- Stability: Feature is production-ready (not beta)
- Benefits: Clear advantages over current approach
- Effort: Migration effort is reasonable

**Adoption Process:**
1. Test feature in isolated branch
2. Evaluate benefits vs effort
3. If worth it: Plan migration
4. Gradual rollout with @available
5. Once minimum version raised: Remove @available

---

## Platform-Specific Considerations

### Device Support

**Target Devices:**
- iPhone: iPhone XS and later (iOS 17+ capable)
- iPad: iPad (6th generation) and later, all iPad Pro, iPad Air (3rd gen+), iPad mini (5th gen+)
- Mac (Catalyst): Not planned (iOS-only app)
- Apple Watch: Not planned
- Apple TV: Not planned
- Apple Vision Pro: Future consideration

**Screen Sizes:**
- iPhone: 4.7" to 6.9" (iPhone SE to iPhone 15 Pro Max)
- iPad: 7.9" to 12.9" (iPad mini to iPad Pro 12.9")

### Performance Targets

**Target Performance:**
- Launch time: < 2 seconds (cold start)
- Frame rate: 60 FPS (UI interactions)
- Recipe list scroll: 60 FPS with 100+ recipes
- Memory: < 100 MB typical usage
- Battery: < 5% per hour of active use

---

## Compatibility Matrix

### Feature Availability

| Feature | iOS 18 | iOS 17 (Min) | Fallback |
|---------|--------|--------------|----------|
| @Observable | ✅ | ✅ | N/A (required) |
| #Preview | ✅ | ✅ | N/A (required) |
| SwiftData | ✅ | ✅ | N/A (required) |
| NavigationStack | ✅ | ✅ | N/A (iOS 16+) |
| @Bindable | ✅ | ✅ | N/A (required) |
| Enhanced animations | ✅ | ❌ | Use @available |
| New SF Symbols | ✅ | ⚠️ Partial | Fallback symbols |

---

## Testing Strategy

### Version Testing

**Test Matrix:**
- iOS 18.x: Full test suite on latest
- iOS 17.0: Core functionality, edge cases
- iOS 16.x: Verify app doesn't launch (below minimum)

**Testing Approach:**
- **Simulators:** iOS 17.0, 17.4, 18.0, 18.1
- **Real devices:**
  - iPhone 13 (iOS 17)
  - iPhone 14 Pro (iOS 17)
  - iPhone 15 (iOS 18)
  - iPad Air (iOS 17)
- **Automated:** CI/CD runs tests on iOS 17.0 and 18.0 simulators
- **Manual:** Critical paths tested on real devices

---

## Update Schedule

**Review Frequency:** Every 6 months (March, September aligned with iOS releases)

**Next Review:** March 2025

**Triggers for Early Review:**
- New iOS major version released
- Security vulnerability requiring version bump
- Significant shift in adoption rates
- Critical iOS 18 feature becomes must-have

---

## Documentation References

**Official Documentation:**
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Observation Framework](https://developer.apple.com/documentation/observation)
- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata)

**WWDC Sessions:**
- [WWDC 2023: Discover Observation in SwiftUI](https://developer.apple.com/videos/play/wwdc2023/10149/)
- [WWDC 2023: Meet SwiftData](https://developer.apple.com/videos/play/wwdc2023/10187/)
- [WWDC 2024: What's new in SwiftUI](https://developer.apple.com/videos/play/wwdc2024/10144/)

**Migration Guides:**
- [Migrating to @Observable](https://developer.apple.com/documentation/observation/migrating-from-the-observable-object-protocol-to-the-observable-macro)

---

## Notes

- This version strategy is specific to Professional Baking App
- iOS 17+ required for @Observable (foundation of our architecture)
- Review adoption rates quarterly
- Plan iOS 18 minimum upgrade for September 2025 (if adoption permits)
- Run `/prime` after updates to reload strategy
