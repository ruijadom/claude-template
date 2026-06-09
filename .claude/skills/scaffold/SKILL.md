---
name: scaffold
description: Generate a new feature module inside src/modules/ following project conventions
allowed-tools: Bash(npm run build) Bash(npm test)
---

# /scaffold $ARGUMENTS

Generate a new feature module inside `src/modules/`.

The module name is provided as: $ARGUMENTS

## Steps

1. Read `CLAUDE.md` to confirm the current project conventions and module structure.
2. If `src/modules/` contains existing modules, read one to match established patterns (naming, imports, export style).
3. Create the module directory at `src/modules/$ARGUMENTS/` with this structure:

### components/

- Create `src/modules/$ARGUMENTS/components/index.ts` — empty barrel export with a placeholder comment.

### hooks/

- Create `src/modules/$ARGUMENTS/hooks/index.ts` — empty barrel export.

### requests/

- Create `src/modules/$ARGUMENTS/requests/index.ts` — empty barrel export.
- Create `src/modules/$ARGUMENTS/requests/$ARGUMENTS.queries.ts` with:
  - An import of the shared Axios instance from `src/api`
  - A sample `useQuery` hook scaffolded for this module's resource
  - Proper TypeScript types for the response

### store/

- Create `src/modules/$ARGUMENTS/store/slices/` directory.
- Create `src/modules/$ARGUMENTS/store/slices/$ARGUMENTS.slice.ts` with:
  - A Zustand slice using the `StateCreator` type
  - An interface for the slice state and actions
  - A `create...Slice` function following the slice pattern
- Create `src/modules/$ARGUMENTS/store/index.ts` with:
  - A bound store using `create()` that composes the slice(s)
  - Proper TypeScript typing for the combined store

### Module barrel export

- Create `src/modules/$ARGUMENTS/index.ts` that re-exports from:
  - `./components`
  - `./hooks`
  - `./requests`
  - `./store`

### Tests

- Create `src/modules/$ARGUMENTS/requests/$ARGUMENTS.queries.test.ts` with a vitest test skeleton for the query hooks.
- Create `src/modules/$ARGUMENTS/store/$ARGUMENTS.store.test.ts` with a vitest test skeleton for the store.

## Guidelines

- Use named exports everywhere — no default exports.
- Use TypeScript interfaces (not `type` aliases) for object shapes.
- Follow the naming conventions found in existing modules if any exist.
- Keep slice files minimal — one concern per slice.
- The bound store in `store/index.ts` must import and compose all slices.
- Query hooks must use the shared Axios instance from `src/api/`, never raw `fetch`.
- All barrel `index.ts` files must re-export everything from their submodules.

## Success Criteria

- The module follows the exact patterns from `CLAUDE.md` and existing modules.
- TypeScript compiles without errors (`npm run build`).
- Test skeletons run without failures (`npm test`).
- The module barrel export exposes all submodule APIs.
