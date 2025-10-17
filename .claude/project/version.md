# Version Strategy: Claude Commands Project

Version strategy for developing Claude Commands itself.

---

## Version Strategy

**Project:** Claude Commands

**Technology:** Markdown (command files) + Git

**Last Updated:** 2025-10-17

---

## Version Targets

### Current Version

**Version:** v1.0.0

**Status:** In development, nearing release

**Features:**
- Core commands (prime, feature, bug, chore)
- SwiftUI support
- Templates and examples
- Complete documentation

### Next Version

**Version:** v1.5.0

**Planned:** Q1 2026

**Features:**
- Additional examples (2-3 domains)
- Community feedback integration
- Improved documentation
- SwiftUI bug/chore handlers

---

## File Standards

### Markdown Commands

**Use these patterns:**

✅ **Clear Structure**
```markdown
# Command Name

Brief description.

---

## What This Does

1-3 sentences

---

## Instructions

Step-by-step for Claude
```

✅ **Descriptive Headers**
- Use "## Step 1: Verb Description"
- Not "## Step 1"

✅ **Code Examples**
````markdown
```language
// Code here
```
````

✅ **Consistent Terminology**
- "prime" not "primer" or "priming"
- "feature" not "feat"
- "context" not "content"

### Avoid These Patterns

❌ **Vague Instructions**
- Not: "Do something"
- Use: "Create specs/feature-[name].md with..."

❌ **Missing Examples**
- Always include concrete examples

❌ **Inconsistent Naming**
- Stick to established terms

---

## Command Patterns

### Pattern: Core Command

**Structure:**
1. Verify architecture loaded
2. Route to appropriate handler
3. Pass through arguments

**Example:** commands/core/feature.md

### Pattern: Router

**Structure:**
1. Detect technology
2. Route to technology handler
3. Pass arguments

**Example:** commands/routers/feature.md

### Pattern: Technology Handler

**Structure:**
1. Analyze request
2. Auto-load context (if needed)
3. Generate implementation plan
4. Output to specs/

**Example:** commands/swiftui/feature.md

---

## Git Conventions

### Commit Messages

**Format:**
```
type(scope): subject

body (optional)

footer (optional)
```

**Types:**
- `feat`: New feature/command
- `fix`: Bug fix
- `docs`: Documentation only
- `refactor`: Code restructuring

**Examples:**
```
feat(core): add bug command entry point

Add universal bug fix planner to commands/core/.
Routes to technology-specific handlers.

Closes #42
```

### Branch Naming

**Format:**
- Features: `feature/command-name`
- Fixes: `fix/issue-description`
- Docs: `docs/section-name`

**Examples:**
- `feature/react-support`
- `fix/prime-detection`
- `docs/customization-guide`

---

## Documentation Standards

### README.md

**Keep updated:**
- Command list
- Feature list
- Installation instructions
- Quick start guide

### CHANGELOG.md

**Update for every release:**
- Version number and date
- Added features
- Fixed bugs
- Breaking changes

### Architecture.md

**Update when:**
- System design changes
- New patterns added
- Flow changes

---

## Testing Strategy

### Manual Testing

**Before committing:**
1. Run `/prime` - verify detection
2. Run `/feature "test"` - verify routing
3. Check output in specs/
4. Verify no errors in command execution

### Dogfooding

**Use Claude Commands to develop Claude Commands:**
1. `/prime` - Load project context
2. `/feature "add new command"` - Plan features
3. `/bug "fix detection issue"` - Plan bug fixes
4. `/chore "refactor router logic"` - Plan refactors

---

## Release Process

### Pre-Release Checklist

- [ ] All commands tested
- [ ] Documentation updated
- [ ] CHANGELOG.md updated
- [ ] README.md accurate
- [ ] Examples working
- [ ] No broken symlinks
- [ ] Git status clean

### Version Numbering

**Semantic Versioning (MAJOR.MINOR.PATCH):**
- MAJOR: Breaking changes (v2.0.0)
- MINOR: New features (v1.5.0)
- PATCH: Bug fixes (v1.0.1)

**Examples:**
- v1.0.0: Initial release
- v1.1.0: Add React support
- v1.0.1: Fix prime detection bug

---

## Adding New Technologies

### Checklist

When adding React, Python, etc.:

1. **Create directory:** commands/[tech]/
2. **Create primer:** commands/[tech]/prime.md
3. **Create architecture:** commands/[tech]/architecture.md
4. **Create feature planner:** commands/[tech]/feature.md
5. **Update core/prime.md:** Add detection
6. **Update routers:** Add routing
7. **Test:** Verify detection and routing
8. **Document:** Update README, add examples

---

## Notes

- This version strategy is for Claude Commands project itself
- Use Claude Commands to develop Claude Commands (dogfooding)
- Keep commands simple and consistent
- Update documentation with every change
- Test thoroughly before committing
- Follow semantic versioning
