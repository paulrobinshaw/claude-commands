# SwiftUI Model Planning

Creates plans for SwiftData models for data persistence.

**Philosophy:** Domain entities, persistence-focused, minimal logic.

---

## What This Does

1. **Checks prerequisites** (architecture loaded)
2. **Generates model plan** using @Model
3. **Outputs to** `specs/model-*.md`

---

## Instructions

You are creating a plan for a SwiftData @Model for data persistence.

---

## Pre-Flight: Context Check

### Check Architecture

If NOT in context: `.claude/swiftui/architecture.md`

❌ Architecture not loaded

Please run /prime first.

**Stop and ask user to run `/prime`.**

---

## Step 1: Analyze Model Requirements

Determine:
- What domain entity does this represent?
- What properties are needed?
- What relationships exist?
- Is this for persistence or just data transfer?

---

## Step 2: Generate Model Plan

Create plan in `specs/model-[name].md`

### Plan Template

# Model: [ModelName]

## Model Description

**Purpose:** [What domain entity this represents]

**Persistence:** [Persisted with SwiftData / Value type only]

**Relationships:**
- [Relationship 1]
- [Relationship 2]

## Model Definition

import SwiftData

@Model
final class [ModelName] {
    // MARK: - Properties

    var id: UUID
    var property1: Type
    var property2: Type
    var createdAt: Date
    var updatedAt: Date

    // MARK: - Relationships

    var relatedEntity: [RelatedModel]?

    // MARK: - Initialization

    init(property1: Type, property2: Type) {
        self.id = UUID()
        self.property1 = property1
        self.property2 = property2
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}

## Properties

**Core Properties:**
- `id: UUID` - Unique identifier
- `property1: Type` - [description]
- `property2: Type` - [description]

**Metadata:**
- `createdAt: Date` - When created
- `updatedAt: Date` - When last modified

**Relationships:**
- `relatedEntity: [RelatedModel]?` - [description]

## Implementation Plan

### Step 1: Create Model File

File: `Models/[ModelName].swift`

**Tasks:**
- [ ] Create model file
- [ ] Use @Model macro
- [ ] Define properties with proper types
- [ ] Define relationships
- [ ] Add initializer
- [ ] Add computed properties (if needed)

### Step 2: Configure Model Container

File: `[AppName]App.swift`

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [ModelName].self)
    }
}

**Tasks:**
- [ ] Add model to container
- [ ] Configure if needed (migration, etc.)

### Step 3: Query in Views

Example usage:

struct ListView: View {
    @Query private var items: [ModelName]

    var body: some View {
        List(items) { item in
            Text(item.property1)
        }
    }
}

**Query modifiers:**

// Sorted
@Query(sort: \.property1) private var items: [ModelName]

// Filtered
@Query(filter: #Predicate<ModelName> { item in
    item.property1 == value
}) private var items: [ModelName]

### Step 4: Add Computed Properties

[If needed]

extension [ModelName] {
    var computedProperty: Type {
        // Calculation based on stored properties
    }
}

**Tasks:**
- [ ] Add computed properties
- [ ] Keep calculations simple
- [ ] Complex logic goes in services

### Step 5: Add Sample Data

File: `Models/[ModelName]+Samples.swift`

extension [ModelName] {
    static var sample: [ModelName] {
        [ModelName](property1: value1, property2: value2)
    }

    static var samples: [[ModelName]] {
        [
            [ModelName](property1: value1, property2: value2),
            [ModelName](property1: value3, property2: value4),
        ]
    }
}

**Tasks:**
- [ ] Create sample data
- [ ] Use in previews
- [ ] Use in tests

## Validation

**Checklist:**
- [ ] Uses @Model macro
- [ ] Properties have correct types
- [ ] Relationships defined correctly
- [ ] Has initializer
- [ ] Minimal logic (use services for complex logic)
- [ ] Sample data created
- [ ] Works in previews

## Notes

**SwiftData Best Practices:**
- Keep models simple (data storage)
- Business logic in services
- Use @Query in views
- Use .modelContainer() at app level

---

## Arguments

$ARGUMENTS - Model name and description

**Usage:**

/model "Recipe with ingredients, instructions, and metadata"
/model "User with profile information and preferences"

---

**This generates SwiftData model plans for persistence.**
