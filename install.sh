#!/usr/bin/env bash
set -euo pipefail

REPO="git@github.com:iden0605/claude-skills.git"
BRANCH="main"
SKILLS_DIR=".claude/skills"
TMP_DIR="$(mktemp -d)"

# Cleanup on exit
trap 'rm -rf "$TMP_DIR"' EXIT

usage() {
  echo "Usage: $0 [skill-name ...]"
  echo ""
  echo "Installs Claude skills into .claude/skills/ in the current directory."
  echo ""
  echo "Examples:"
  echo "  $0                  # Install all skills"
  echo "  $0 grill-me commit-and-push  # Install only named skills"
  exit 1
}

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  usage
fi

echo "Fetching claude-skills..."
git clone --depth=1 --branch "$BRANCH" "$REPO" "$TMP_DIR" 2>/dev/null

mkdir -p "$SKILLS_DIR"

install_skill() {
  local skill_dir="$1"
  local name
  name="$(basename "$skill_dir")"

  if [[ ! -f "${skill_dir}/SKILL.md" ]]; then
    return
  fi

  # Copy the entire skill folder (SKILL.md + any supporting files)
  rm -rf "$SKILLS_DIR/$name"
  cp -r "$skill_dir" "$SKILLS_DIR/$name"
  echo "  + $name/"
}

if [[ $# -eq 0 ]]; then
  # Install all skills (any directory containing a SKILL.md)
  found=0
  for skill_dir in "$TMP_DIR"/*/; do
    if [[ -f "${skill_dir}SKILL.md" ]]; then
      install_skill "$skill_dir"
      found=1
    fi
  done
  if [[ $found -eq 0 ]]; then
    echo "No skills found in repo."
    exit 0
  fi
else
  # Install named skills
  for skill in "$@"; do
    skill_dir="$TMP_DIR/$skill"
    if [[ ! -d "$skill_dir" ]]; then
      echo "  ! Skill '$skill' not found — skipping"
      continue
    fi
    install_skill "$skill_dir"
  done
fi

echo ""
echo "Done. Skills installed to $SKILLS_DIR/"
echo "Restart Claude Code or reload for changes to take effect."
