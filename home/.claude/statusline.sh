#!/usr/bin/env bash
# Claude Code status line: model name plus a context-usage bar.
#
# The bar fills as the context window fills and changes colour on the way:
# green while there is room, yellow past halfway, red when compaction is near.
# Claude Code feeds the session JSON on stdin; see `.context_window` in it.

set -uo pipefail

BAR_WIDTH=20
YELLOW_AT=50   # percent used
RED_AT=80

input=$(cat)
model=$(printf '%s' "$input" | jq -r '.model.display_name // "claude"')
used=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty')

# Older clients, or a session before the first turn, report no context figure.
if [ -z "$used" ]; then
  printf '%s' "$model"
  exit 0
fi

pct=$(printf '%.0f' "$used")
[ "$pct" -lt 0 ] && pct=0
[ "$pct" -gt 100 ] && pct=100

filled=$(( pct * BAR_WIDTH / 100 ))
empty=$(( BAR_WIDTH - filled ))

# Built with a loop rather than `printf '=%.0s' $(seq 1 $n)`, which prints one
# character instead of none when n is 0.
repeat() {
  local n=$1 ch=$2 out='' i
  for (( i = 0; i < n; i++ )); do out+=$ch; done
  printf '%s' "$out"
}

if   [ "$pct" -ge "$RED_AT" ];    then colour=$'\033[31m'
elif [ "$pct" -ge "$YELLOW_AT" ]; then colour=$'\033[33m'
else                                   colour=$'\033[32m'
fi
dim=$'\033[2m'
reset=$'\033[0m'

bar=$(repeat "$filled" '█')
gap=$(repeat "$empty" '░')

printf '%s %s%s%s%s%s%s %d%%' \
  "$model" "$colour" "$bar" "$reset" "$dim" "$gap" "$reset" "$pct"
