# CLAUDE.md

## Tech Stack

- **React 19** with **TypeScript**
- **Vite** — build tool and dev server
- **Tailwind CSS** — utility-first styling
- **Vitest** — unit and integration tests
- **Playwright** — end-to-end tests
- **React Query (TanStack Query)** — server state management
- **Zustand** — client state management
- **Axios** — HTTP client

## Project Structure

```
src/
├── api/              # Axios instance and base HTTP helpers
├── config/           # App-wide configuration (env, constants)
├── hooks/            # Shared hooks — no domain/feature coupling
├── ui/               # Atomic UI components — no domain/feature coupling
├── utils/            # Pure utility functions consumed project-wide
└── modules/          # Feature/domain modules (see below)
```

### Modules

Each module in `src/modules/<name>/` is a self-contained feature boundary:

```
src/modules/<name>/
├── components/
│   ├── <component-name>/     # One folder per component
│   │   ├── <component>.tsx
│   │   ├── <component>.types.ts  (if needed)
│   │   ├── <component>.test.tsx
│   │   └── index.ts
│   └── index.ts              # Barrel — re-exports all components
├── pages/
│   └── <page-name>/          # One folder per page-level component
│       ├── <page>.tsx
│       ├── <page>.test.tsx
│       └── index.ts
├── hooks/
│   ├── <hook-name>/          # One folder per hook
│   │   ├── <hook>.ts
│   │   └── index.ts
│   └── index.ts              # Barrel — re-exports all hooks
├── requests/                 # React Query hooks + API calls (uses src/api/)
├── store/
│   ├── slices/
│   │   ├── <slice-name>/     # One folder per slice
│   │   │   ├── <slice>.ts
│   │   │   ├── <slice>.test.ts
│   │   │   └── index.ts
│   │   └── index.ts          # Barrel — re-exports all slices
│   └── index.ts
├── <name>.routes.tsx         # Module-level route definitions
└── index.ts                  # Barrel export — single public API
```

**`pages/` vs `components/`**: Page-level components that define the layout of a route go in `pages/`. Reusable UI pieces within the module go in `components/`. Route files import from `pages/`, not `components/`.

The root `src/routes.tsx` composes all module routes:

```tsx
import { dashboardRoutes } from "@modules/dashboard/dashboard.routes";
export const routes = [...dashboardRoutes];
```

## Conventions

### File & Folder Naming

- **Every component, hook, and slice lives in its own folder** named in `kebab-case`.
- The main file inside the folder matches the folder name: `dashboard/dashboard.tsx`.
- Types live in a co-located `<name>.types.ts` if the interface is non-trivial.
- Every folder that contains re-exportable code has an `index.ts`.
- No `PascalCase` file names — use `dashboard.tsx`, not `Dashboard.tsx`.

### Path Aliases

Always use absolute aliases — never `../../../`:

| Alias        | Resolves to     |
| ------------ | --------------- |
| `@modules/*` | `src/modules/*` |
| `@hooks/*`   | `src/hooks/*`   |
| `@ui/*`      | `src/ui/*`      |
| `@utils/*`   | `src/utils/*`   |
| `@config/*`  | `src/config/*`  |
| `@api/*`     | `src/api/*`     |

### Barrel Exports

Every folder with public exports has an `index.ts`. Consumers import from the folder, never from internal file paths.

### Store Pattern (Zustand)

- Each module owns a **bound store** (`store/index.ts`) created with `create()`.
- State is split into **slices** (`store/slices/<name>/`) — one folder per concern.
- The bound store composes slices via the slice pattern.

### Requests

- API calls live in `requests/` and use the shared Axios instance from `src/api/`.
- Each request file exports React Query hooks (`useQuery` / `useMutation` wrappers).

### UI Components

- `src/ui/` holds atomic, domain-free components (Button, Input, Modal, etc.).
- Domain-specific components belong inside their module's `components/` folder.

### Hooks

- `src/hooks/` holds shared, domain-free hooks.
- Domain-specific hooks belong inside their module's `hooks/` folder.

## Protected Files

**Never delete or modify** the following during development tasks:

- `.claude/` directory and all its contents (hooks, settings, skills, rules)
- `CLAUDE.md`
- `PROMPT.md`

These files define the project's AI assistant configuration and must be preserved across all refactors, scaffolding, and code generation operations.

## Commands

```bash
npm run dev        # Start Vite dev server
npm run build      # Production build
npm run lint       # Lint
npm run format     # Format
npm test           # Run vitest
npx playwright test # Run e2e tests
```
