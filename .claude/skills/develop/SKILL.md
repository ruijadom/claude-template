---
name: develop
description: Execute the project's PROMPT.md spec with full design and quality standards applied
allowed-tools: Bash(npm run build) Bash(npm test) Bash(npm run dev) Bash(npm run lint)
---

# /develop $ARGUMENTS

Execute the project's PROMPT.md spec with full design and quality standards applied.

## Context Files

Before starting any implementation, read and internalize these files:

1. **PROMPT.md** (root) — the feature spec to implement
2. **CLAUDE.md** — project conventions and module structure

## Workflow

1. Read `PROMPT.md` to understand the full spec.
2. Review `CLAUDE.md` for project structure and conventions.
3. Plan the implementation.
4. Implement the spec applying:
   - **Accessibility**: semantic HTML, ARIA labels, keyboard navigability, focus management.
   - **Testing**: create test files, cover happy path + edge cases, use vitest/Playwright as appropriate.
   - **Frontend Design**: distinctive typography, cohesive color systems, orchestrated motion, micro-interactions, proper layout/spacing.
   - **Project Conventions**: module structure, barrel exports, Zustand slices, React Query patterns.
5. Run `npm run build` to verify TypeScript compiles.
6. Run `npm test` to verify tests pass.
7. If a dev server is needed, run `npm run dev` and verify in the browser.

## Arguments

If $ARGUMENTS is provided, use it to narrow focus:
- A section name from PROMPT.md to implement only that part
- "iterate" + description to apply an iteration idea from the spec
- Empty to implement the full spec

## Quality Gate

Before reporting completion, verify:
- [ ] All interactive elements have ARIA labels and keyboard support
- [ ] New files have corresponding test files
- [ ] TypeScript compiles without errors
- [ ] Tests pass
