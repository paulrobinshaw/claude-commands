# Load Design System

**File Type:** Loader Command
**Reads:** `.claude/project/design-system.md` (your project-specific design tokens)
**Usage:** `/design-system` (or `/ds`) to manually load, or auto-loads for UI features
**Edit this file:** Only if modifying command logic (rarely)
**Edit knowledge file:** `.claude/project/design-system.md` for your design customization

---

Manually loads design system context when needed.

**Philosophy:** On-demand loading for efficiency.

---

## What This Does

Loads full design system context (~2,000 tokens) into the conversation.

---

## When to Use

**Automatic loading:**
Most templates auto-load design system when needed:
- `/feature` - Auto-loads for UI features
- `/component` - Always auto-loads
- `/bug` - Auto-loads for UI bugs

**Manual loading:**
Use `/ds` when:
- You want design system available before planning
- Working on design system itself
- Auto-loading didn't trigger
- Reviewing design system tokens

---

## Instructions

Load the full design system context.

---

## Step 1: Check if Design System Exists

[ -f ".claude/project/design-system.md" ] && echo "Found" || echo "Not found"

**If not found:**

❌ Design system not found

No design system file exists at: .claude/project/design-system.md

To create:
1. cp .claude/templates/design-system-template.md .claude/project/design-system.md
2. Edit with YOUR design tokens
3. Run /ds to load

See: .claude/docs/customization-guide.md

**Stop here.**

---

## Step 2: Load Design System

📚 Loading design system...

Read: `.claude/project/design-system.md`

---

## Step 3: Report Loaded Content

✅ Design System Loaded

**Design System Name:** [name from file]

**Loaded (~2,000 tokens):**

**Color Tokens:**
- Semantic colors: [count]
- State colors: [count]
- UI colors: [count]

**Typography Tokens:**
- Font styles: [count]
- Type scale: [hierarchy]

**Spacing Tokens:**
- Spacing scale: .space1 through .space[n]

**Components:**
- Available components: [count]
- Component list: [list]

**Ready for UI work!**

Use these tokens in all UI code:
- Colors: Color.[token]
- Typography: Font.[token]
- Spacing: .padding(.space[n])
- Components: [ComponentName]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Context: ~2,000 tokens loaded (1%)
Available: ~198,000 tokens remaining (99%)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

---

## Notes

- **On-demand** - Only load when needed
- **Manual override** - Use when auto-load doesn't trigger
- **Design work** - Essential for UI implementation
- **Efficient** - Only ~1% of context window

---

**This manually loads design system tokens.**
