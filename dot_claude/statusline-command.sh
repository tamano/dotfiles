#!/bin/sh
# Claude Code statusLine command — mirrors Starship prompt style

input=$(cat)

# Working directory (truncate to last 5 parts, like starship truncation_length=5)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
truncated=$(echo "$cwd" | awk -F'/' '{
  n = split($0, a, "/");
  if (n <= 6) { print $0 }
  else {
    out = a[n-4] "/" a[n-3] "/" a[n-2] "/" a[n-1] "/" a[n];
    print "…/" out
  }
}')

# Git branch (skip optional lock to be safe)
git_branch=$(git -C "$cwd" -c gc.auto=0 symbolic-ref --short HEAD 2>/dev/null)
git_status=""
if [ -n "$git_branch" ]; then
  # Count ahead/behind
  upstream=$(git -C "$cwd" -c gc.auto=0 rev-parse --abbrev-ref '@{u}' 2>/dev/null)
  ahead=""
  behind=""
  if [ -n "$upstream" ]; then
    ahead_count=$(git -C "$cwd" -c gc.auto=0 rev-list --count "@{u}..HEAD" 2>/dev/null)
    behind_count=$(git -C "$cwd" -c gc.auto=0 rev-list --count "HEAD..@{u}" 2>/dev/null)
    [ "${ahead_count:-0}" -gt 0 ] 2>/dev/null && ahead="⇡${ahead_count}"
    [ "${behind_count:-0}" -gt 0 ] 2>/dev/null && behind="⇣${behind_count}"
  fi
  # Modified/staged/untracked counts
  modified=$(git -C "$cwd" -c gc.auto=0 diff --name-only 2>/dev/null | wc -l | tr -d ' ')
  staged=$(git -C "$cwd" -c gc.auto=0 diff --cached --name-only 2>/dev/null | wc -l | tr -d ' ')
  untracked=$(git -C "$cwd" -c gc.auto=0 ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')
  status_str=""
  [ "${staged:-0}" -gt 0 ] 2>/dev/null && status_str="${status_str}+${staged}"
  [ "${modified:-0}" -gt 0 ] 2>/dev/null && status_str="${status_str}!${modified}"
  [ "${untracked:-0}" -gt 0 ] 2>/dev/null && status_str="${status_str}?${untracked}"
  [ -n "$ahead" ] && status_str="${status_str}${ahead}"
  [ -n "$behind" ] && status_str="${status_str}${behind}"
  if [ -n "$status_str" ]; then
    git_status=" [${status_str}]"
  fi
fi

# Time
time_str=$(date +%H:%M:%S)

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // .model.id // ""')

# Context window usage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Rate limits
five_h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')

# Build output
# Line 1: # <dir> on <branch>[status] [time]
line1=""
line1="${line1}# ${truncated}"
if [ -n "$git_branch" ]; then
  line1="${line1}  ${git_branch}${git_status}"
fi
line1="${line1}  [${time_str}]"

# Line 2: model | context% | rate limit
line2="${model}"
if [ -n "$used_pct" ]; then
  used_int=$(printf '%.0f' "$used_pct")
  line2="${line2} | ctx:${used_int}%"
fi
if [ -n "$five_h" ]; then
  five_int=$(printf '%.0f' "$five_h")
  line2="${line2} | 5h:${five_int}%"
fi

printf "%s\n%s" "$line1" "$line2"
