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
├── config/           # App-wide configuration (env, constants, routes)
├── hooks/            # Shared hooks — no domain/feature coupling
├── ui/               # Atomic UI components — no domain/feature coupling
├── utils/            # Pure utility functions consumed project-wide
└── modules/          # Feature/domain modules (see below)
```

### Modules

Each module in `src/modules/<name>/` is a self-contained feature boundary:

```
src/modules/<name>/
├── components/       # Domain-specific React components
├── hooks/            # Domain-specific hooks
├── requests/         # React Query hooks + API calls (uses src/api/)
├── store/            # Zustand bound store + slices
│   ├── slices/       # Individual state slices (one concern per file)
│   └── index.ts      # Bound store that combines slices
└── index.ts          # Barrel export — every module exposes a single public API
```

## Conventions

### Barrel Exports

Every module has an `index.ts` that re-exports its public API. Consumers import from the module, never from internal paths.

### Store Pattern (Zustand)

- Each module owns a **bound store** (`store/index.ts`) created with `create()`.
- State is split into **slices** (`store/slices/`) — one file per concern, keeping files small and focused.
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

## Commands

```bash
npm run dev        # Start Vite dev server
npm run build      # Production build
npm run lint       # Lint
npm run format     # Format
npm test           # Run vitest
npx playwright test # Run e2e tests
```
