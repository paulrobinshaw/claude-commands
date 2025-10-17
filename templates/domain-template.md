# Domain Knowledge Template

**INSTRUCTIONS:** Copy this template to `.claude/project/domain.md` and customize for your project's domain.

---

## Domain Knowledge

**Project:** [Your Project Name]

**Domain:** [e.g., E-commerce, Healthcare, Finance, Education, etc.]

**Last Updated:** [YYYY-MM-DD]

---

## Domain Overview

**Purpose:** [One paragraph describing what this project does and the problem domain it addresses]

**Key Concepts:** [List 3-5 core concepts that are fundamental to this domain]
1. [Concept 1]
2. [Concept 2]
3. [Concept 3]

**Target Users:** [Describe who uses this application]
- [User type 1]: [Description]
- [User type 2]: [Description]

---

## Domain Entities

### Entity 1: [Entity Name]

**Description:** [What this entity represents in the business domain]

**Properties:**
- `property1` (Type): [Description, validation rules, constraints]
- `property2` (Type): [Description, validation rules, constraints]
- `property3` (Type): [Description, validation rules, constraints]

**Relationships:**
- [Relationship to other entities, e.g., "One User has many Orders"]

**Business Rules:**
1. [Rule 1, e.g., "Email must be unique"]
2. [Rule 2, e.g., "Name is required"]
3. [Rule 3, e.g., "Status can only transition from A to B"]

**Example:**
```
[Concrete example of this entity with real values]
```

**Validation:**
- [Validation rule 1]
- [Validation rule 2]

---

### Entity 2: [Entity Name]

**Description:** [What this entity represents in the business domain]

**Properties:**
- `property1` (Type): [Description]
- `property2` (Type): [Description]

**Relationships:**
- [Relationships to other entities]

**Business Rules:**
1. [Rule 1]
2. [Rule 2]

**Example:**
```
[Concrete example]
```

**Validation:**
- [Validation rules]

---

[Add more entities as needed]

---

## Domain Calculations

### Calculation 1: [Calculation Name]

**Purpose:** [What this calculation does and why it's needed]

**Formula:**
```
[Mathematical formula or pseudocode]
```

**Inputs:**
- `input1` - [Description, units, range]
- `input2` - [Description, units, range]

**Output:**
- `output` - [Description, units, range]

**Example:**

Input: [Example inputs]
Calculation: [Step-by-step calculation]
Output: [Expected output]

**Edge Cases:**
- [Edge case 1 and how to handle it]
- [Edge case 2 and how to handle it]

**Validation:**
- [Input validation rules]
- [Output validation rules]

---

### Calculation 2: [Calculation Name]

**Purpose:** [Description]

**Formula:**
```
[Formula]
```

**Inputs:**
- [Inputs]

**Output:**
- [Output]

**Example:**
[Example with concrete numbers]

**Edge Cases:**
- [Edge cases]

---

[Add more calculations as needed]

---

## Domain Language

### Key Terms

**[Term 1]**
- **Definition:** [Clear, concise definition]
- **Context:** [When and how this term is used]
- **Example:** [Real-world example]

**[Term 2]**
- **Definition:** [Definition]
- **Context:** [Context]
- **Example:** [Example]

**[Term 3]**
- **Definition:** [Definition]
- **Context:** [Context]
- **Example:** [Example]

[Add 10-20 key domain terms]

---

### Acronyms and Abbreviations

**[ACRONYM]** - [Full Name]
- **Meaning:** [What it stands for]
- **Usage:** [How it's used in the domain]

**[ACRONYM]** - [Full Name]
- **Meaning:** [What it stands for]
- **Usage:** [How it's used]

[Add all common acronyms]

---

## Domain Workflows

### Workflow 1: [Workflow Name]

**Purpose:** [What this workflow accomplishes]

**Steps:**

1. **[Step 1 Name]**
   - Input: [What's needed for this step]
   - Action: [What happens]
   - Output: [Result of this step]
   - Example: [Concrete example]

2. **[Step 2 Name]**
   - Input: [What's needed]
   - Action: [What happens]
   - Output: [Result]
   - Example: [Example]

3. **[Step 3 Name]**
   - Input: [What's needed]
   - Action: [What happens]
   - Output: [Result]
   - Example: [Example]

[Continue for all steps in workflow]

**Success Criteria:**
- [What defines successful completion]

**Error Handling:**
- If [condition], then [action]
- If [condition], then [action]

---

### Workflow 2: [Workflow Name]

**Purpose:** [Description]

**Steps:**
[List all steps]

**Success Criteria:**
[Success conditions]

**Error Handling:**
[Error scenarios]

---

[Add more workflows as needed]

---

## Data Validation Rules

### Validation 1: [Field/Entity Name]

**Field:** [Field being validated]

**Rules:**
- [Rule 1, e.g., "Must not be empty"]
- [Rule 2, e.g., "Must match pattern X"]
- [Rule 3, e.g., "Must be within range Y"]

**Error Messages:**
- [Condition] → "[User-friendly error message]"
- [Condition] → "[User-friendly error message]"

**Example:**
- ✅ Valid: [Valid example]
- ❌ Invalid: [Invalid example] → "[Error message]"

---

### Validation 2: [Field/Entity Name]

**Field:** [Field name]

**Rules:**
- [Validation rules]

**Error Messages:**
- [Error messages]

**Example:**
- ✅ Valid: [Example]
- ❌ Invalid: [Example]

---

[Add more validation rules as needed]

---

## Domain Constraints

### Constraint 1: [Constraint Name]

**Constraint:** [Description of the constraint]

**Applies To:** [What entities/operations this affects]

**Rationale:** [Why this constraint exists]

**Enforcement:** [How this is enforced in code/database]

---

### Constraint 2: [Constraint Name]

**Constraint:** [Description]

**Applies To:** [Scope]

**Rationale:** [Why]

**Enforcement:** [How]

---

[Add more constraints as needed]

---

## Domain Standards

### Standard 1: [Standard Name]

**Standard:** [Description of the standard]

**Reasoning:** [Why this standard is in place]

**Implementation:** [How to implement this in code]

**Example:**
- Input: [Example input]
- Output: [Example output following standard]

---

### Standard 2: [Standard Name]

**Standard:** [Description]

**Reasoning:** [Why]

**Implementation:** [How]

**Example:**
- [Example]

---

[Add more standards as needed]

---

## Business Logic Examples

### Example 1: [Scenario Name]

**Scenario:** [Describe a common business scenario]

**Given:**
- [Precondition 1]
- [Precondition 2]

**When:**
- [Action taken]

**Then:**
- [Expected result 1]
- [Expected result 2]

**Code Reference:** [Link to relevant code file:line]

---

### Example 2: [Scenario Name]

**Scenario:** [Description]

**Given:**
- [Preconditions]

**When:**
- [Action]

**Then:**
- [Results]

**Code Reference:** [File:line]

---

[Add more examples as needed]

---

## Domain-Specific Patterns

### Pattern 1: [Pattern Name]

**Pattern:** [Name of the domain-specific pattern]

**When to Use:** [Situations where this pattern applies]

**How to Implement:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Example:**
```
[Code or pseudocode example]
```

**Benefits:**
- [Benefit 1]
- [Benefit 2]

---

### Pattern 2: [Pattern Name]

**Pattern:** [Description]

**When to Use:** [When]

**How to Implement:**
[Steps]

**Example:**
[Example]

**Benefits:**
- [Benefits]

---

## API/Integration Contracts

### External Service 1: [Service Name]

**Purpose:** [What this external service provides]

**Endpoint:** [URL or description]

**Authentication:** [How to authenticate]

**Request Format:**
```
[Example request]
```

**Response Format:**
```
[Example response]
```

**Error Handling:**
- [Error code 1]: [How to handle]
- [Error code 2]: [How to handle]

**Rate Limits:** [Description of rate limits]

---

### External Service 2: [Service Name]

**Purpose:** [Description]

**Endpoint:** [URL]

**Authentication:** [Method]

**Request/Response:**
[Formats]

**Error Handling:**
[Errors]

---

## State Machines

### State Machine 1: [Entity Name] Lifecycle

**States:**
- `[State1]`: [Description]
- `[State2]`: [Description]
- `[State3]`: [Description]

**Transitions:**
- `[State1]` → `[State2]`: When [condition]
- `[State2]` → `[State3]`: When [condition]
- `[State2]` → `[State1]`: When [condition] (rollback)

**Invalid Transitions:**
- `[State1]` → `[State3]`: ❌ Cannot skip State2
- `[State3]` → `[State1]`: ❌ Cannot reverse

**Example Flow:**
```
[State1] → [action] → [State2] → [action] → [State3] (completed)
```

---

### State Machine 2: [Entity Name] Lifecycle

**States:**
[List states]

**Transitions:**
[List valid transitions]

**Invalid Transitions:**
[List invalid transitions]

**Example Flow:**
[Example]

---

## Regulatory/Compliance Requirements

### Requirement 1: [Regulation Name]

**Regulation:** [Name of law/standard, e.g., GDPR, HIPAA, PCI-DSS]

**Requirement:** [Specific requirement]

**Implementation:** [How this is implemented in the application]

**Validation:** [How to verify compliance]

---

### Requirement 2: [Regulation Name]

**Regulation:** [Name]

**Requirement:** [Description]

**Implementation:** [How implemented]

**Validation:** [How verified]

---

## Common Pitfalls

### Pitfall 1: [Pitfall Name]

**Problem:** [Description of common mistake]

**Why It Happens:** [Explanation]

**How to Avoid:**
1. [Step 1]
2. [Step 2]

**Correct Approach:**
```
[Example of correct code/logic]
```

---

### Pitfall 2: [Pitfall Name]

**Problem:** [Description]

**Why It Happens:** [Explanation]

**How to Avoid:**
[Steps]

**Correct Approach:**
[Example]

---

## Domain Resources

**Documentation:**
- [Link to external domain documentation]
- [Link to industry standards]

**Tools:**
- [Domain-specific calculation tools]
- [Validation tools]

**References:**
- [Book/article references]
- [API documentation]

---

## Glossary

Quick reference of all domain terms:

| Term | Definition | See Also |
|------|------------|----------|
| [Term 1] | [Short definition] | [Related terms] |
| [Term 2] | [Short definition] | [Related terms] |
| [Term 3] | [Short definition] | [Related terms] |

[Add all important terms in alphabetical order]

---

## Notes

- This domain knowledge is specific to [Project Name]
- Update when business rules change
- Consult domain experts when unclear
- Run `/prime` after updates to reload domain knowledge
- Keep examples concrete and realistic
- Link to actual code implementations where possible
