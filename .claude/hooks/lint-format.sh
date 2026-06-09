#!/bin/bash
# Runs eslint --fix and prettier --write on .ts/.tsx/.js files after Edit/Write
FILE=$(cat | jq -r '.tool_input.file_path // empty')

[ -z "$FILE" ] && exit 0

case "$FILE" in
  *.ts|*.tsx)
    npx eslint --fix "$FILE" 2>/dev/null
    npx prettier --write "$FILE" 2>/dev/null
    ;;
  *.js)
    npx prettier --write "$FILE" 2>/dev/null
    ;;
  *.json|*.md)
    npx prettier --write "$FILE" 2>/dev/null
    ;;
esac

exit 0
