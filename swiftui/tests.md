# SwiftUI Test Suite Planning

Creates test suite plans for services, models, or features.

**Philosophy:** Test business logic heavily, UI lightly.

---

## What This Does

1. **Checks prerequisites** (architecture loaded)
2. **Generates test plan** for target
3. **Outputs to** `specs/tests-*.md`

---

## Instructions

You are creating a comprehensive test suite for a service, model, or feature.

---

## Pre-Flight: Context Check

### Check Architecture

If NOT in context: `.claude/swiftui/architecture.md`

❌ Architecture not loaded

Please run /prime first.

**Stop and ask user to run `/prime`.**

---

## Step 1: Identify Test Target

Determine what to test:
- **Service** - Business logic (heavy testing)
- **Model** - Data integrity (light testing)
- **Feature** - End-to-end (integration testing)
- **View** - Critical flows only (minimal testing)

---

## Step 2: Generate Test Plan

Create plan in `specs/tests-[target].md`

### Plan Template

# Test Suite: [TargetName]

## Test Target

**Target:** [What is being tested]

**Type:** [Service/Model/Feature/View]

**Coverage Goal:** [90% for services, 70% for features, etc.]

## Test Strategy

**Focus Areas:**
- [Area 1]
- [Area 2]

**Test Types:**
- [ ] Unit tests (services, models)
- [ ] Integration tests (features)
- [ ] UI tests (critical flows only)

## Test Cases

### Test Group 1: [Functionality Name]

#### Test: [Test Name]

**Purpose:** [What this test verifies]

**Setup:**
- [Setup step 1]
- [Setup step 2]

**Action:**
- [Action to take]

**Expected:**
- [Expected result]

**Implementation:**

@Test func [testName]() async throws {
    // Arrange
    let service = [Target](dependencies: mock)

    // Act
    let result = try await service.method()

    // Assert
    #expect(result == expectedValue)
}

#### Test: [Test Name 2]

[Similar structure]

### Test Group 2: Error Handling

#### Test: [Error Case]

**Purpose:** [What error scenario]

**Implementation:**

@Test func [errorTestName]() async throws {
    let service = [Target](dependencies: failingMock)

    await #expect(throws: ExpectedError.self) {
        try await service.method()
    }
}

### Test Group 3: Edge Cases

[Edge case tests]

## Implementation Plan

### Step 1: Create Test File

File: `Tests/[TargetName]Tests.swift`

import Testing
@testable import [ProjectName]

struct [TargetName]Tests {
    // Test cases here
}

**Tasks:**
- [ ] Create test file
- [ ] Import Testing framework
- [ ] Import target with @testable

### Step 2: Implement Test Cases

**For Services:**

@Test func businessLogic() async throws {
    // Test business logic
}

@Test func stateChanges() async throws {
    // Test state updates
}

@Test func errorHandling() async throws {
    // Test error scenarios
}

**For Models:**

@Test func initialization() {
    // Test model creation
}

@Test func relationships() {
    // Test relationships
}

@Test func computedProperties() {
    // Test computed properties
}

**Tasks:**
- [ ] Implement all test cases
- [ ] Use mocks for dependencies
- [ ] Test happy paths
- [ ] Test error paths
- [ ] Test edge cases

### Step 3: Create Mocks

File: `Tests/Mocks/Mock[Dependency].swift`

final class Mock[Dependency]: [Protocol] {
    var methodCallCount = 0
    var methodReturnValue: Type?

    func method() -> Type {
        methodCallCount += 1
        return methodReturnValue ?? defaultValue
    }
}

**Tasks:**
- [ ] Create mocks for dependencies
- [ ] Track call counts
- [ ] Allow configuring return values
- [ ] Support error injection

### Step 4: Run Tests

**Commands:**

# Run all tests
xcodebuild test -project [Project].xcodeproj -scheme [Scheme]

# Run specific test
xcodebuild test -project [Project].xcodeproj -scheme [Scheme] \
  -only-testing:[Target]/[TestName]

# Check coverage
xcodebuild test -project [Project].xcodeproj -scheme [Scheme] \
  -enableCodeCoverage YES

## Validation

**Coverage Goals:**
- Services: 90%+ coverage
- Models: 70%+ coverage
- Views: Critical flows only

**Quality Checks:**
- [ ] All tests pass
- [ ] Coverage meets goals
- [ ] Fast execution (< 30s for unit tests)
- [ ] No flaky tests
- [ ] Tests are maintainable

## Notes

**Testing Philosophy:**
- Heavy testing on services (business logic)
- Light testing on views (appearance tested manually)
- Focus on behavior, not implementation
- Tests should be fast and reliable

---

## Arguments

$ARGUMENTS - Target to test

**Usage:**

/tests "RecipeService"
/tests "Recipe model"
/tests "authentication feature"

---

**This generates comprehensive test suite plans.**
