# Claude Commands Architecture

This document describes the system design, command flow, and architectural decisions of Claude Commands.

---

## Overview

Claude Commands is a **command routing and context loading system** for Claude Code that enables:

- Technology detection and routing
- Lazy loading of project context
- Architecture pattern enforcement  
- Smart context management (< 5% of 200K token window)

**Core Principle:** Load minimal context, route intelligently, follow established patterns.

---

## Design Philosophy

### 1. Lazy Loading

**Problem:** Loading all context upfront is slow and wastes tokens.

**Solution:** Load only what's needed, when it's needed.

```
Prime: ~4.5K tokens (architecture + version + MCP)
  ↓
Feature (UI): +2K tokens (design system auto-loaded)
  ↓  
Feature (Domain): +5K tokens (domain knowledge auto-loaded)
  ↓
Total: ~4-12K tokens (2-6% of window)
```

### 2. Smart Routing

**Problem:** Different technologies need different patterns.

**Solution:** Universal entry points that route to technology-specific handlers.

```
/feature "add dark mode"
  ↓ [Universal entry point]
core/feature.md
  ↓ [Detect technology]
routers/feature.md
  ↓ [Route to SwiftUI]
swiftui/feature.md
  ↓ [Generate plan]
specs/feature-dark-mode.md
```

### 3. Architecture Enforcement

**Problem:** AI generates inconsistent code without guardrails.

**Solution:** Architecture patterns built into every command.

**Example:**
- SwiftUI: NO ViewModels (@Observable services instead)
- Design System: Token-based (no hardcoded values)
- Domain-Driven: Business logic in services

---

**For full architecture details, see this file at:**
https://github.com/yourusername/claude-commands/blob/main/ARCHITECTURE.md

Key sections:
- System Architecture (high-level design)
- Command Flow (step-by-step execution)
- Context Loading Strategy (lazy loading details)
- File Organization (directory structure)
- Extensibility (adding technologies/commands)
- Performance Considerations (token usage, speed)

---

**Questions?** See [docs/](docs/) or open an issue.
