# Claude Commands

**Production-ready command templates for Claude Code** that follow modern architecture patterns and enable consistent, high-quality code generation.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/yourusername/claude-commands)

---

## What is This?

Claude Commands is a collection of **slash command templates** for [Claude Code](https://claude.ai/claude-code) that help you:

- =Ë **Plan features** with architecture patterns built-in
- <¯ **Maintain consistency** across your codebase
- =€ **Move faster** with smart context loading
- =Ú **Document domain knowledge** for AI-assisted development
- <¨ **Enforce design systems** automatically

**Philosophy:** Load minimal context, follow established patterns, generate high-quality code.

---

## Features

### <¯ Smart Commands

- `/prime` - Load project context in < 2 seconds (~4.5K tokens)
- `/feature` - Plan features with auto-loading design system & domain knowledge
- `/bug` - Plan bug fixes with root cause analysis
- `/chore` - Plan refactors and maintenance tasks

### <× Architecture Enforcement

- **SwiftUI:** NO ViewModels pattern (@Observable services)
- **Design System:** Token-based, no hardcoded values
- **Domain-Driven:** Business logic in services, not views
- **Type-Safe:** Full type checking and validation

### ¡ Lazy Loading

- Architecture: ~3K tokens (always loaded)
- Design System: ~2K tokens (auto-loads for UI features)
- Domain Knowledge: ~5K tokens (auto-loads for business logic)
- **Total: ~4-10K tokens** (2-5% of Claude's 200K context window)

### =' Fully Customizable

- **Templates** for design system, domain knowledge, version strategy, MCP config
- **Examples** showing real-world customization (professional baking app)
- **Technology-agnostic** core with SwiftUI implementation (React/Python coming soon)

---

## Quick Start

### Installation

**Option 1: Git Submodule (Recommended)**

```bash
# In your project root
git submodule add https://github.com/yourusername/claude-commands .claude-commands

# Set up .claude directory
mkdir -p .claude/commands
cd .claude/commands
ln -s ../../.claude-commands/commands/core/prime.md prime
ln -s ../../.claude-commands/commands/core/feature.md feature
ln -s ../../.claude-commands/commands/routers/bug.md bug
ln -s ../../.claude-commands/commands/routers/chore.md chore
```

**Option 2: Direct Copy**

```bash
# Clone the repository
git clone https://github.com/yourusername/claude-commands.git

# Copy to your project
cp -r claude-commands/.claude your-project/.claude
```

### First Use

1. **Prime your project** (run once per session):
   ```
   /prime
   ```

2. **Plan a feature**:
   ```
   /feature "add user authentication with email and password"
   ```

3. **Implement from the plan**:
   ```
   /implement specs/feature-user-authentication.md
   ```

That's it! Claude will follow your architecture patterns automatically.

---

## Commands

### `/prime` - Load Project Context

**What it does:**
- Detects project type (SwiftUI, React, Python)
- Loads architecture patterns
- Checks for customization (design system, domain, version, MCP)
- Reports what's available

**Usage:**
```
/prime
```

**Output:**
```
 Project primed successfully

Technology: SwiftUI
Architecture: Loaded (~3K tokens)
Design System: Available (lazy load)
Domain Knowledge: Available (lazy load)
Version Strategy: Loaded (~500 tokens)
MCP Config: Loaded (~500 tokens)

Total context: ~4,500 tokens (2% of window)
```

**Speed:** < 2 seconds

---

### `/feature` - Plan a Feature

**What it does:**
- Auto-loads design system (if UI feature)
- Auto-loads domain knowledge (if business logic)
- Generates architecture-compliant plan
- Outputs to `specs/feature-*.md`

**Usage:**
```
/feature "add dark mode toggle to settings"
/feature "add recipe scaling with baker's percentages"
/feature "add user profile screen with avatar upload"
```

**Output:** `specs/feature-[name].md` with:
- Feature overview
- User stories
- Architecture decisions
- Component breakdown
- Implementation steps
- Testing strategy

**Context:** 0-10K tokens (depends on feature type)

---

### `/bug` - Plan a Bug Fix

**What it does:**
- Analyzes the issue
- Identifies root cause
- Generates fix plan with steps
- Outputs to `specs/bug-*.md`

**Usage:**
```
/bug "login fails when email contains plus sign"
/bug "app crashes on iPad in landscape mode"
```

**Output:** `specs/bug-[name].md` with:
- Issue description
- Root cause analysis
- Fix strategy
- Implementation steps
- Testing verification

---

### `/chore` - Plan a Refactor/Chore

**What it does:**
- Plans refactoring or maintenance
- Identifies files to modify
- Generates step-by-step plan
- Outputs to `specs/chore-*.md`

**Usage:**
```
/chore "refactor authentication to use new OAuth API"
/chore "update to iOS 18 minimum version"
```

**Output:** `specs/chore-[name].md` with:
- Chore overview
- Files to modify
- Step-by-step plan
- Testing strategy

---

## Customization

Claude Commands is designed to be **fully customizable** for your project.

### 1. Design System (Optional)

Define your colors, typography, spacing, etc.

```bash
# Copy template
cp templates/design-system-template.md .claude/project/design-system.md

# Customize for your brand
# - Add your color palette
# - Define typography scale
# - Document spacing system
# - etc.
```

**When loaded:** Automatically for UI features (keywords: screen, view, button, card, etc.)

**Example:** See `examples/baking-app/design-system.md` for metric colors and baking-specific UI

---

### 2. Domain Knowledge (Optional)

Document your business domain - entities, calculations, workflows, validation rules.

```bash
# Copy template
cp templates/domain-template.md .claude/project/domain.md

# Document your domain
# - Define entities (User, Order, Recipe, etc.)
# - Add calculations (tax, shipping, percentages)
# - Document workflows (checkout, approval, etc.)
# - Add validation rules
```

**When loaded:** Automatically for domain features (your custom keywords + calculation, formula, etc.)

**Example:** See `examples/baking-app/domain.md` for baker's percentages and formulas

---

### 3. Version Strategy (Optional)

Define minimum versions, patterns to use/avoid, migration strategy.

```bash
# Copy template
cp templates/version-template.md .claude/project/version.md

# Define your strategy
# - Set minimum supported version
# - List patterns to use ()
# - List patterns to avoid (L)
# - Document migration path
```

**When loaded:** Always (small file, ~500 tokens)

**Example:** See `examples/baking-app/version.md` for iOS 17+ with @Observable pattern

---

### 4. MCP Configuration (Optional)

Configure build/test/git automation (Model Context Protocol).

```bash
# Copy template
cp templates/mcp-template.md .claude/project/mcp.md

# Configure for your build system
# - Add build commands (Xcode, Gradle, npm)
# - Add test commands
# - Add pre-commit validation
```

**When loaded:** Always (small file, ~500 tokens)

**Example:** See `examples/baking-app/mcp.md` for XcodeBuildMCP with architecture validation

---

## Architecture

### Command Flow

```
User: /feature "add dark mode"
  “
commands/core/feature.md (entry point)
  “ (check if primed)
commands/routers/feature.md (detect technology)
  “ (route to SwiftUI)
commands/swiftui/feature.md (SwiftUI-specific planner)
  “ (detect UI keywords)
commands/loaders/design-system.md (auto-load design system)
  “
Generate plan ’ specs/feature-dark-mode.md
```

### Context Loading Strategy

**Lazy Loading:**
- Core architecture: Always loaded (~3K tokens)
- Design system: Loaded only for UI features (~2K tokens)
- Domain knowledge: Loaded only for business logic (~5K tokens)
- Version/MCP: Always loaded (~1K tokens)

**Benefits:**
- Fast (< 2 seconds for prime)
- Efficient (< 5% of context window)
- Smart (only loads what's needed)

**See:** `ARCHITECTURE.md` for detailed system design

---

## Examples

### Professional Baking App

Complete example showing customization for a professional baking application:

**Features:**
- Metric colors for visualizing baker's percentages (flour, water, salt, yeast)
- Domain knowledge for baker's percentages and formulas
- iOS 17+ version strategy with @Observable pattern
- XcodeBuildMCP configuration with pre-commit validation

**Location:** `examples/baking-app/`

**Files:**
- `design-system.md` - Metric colors and baking UI components
- `domain.md` - Baker's percentages, formulas, calculations, workflows
- `version.md` - iOS 17+ strategy, patterns to use/avoid
- `mcp.md` - XcodeBuildMCP with architecture compliance checks
- `README.md` - Complete explanation of customization decisions

**Use this as a reference** when customizing for your own project.

---

## Supported Technologies

###  SwiftUI (v1.0)

Full support:
- Architecture patterns (NO ViewModels, @Observable services)
- Component templates (views, services, models)
- Context loaders (design system, domain)
- Version strategy (iOS 17+)

### =§ React (Coming in v2.0)

Planned:
- Component-based architecture
- Hook patterns
- State management
- Testing templates

### =§ Python (Coming in v2.0)

Planned:
- Module structure
- Class/function templates
- Type hints
- Testing templates

---

## Documentation

- **[Getting Started](docs/getting-started.md)** - Step-by-step setup guide
- **[Customization Guide](docs/customization-guide.md)** - How to customize for your project
- **[Architecture](ARCHITECTURE.md)** - System design and command flow
- **[Contributing](docs/contributing.md)** - How to contribute
- **[Changelog](CHANGELOG.md)** - Version history

---

## Why Claude Commands?

### Before Claude Commands

```
User: "Add dark mode"
Claude: "I'll add dark mode. Here's the code:"
  ’ Hardcoded colors: Color(red: 0.2, green: 0.3, blue: 0.5)
  ’ Random patterns: ObservableObject ViewModel
  ’ Inconsistent: Every feature looks different
  ’ No tests: "I'll leave testing to you"
```

### After Claude Commands

```
User: /feature "add dark mode"
Claude:
   Auto-loaded design system
   Using DS.Colors.* tokens
   Following @Observable pattern
   Generating comprehensive plan with tests

Output: specs/feature-dark-mode.md
  - Architecture-compliant
  - Design system enforced
  - Testing included
  - Ready to implement
```

### Benefits

1. **Consistency** - Every feature follows the same patterns
2. **Quality** - Architecture patterns built-in
3. **Speed** - Lazy loading keeps context small
4. **Documentation** - Domain knowledge captured
5. **Enforcement** - Design system tokens required

---

## Requirements

- **Claude Code** - Claude 3.5 Sonnet or later
- **Git** - For installation and version control
- **Project** - Using a supported technology (SwiftUI v1.0, React/Python coming soon)

---

## Project Structure

```
claude-commands/
   README.md                  You are here
   ARCHITECTURE.md            System design
   CHANGELOG.md               Version history
   LICENSE                    MIT License

   .claude/                   Configuration for this repo
      commands/              Symlinks to commands
         prime
         feature
         bug
         chore
      project/               (empty - for users to customize)

   commands/                  Command templates
      core/                  Core commands (prime, feature)
      routers/               Technology routing
      loaders/               Context loaders
      swiftui/               SwiftUI-specific commands

   templates/                 Customization templates
      design-system-template.md
      domain-template.md
      version-template.md
      mcp-template.md

   examples/                  Example customizations
      baking-app/            Professional baking app example
          README.md
          design-system.md
          domain.md
          version.md
          mcp.md

   docs/                      Documentation
       getting-started.md
       customization-guide.md
       contributing.md
```

---

## Contributing

We welcome contributions! See [CONTRIBUTING.md](docs/contributing.md) for:
- How to report bugs
- How to suggest features
- How to submit pull requests
- Coding standards
- Testing guidelines

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Roadmap

### v1.0 (Current) - SwiftUI Foundation
-  Core commands (prime, feature, bug, chore)
-  SwiftUI architecture patterns
-  Context loaders (design system, domain)
-  Templates and examples
-  Complete documentation

### v1.5 (Q1 2025) - Polish & Community
- [ ] Community feedback integration
- [ ] More examples (2-3 different domains)
- [ ] Video tutorials
- [ ] VS Code extension

### v2.0 (Q2 2025) - Multi-Technology
- [ ] React support
- [ ] Python support
- [ ] Technology auto-detection improvements
- [ ] Shared patterns across technologies

### v3.0 (Q3 2025) - Advanced Features
- [ ] AI-powered refactoring
- [ ] Automated testing generation
- [ ] Performance optimization suggestions
- [ ] Security best practices enforcement

---

## Support

- **Issues:** [GitHub Issues](https://github.com/yourusername/claude-commands/issues)
- **Discussions:** [GitHub Discussions](https://github.com/yourusername/claude-commands/discussions)
- **Email:** support@example.com

---

## Acknowledgments

- Built for [Claude Code](https://claude.ai/claude-code) by Anthropic
- Inspired by modern SwiftUI architecture patterns
- Template system design influenced by Rails generators and Create React App

---

## Star History

If you find Claude Commands useful, please P star the repo!

[![Star History Chart](https://api.star-history.com/svg?repos=yourusername/claude-commands&type=Date)](https://star-history.com/#yourusername/claude-commands&Date)

---

**Made with d for developers who want consistent, high-quality AI-assisted development.**

Happy coding! <‰
