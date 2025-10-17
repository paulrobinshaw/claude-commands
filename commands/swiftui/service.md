# SwiftUI Service Planning

Creates plans for @Observable business logic services.

**Philosophy:** Business logic only, no UI, injected via Environment.

---

## What This Does

1. **Checks prerequisites** (architecture loaded)
2. **Auto-loads domain** (if domain-related service)
3. **Generates service plan** using @Observable pattern
4. **Outputs to** `specs/service-*.md`

---

## Instructions

You are creating a plan for an @Observable service following NO ViewModel architecture.

---

## Pre-Flight: Context Check & Auto-Loading

### Check Architecture

If NOT in context: `.claude/commands/swiftui/architecture.md`

❌ Architecture not loaded

Please run /prime first.

**Stop and ask user to run `/prime`.**

### Auto-Load Domain (Smart)

Analyze service name for domain keywords.

**Domain keywords:** recipe, formula, ingredient, baker, calculation, auth, payment, [domain terms]

**If domain keywords found AND domain not in context:**

📚 Auto-loading domain knowledge for domain service...

Read: `.claude/project/domain.md`

✅ Domain knowledge loaded

**If no domain keywords:**

ℹ️ Generic service (no domain knowledge needed)

---

## Step 1: Analyze Service Requirements

Determine:
- What business logic does this service handle?
- What state does it manage?
- What dependencies does it need?
- Is it domain-specific or generic?

---

## Step 2: Generate Service Plan

Create plan in `specs/service-[name].md`

### Plan Template

# Service: [ServiceName]

## Service Description

**Purpose:** [What business logic this service handles]

**Responsibilities:**
- [Responsibility 1]
- [Responsibility 2]

**Domain:** [Domain-specific or Generic]

## Service Architecture

**Pattern:** @Observable (iOS 17+)

**State:**
- `var property1: Type` - [description]
- `var property2: Type` - [description]

**Methods:**
- `func method1()` - [description]
- `func method2()` - [description]

**Dependencies:**
- [Dependency 1]
- [Dependency 2]

## Domain Integration

[If domain loaded]

**Domain:** [domain name]

**Business Rules Applied:**
- [Rule 1 from domain knowledge]
- [Rule 2 from domain knowledge]

**Domain Calculations:**

// [Calculation from domain knowledge]
func calculate() -> Type {
    // Formula from domain.md
}

[If no domain]

**Domain:** Generic service

## Implementation Plan

### Step 1: Create Service File

File: `Services/[ServiceName].swift`

import Observation

@Observable
class [ServiceName] {
    // MARK: - State

    var property1: Type
    var property2: Type
    var isLoading = false
    var error: Error?

    // MARK: - Dependencies

    private let dependency1: Dependency1
    private let dependency2: Dependency2

    // MARK: - Initialization

    init(dependency1: Dependency1, dependency2: Dependency2) {
        self.dependency1 = dependency1
        self.dependency2 = dependency2
        self.property1 = initialValue
        self.property2 = initialValue
    }

    // MARK: - Business Logic

    func method1() async throws {
        isLoading = true
        defer { isLoading = false }

        do {
            // Business logic
        } catch {
            self.error = error
            throw error
        }
    }
}

**Tasks:**
- [ ] Create service file
- [ ] Use @Observable (NOT ObservableObject)
- [ ] Define state properties
- [ ] Define methods
- [ ] Inject dependencies via init
- [ ] Add error handling
- [ ] Add loading states
- [ ] NO UI logic

### Step 2: Inject at App Level

File: `[AppName]App.swift`

@main
struct MyApp: App {
    @State private var [serviceName] = [ServiceName](
        dependency1: Dependency1(),
        dependency2: Dependency2()
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment([serviceName])
        }
    }
}

**Tasks:**
- [ ] Create service instance
- [ ] Inject dependencies
- [ ] Add .environment() modifier

### Step 3: Use in Views

Example usage:

struct SomeView: View {
    @Environment([ServiceName].self) private var service

    var body: some View {
        VStack {
            if service.isLoading {
                ProgressView()
            } else {
                Text(service.property1)
            }
        }
        .task {
            try? await service.method1()
        }
    }
}

### Step 4: Add Tests

File: `Tests/[ServiceName]Tests.swift`

import Testing

@Test func method1() async throws {
    let service = [ServiceName](
        dependency1: MockDependency1(),
        dependency2: MockDependency2()
    )

    try await service.method1()

    #expect(service.property1 == expectedValue)
}

@Test func errorHandling() async throws {
    let service = [ServiceName](
        dependency1: FailingMock(),
        dependency2: MockDependency2()
    )

    await #expect(throws: ExpectedError.self) {
        try await service.method1()
    }

    #expect(service.error != nil)
}

**Tasks:**
- [ ] Test business logic
- [ ] Test state changes
- [ ] Test error handling
- [ ] Test edge cases
- [ ] Aim for 90%+ coverage

## Validation Commands

**Build:**

xcodebuild -project [Project].xcodeproj -scheme [Scheme]

**Test:**

xcodebuild test -project [Project].xcodeproj -scheme [Scheme]

**Architecture Check:**

# Verify @Observable used (not ObservableObject)
grep "ObservableObject" Services/[ServiceName].swift
# Expected: No results

## Architecture Checklist

- [ ] Uses @Observable (NOT ObservableObject)
- [ ] Pure business logic (NO UI)
- [ ] Dependencies injected via init
- [ ] Async/await for async operations
- [ ] Proper error handling
- [ ] Loading states managed
- [ ] Injected at app level via .environment()
- [ ] Tests cover business logic (90%+)

## Notes

[Additional context]

---

## Arguments

$ARGUMENTS - Service name and description

**Usage:**

/service "RecipeService to manage recipe data and scaling calculations"
/service "AuthenticationService to handle user login and session"

---

**This generates @Observable service plans following NO ViewModel architecture.**
