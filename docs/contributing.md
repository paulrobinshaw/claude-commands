# Contributing to Claude Commands

Thank you for your interest in contributing! This document provides guidelines for contributing to Claude Commands.

---

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [How to Contribute](#how-to-contribute)
3. [Development Setup](#development-setup)
4. [Coding Standards](#coding-standards)
5. [Testing Guidelines](#testing-guidelines)
6. [Pull Request Process](#pull-request-process)
7. [Adding New Technologies](#adding-new-technologies)
8. [Documentation](#documentation)

---

## Code of Conduct

### Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

**Positive behavior:**
- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what is best for the community

**Unacceptable behavior:**
- Trolling, insulting/derogatory comments, personal or political attacks
- Public or private harassment
- Publishing others' private information
- Other conduct reasonably considered inappropriate

---

## How to Contribute

### Reporting Bugs

**Before submitting:**
1. Check existing issues
2. Try latest version
3. Gather reproduction steps

**Submit at:** https://github.com/yourusername/claude-commands/issues

**Include:**
- Clear title and description
- Steps to reproduce
- Expected vs. actual behavior
- Environment (OS, Claude version, project type)
- Relevant logs or screenshots

### Suggesting Features

**Before submitting:**
1. Check existing feature requests
2. Consider if it fits project scope
3. Think about implementation

**Submit at:** https://github.com/yourusername/claude-commands/discussions

**Include:**
- Clear use case
- Why it's valuable
- Potential implementation approach
- Examples from other projects (optional)

### Improving Documentation

Documentation improvements are always welcome!

**Areas needing help:**
- Clarifying confusing sections
- Adding examples
- Fixing typos
- Translating (future)

**Process:**
1. Fork repository
2. Make changes
3. Submit pull request

---

## Development Setup

### Prerequisites

- Git
- A project using SwiftUI (for testing)
- Claude Code (for testing commands)

### Setup Steps

1. **Fork and clone:**
   ```bash
   git clone https://github.com/yourusername/claude-commands.git
   cd claude-commands
   ```

2. **Create feature branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Set up test project:**
   ```bash
   # In a separate directory
   mkdir test-project
   cd test-project
   # Create test SwiftUI project
   # Link to your claude-commands fork
   ln -s path/to/your/claude-commands .claude-commands
   mkdir -p .claude/commands
   cd .claude/commands
   ln -s ../../.claude-commands/commands/core/prime.md prime
   ln -s ../../.claude-commands/commands/core/feature.md feature
   ```

4. **Make changes**

5. **Test changes:**
   ```
   # In test project
   /prime
   /feature "test feature"
   ```

6. **Commit and push:**
   ```bash
   git add .
   git commit -m "feat: your feature description"
   git push origin feature/your-feature-name
   ```

7. **Create pull request**

---

## Coding Standards

### Markdown Commands

**File naming:**
- Use kebab-case: `feature-planner.md` (NOT `FeaturePlanner.md`)
- Be descriptive: `swiftui-feature.md` (NOT `feature.md` in swiftui/)
- Use `.md` extension

**Structure:**
```markdown
# Title

Brief description.

---

## What This Does

1-3 sentences

---

## Instructions

Step-by-step instructions for Claude

---

## Step 1: [Name]

Details...

---

## Notes

- Implementation notes
- Edge cases
- Future improvements
```

**Writing style:**
- Be concise and clear
- Use active voice
- Include examples
- Think step-by-step
- Assume Claude will follow literally

### Code Examples

**In markdown:**
````markdown
```swift
// SwiftUI example
@Observable
class RecipeService {
    var recipes: [Recipe] = []
}
```
````

**Best practices:**
- Use syntax highlighting
- Include imports
- Show complete examples
- Add inline comments

---

## Testing Guidelines

### Manual Testing

**Before submitting PR:**

1. **Prime test:**
   ```
   /prime
   ```
   - Verify technology detection
   - Check context loading
   - Confirm customization detection

2. **Feature test:**
   ```
   /feature "add user authentication"
   ```
   - Verify plan generation
   - Check architecture compliance
   - Confirm output location

3. **Domain test (if applicable):**
   ```
   /feature "add recipe scaling"
   ```
   - Verify domain loading
   - Check domain usage in plan

4. **Error handling test:**
   ```
   /feature   # No description
   ```
   - Verify error message
   - Check graceful handling

### Test Checklist

- [ ] Commands execute without errors
- [ ] Output is properly formatted
- [ ] Architecture patterns followed
- [ ] Design system tokens used (if applicable)
- [ ] Domain knowledge applied (if applicable)
- [ ] Error messages are helpful
- [ ] Performance is acceptable (< 5 seconds)

---

## Pull Request Process

### Before Submitting

1. **Test thoroughly** (see Testing Guidelines)
2. **Update documentation** (if needed)
3. **Write clear commit messages**
4. **Rebase on latest main**

### Commit Message Format

Use conventional commits:

```
type(scope): subject

body (optional)

footer (optional)
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code change that neither fixes bug nor adds feature
- `test`: Adding missing tests
- `chore`: Changes to build process or tools

**Examples:**
```
feat(swiftui): add component template for list views

Add template for SwiftUI list views with:
- Lazy loading
- Pull to refresh
- Empty state handling

Closes #123
```

```
fix(prime): handle missing .claude directory gracefully

Previously crashed with unclear error when .claude/ missing.
Now provides helpful error message with setup instructions.
```

### PR Description Template

```markdown
## Description
[What does this PR do?]

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Refactoring
- [ ] Other (describe):

## Testing Done
[How did you test this?]

## Checklist
- [ ] Tested manually
- [ ] Updated documentation
- [ ] Added examples (if needed)
- [ ] Commit messages follow convention
- [ ] Ready for review
```

### Review Process

1. **Automated checks** (when available)
2. **Maintainer review** (1-3 days)
3. **Address feedback**
4. **Approval and merge**

---

## Adding New Technologies

Want to add React or Python support? Here's how:

### Step 1: Create Technology Directory

```bash
mkdir commands/[technology]
```

### Step 2: Create Primer

`commands/[technology]/prime.md`:
- Detect technology
- Load architecture
- Report customization

### Step 3: Create Architecture

`commands/[technology]/architecture.md`:
- Define patterns
- Document conventions
- Provide examples

### Step 4: Create Feature Planner

`commands/[technology]/feature.md`:
- Smart context loading
- Plan generation
- Architecture enforcement

### Step 5: Update Core

Add detection to `commands/core/prime.md`:
```markdown
### [Technology] Detection
[detection commands]

If found → Route to commands/[technology]/prime.md
```

### Step 6: Update Router

Add routing to `commands/routers/feature.md`:
```markdown
### If [Technology]
Execute: commands/[technology]/feature.md
```

### Step 7: Test

Create test project and verify:
- Detection works
- Routing works
- Plans generate correctly

### Step 8: Document

- Update README.md
- Add examples
- Update ARCHITECTURE.md

---

## Documentation

### What Needs Documentation

**New features:**
- README.md (user-facing)
- ARCHITECTURE.md (system design)
- Relevant docs/ files

**New technologies:**
- Complete documentation set
- Examples
- Migration guides (if breaking)

**Bug fixes:**
- CHANGELOG.md
- Related docs (if behavior changed)

### Documentation Standards

**Be clear:**
- Simple language
- Short sentences
- Active voice

**Be complete:**
- Include examples
- Cover edge cases
- Explain "why" not just "how"

**Be consistent:**
- Use same terminology
- Follow existing format
- Match code examples to reality

---

## Questions?

- **Discussions:** https://github.com/yourusername/claude-commands/discussions
- **Issues:** https://github.com/yourusername/claude-commands/issues
- **Email:** support@example.com

---

**Thank you for contributing!** 🎉
