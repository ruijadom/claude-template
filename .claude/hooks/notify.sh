#!/bin/bash
# macOS notification when Claude finishes a task
osascript -e 'display notification "Task complete" with title "Claude Code"' 2>/dev/null
exit 0
