# Global Project Prompt

## Memory Management

This project uses two memory systems:

1. **Root `claude.md`** (version-controlled, git)
   - Team-shared project knowledge
   - Stable architecture decisions and conventions
   - Onboarding information
   - **When to use:** Read at start of session, update when discovering stable facts worth version controlling

2. **Serena's memory** (local, `.serena/memories/`, not versioned)
   - Personal work-in-progress notes
   - Temporary debugging context
   - Exploratory findings that may change
   - **When to use:** `mcp__serena__write_memory` for quick personal notes

**Decision Guide:**
- Found a team convention or architectural pattern? → Root `claude.md`
- Debugging something complex or taking temporary notes? → Serena's memory
- Not sure? → Serena's memory first, promote to root `claude.md` later if it proves valuable

**Important:** Always read root `claude.md` at the start of a session to understand project context.

## Library Documentation (Context7)

Proactively fetch library documentation when:

- You encounter library code you're not confident about
- User asks you to implement features using libraries not in your training data
- You detect imports/usage of libraries where you need to verify current API patterns
- Before suggesting code that relies on specific library methods

Always fetch docs BEFORE writing code with libraries, not after encountering errors.
