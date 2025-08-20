#!/usr/bin/env bash
# SEO System installer for Claude Beyond Code
# Copies or symlinks agents/styles/commands/hooks into a target .claude directory.
# Usage:
#   ./systems/seo/install.sh [--project|--user] [--copy|--symlink] [--all|--agents|--styles|--commands|--hooks]...
# Defaults: --project --copy --all
set -euo pipefail

MODE="project"      # project or user
METHOD="copy"       # copy or symlink
# Components selection
DO_AGENTS=false
DO_STYLES=false
DO_COMMANDS=false
DO_HOOKS=false
ANY_SELECTED=false

usage() {
  cat <<EOF
SEO System installer

Options:
  --project            Install into project .claude (default)
  --user               Install into user ~/.claude
  --copy               Copy files (default, non-destructive)
  --symlink            Create symlinks (advanced users)

Components (choose one or more; default: --all):
  --all                Install agents, styles, and commands (hooks if present)
  --agents             Install agents only
  --styles             Install output styles only
  --commands           Install slash commands (optional)
  --hooks              Install hooks if present

Examples:
  # Project-level copy (recommended)
  ./systems/seo/install.sh --project --copy --all

  # User-level symlinks for local profile
  ./systems/seo/install.sh --user --symlink --agents --styles
EOF
}

if [[ ${1:-} == "-h" || ${1:-} == "--help" ]]; then
  usage
  exit 0
fi

# Parse flags
while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) MODE="project" ;;
    --user) MODE="user" ;;
    --copy) METHOD="copy" ;;
    --symlink) METHOD="symlink" ;;
    --all) DO_AGENTS=true; DO_STYLES=true; DO_COMMANDS=true; DO_HOOKS=true; ANY_SELECTED=true ;;
    --agents) DO_AGENTS=true; ANY_SELECTED=true ;;
    --styles) DO_STYLES=true; ANY_SELECTED=true ;;
    --commands) DO_COMMANDS=true; ANY_SELECTED=true ;;
    --hooks) DO_HOOKS=true; ANY_SELECTED=true ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
  shift
done

if [[ "$ANY_SELECTED" == false ]]; then
  # Default to all if nothing specified
  DO_AGENTS=true; DO_STYLES=true; DO_COMMANDS=true; DO_HOOKS=true
fi

SRC_ROOT="systems/seo"
case "$MODE" in
  project) DEST_ROOT=".claude" ;;
  user) DEST_ROOT="$HOME/.claude" ;;
  *) echo "Invalid MODE: $MODE" >&2; exit 1 ;;
esac

mkdir -p "$DEST_ROOT"

# Portable absolute path resolver (macOS/Linux)
resolve_path() {
  if command -v realpath >/dev/null 2>&1; then
    realpath "$1"
  elif command -v python3 >/dev/null 2>&1; then
    python3 -c 'import os,sys; print(os.path.realpath(sys.argv[1]))' "$1"
  elif command -v perl >/dev/null 2>&1; then
    perl -MCwd=realpath -e 'print realpath(shift)' "$1"
  else
    # Fallback (best-effort)
    (cd "$(dirname "$1")" && printf '%s\n' "$PWD/$(basename "$1")")
  fi
}

install_dir() {
  local src="$1" dest="$2"
  local method="$3"
  [[ -d "$src" ]] || return 0
  mkdir -p "$dest"
  shopt -s nullglob
  for f in "$src"/*; do
    local base
    base="$(basename "$f")"
    if [[ "$method" == "copy" ]]; then
      # Do not overwrite existing files by default
      if [[ -e "$dest/$base" ]]; then
        echo "skip: $dest/$base exists"
      else
        cp -R "$f" "$dest/"
        echo "copied: $dest/$base"
      fi
    else
      # symlink
      if [[ -L "$dest/$base" || -e "$dest/$base" ]]; then
        echo "skip: $dest/$base exists"
      else
        target="$(resolve_path "$f")"
        ln -s "$target" "$dest/$base"
        echo "linked: $dest/$base -> $target"
      fi
    fi
  done
  shopt -u nullglob
}

# Perform installations
if [[ "$DO_STYLES" == true ]]; then
  install_dir "$SRC_ROOT/output-styles" "$DEST_ROOT/output-styles" "$METHOD"
fi
if [[ "$DO_AGENTS" == true ]]; then
  install_dir "$SRC_ROOT/agents" "$DEST_ROOT/agents" "$METHOD"
fi
if [[ "$DO_COMMANDS" == true ]]; then
  install_dir "$SRC_ROOT/commands" "$DEST_ROOT/commands" "$METHOD"
fi
if [[ "$DO_HOOKS" == true ]]; then
  install_dir "$SRC_ROOT/hooks" "$DEST_ROOT/hooks" "$METHOD"
fi

echo "\nDone. Target: $DEST_ROOT ($METHOD)."
