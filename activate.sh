#!/usr/bin/env bash
# activate_venv.sh — source a virtualenv folder named "activate"
# Usage (recommended):
#   source activate_venv.sh
# or
#   . activate_venv.sh
#
# The script must be sourced so the environment is applied to the current shell.

if [ "${BASH_SOURCE[0]}" = "$0" ]; then
  echo "Please source this script instead of executing it:" >&2
  echo "  source activate_venv.sh" >&2
  echo "or" >&2
  echo "  . activate_venv.sh" >&2
  exit 1
fi

# Locations to check for an activate script
CANDIDATES=(
  "./activate/bin/activate"
  "./activate/Scripts/activate"
  "./.venv/bin/activate"
  "./venv/bin/activate"
  "./env/bin/activate"
)

for p in "${CANDIDATES[@]}"; do
  if [ -f "$p" ]; then
    source "$p"
    echo "Activated virtualenv: $p"
    return 0
  fi
done

echo "No virtualenv 'activate' found in common locations."
read -r -p "Create a new venv named 'activate' here now? [Y/n] " ans
ans=${ans:-Y}
if [[ "$ans" =~ ^[Yy]$ ]]; then
  if command -v python >/dev/null 2>&1; then
    python -m venv activate
  elif command -v python3 >/dev/null 2>&1; then
    python3 -m venv activate
  else
    echo "No Python interpreter found (python or python3). Install Python first." >&2
    return 1
  fi

  if [ -f "activate/bin/activate" ]; then
    source "activate/bin/activate"
    echo "Created and activated './activate' (Unix layout)."
    return 0
  elif [ -f "activate/Scripts/activate" ]; then
    source "activate/Scripts/activate"
    echo "Created and activated './activate' (Windows layout)."
    return 0
  else
    echo "Created venv but could not find activate script. Check the 'activate' folder." >&2
    return 1
  fi
else
  echo "Aborted. To create a venv manually run: python -m venv activate"
  return 1
fi
