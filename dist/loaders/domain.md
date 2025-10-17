# Load Domain Knowledge

Manually loads domain knowledge context when needed.

**Philosophy:** On-demand loading for efficiency.

---

## What This Does

Loads full domain knowledge context (~8,000 tokens) into the conversation.

---

## When to Use

**Automatic loading:**
Most templates auto-load domain when needed:
- `/feature` - Auto-loads if domain keywords detected
- `/service` - Auto-loads for domain services
- `/bug` - Auto-loads for domain bugs

**Manual loading:**
Use `/domain` when:
- You want domain knowledge available before planning
- Auto-loading didn't trigger
- Working on domain-specific features
- Need to reference business rules

---

## Instructions

Load the full domain knowledge context.

---

## Step 1: Check if Domain Exists

[ -f ".claude/project/domain.md" ] && echo "Found" || echo "Not found"

**If not found:**

❌ Domain knowledge not found

No domain file exists at: .claude/project/domain.md

To create:
1. cp .claude/templates/domain-template.md .claude/project/domain.md
2. Edit with YOUR domain knowledge
3. Run /domain to load

See: .claude/docs/customization-guide.md

**Stop here.**

---

## Step 2: Load Domain Knowledge

📚 Loading domain knowledge...

Read: `.claude/project/domain.md`

---

## Step 3: Report Loaded Content

✅ Domain Knowledge Loaded

**Domain:** [domain name from file]

**Loaded (~8,000 tokens):**

**Core Concepts:**
- [list key concepts from file]

**Business Rules:**
- [count] rules loaded
- [list sample rules]

**Domain Calculations:**
- [list calculations/formulas]

**Domain Language:**
- [count] terms loaded
- Key terms: [list sample terms]

**Ready for domain-specific work!**

Apply these rules in feature implementations:
- Business rules: [examples]
- Calculations: [examples]
- Terminology: [examples]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Context: ~8,000 tokens loaded (4%)
Available: ~192,000 tokens remaining (96%)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

---

## Notes

- **On-demand** - Only load when needed
- **Manual override** - Use when auto-load doesn't trigger
- **Domain work** - Essential for domain-specific features
- **Larger** - ~4% of context window (worth it for domain work)

---

**This manually loads domain knowledge.**
