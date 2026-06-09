# Project Rule: Testing

When creating new files:
- Always create a corresponding test file
- Cover happy path, edge cases, and error cases
- Use describe/it blocks with clear descriptions
- Minimum 80% coverage for new code
- Use vitest for unit/integration tests and Playwright for e2e tests
- Store hooks tests should use `act()` and `renderHook` from `@testing-library/react`
- React Query hook tests should use `QueryClientProvider` wrapper
