#!/usr/bin/env bash
set -euo pipefail

# wait up to ~5 seconds for hyprctl to be usable
for i in $(seq 1 25); do
  if command -v hyprctl >/dev/null 2>&1 && hyprctl monitors >/dev/null 2>&1; then
    break
  fi
  sleep 0.2
done

# give a tiny extra moment
sleep 0.3

# Workspace 1 -> terminal
hyprctl dispatch workspace 1
kitty &

# small delay to avoid race
sleep 0.8

# Workspace 2 -> Zen browser
hyprctl dispatch workspace 2
sleep 0.8
zen &
sleep 0.8

exit 0

