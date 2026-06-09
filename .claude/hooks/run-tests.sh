#!/bin/bash
# Runs vitest on test files after Edit/Write
FILE=$(cat | jq -r '.tool_input.file_path // empty')

[ -z "$FILE" ] && exit 0

case "$FILE" in
  *.test.ts|*.test.tsx)
    npx vitest run "$FILE" --passWithNoTests 2>&1
    ;;
esac

exit 0
