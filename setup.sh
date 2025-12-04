#!/usr/bin/env bash
# setup.sh
# Create a virtual environment and install Python dependencies from requirements.txt
# Works in: Git Bash, Linux, macOS.
#
# Usage:
#   ./setup.sh           # create .venv, install requirements
#   ./setup.sh --system  # skip venv creation, install into current Python environment (not recommended)

set -euo pipefail

VENV_DIR=".venv"
REQ_FILE="requirements.txt"
USE_SYSTEM=false

for arg in "$@"; do
  case "$arg" in
    --system) USE_SYSTEM=true ;;
    -h|--help)
      cat <<EOF
Usage: $0 [--system]

By default this script:
  - finds python3 (or python)
  - creates a virtual environment in ./.venv
  - activates it (only for the current script) and installs requirements.txt

If you pass --system, it will skip creating a venv and install into the current Python environment.
EOF
      exit 0
      ;;
  esac
done

# find python executable
PYTHON=""
if command -v python3 >/dev/null 2>&1; then
  PYTHON="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON="python"
else
  echo "ERROR: Python is not installed or not on PATH."
  echo "Install Python 3.8+ and re-run this script."
  exit 1
fi

echo "Using Python executable: $PYTHON"

if [ ! -f "$REQ_FILE" ]; then
  echo "ERROR: $REQ_FILE not found in $(pwd). Create a requirements.txt file and re-run."
  exit 1
fi

if [ "$USE_SYSTEM" = false ]; then
  # create virtual environment
  if [ -d "$VENV_DIR" ]; then
    echo "Virtualenv '$VENV_DIR' already exists. Re-using."
  else
    echo "Creating virtual environment in $VENV_DIR ..."
    $PYTHON -m venv "$VENV_DIR"
    echo "Virtual environment created."
  fi

  # Activate the venv for this script
  # Note: You still need to 'source .venv/bin/activate' in your shell to work inside venv interactively.
  if [ -f "$VENV_DIR/bin/activate" ]; then
    # POSIX activation
    # shellcheck disable=SC1091
    source "$VENV_DIR/bin/activate"
  elif [ -f "$VENV_DIR/Scripts/activate" ]; then
    # Windows Git Bash path
    # shellcheck disable=SC1091
    source "$VENV_DIR/Scripts/activate"
  else
    echo "WARNING: Could not find activate script in $VENV_DIR. Continuing without activation."
  fi
else
  echo "Skipping virtual environment creation; installing into current Python environment (--system)."
fi

# ensure pip is available and up-to-date
echo "Upgrading pip..."
$PYTHON -m pip install --upgrade pip setuptools wheel

# install requirements
echo "Installing packages from $REQ_FILE ..."
$PYTHON -m pip install -r "$REQ_FILE"

echo
echo "--------------------------------------------"
echo "SUCCESS: Dependencies installed."
if [ "$USE_SYSTEM" = false ]; then
  echo "To activate the virtual environment in your shell, run:"
  echo "  source $VENV_DIR/bin/activate   # Linux / macOS / Git Bash"
  echo "  # OR on Windows PowerShell:"
  echo "  # $VENV_DIR\\Scripts\\Activate.ps1"
else
  echo "You installed into the system environment (--system)."
fi
echo "Run the app (example):"
echo "  python exposure_scan_webapp_with_logo.py"
echo "--------------------------------------------"
