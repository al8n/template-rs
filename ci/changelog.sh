#!/bin/bash
#
# Structure check for CHANGELOG.md, and the extractor release.yml reads release notes with.
#
#   ci/changelog.sh check [FILE]             FILE is well formed
#   ci/changelog.sh release VERSION [FILE]   FILE has one dated, non-empty section for VERSION
#   ci/changelog.sh notes VERSION [FILE]     print that section's body
#   ci/changelog.sh selftest                 plant one defect at a time; each must fail as planted
#
# FILE defaults to CHANGELOG.md. The format is the one the file's preamble describes: a
# `## Unreleased` section first, then one `## X.Y.Z (YYYY-MM-DD)` section per release, newest
# first. Lines inside fenced code blocks are never headings.
#
# It reads structure and never content. It exists because nothing else reads a changelog: a rebase
# can drop a heading or duplicate a section and every compiler, linter and test stays green.
#
# POSIX awk and bash 3.2 syntax only, so it runs the same on a stock macOS and on a runner.

set -euo pipefail

check() {
  local file=$1
  if [ ! -s "$file" ]; then
    echo "::error::$file is missing or empty"
    return 1
  fi
  awk '
    function err(n, msg) {
      printf "::error file=%s,line=%d::%s\n", FILENAME, n, msg
      bad = 1
    }
    function close_section(    version) {
      if (!open) return
      sections++
      if (name == "Unreleased") {
        if (unreleased) err(start, "a second \"## Unreleased\" section")
        else if (sections > 1) err(start, "\"## Unreleased\" must be the first section")
        unreleased = 1
      } else if (name ~ /^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.-]+)? \([0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]\)$/) {
        split(name, part, " ")
        version = part[1]
        if (version in seen) err(start, "version " version " has two sections")
        seen[version] = 1
        if (body == 0) err(start, "the section for " version " is empty")
      } else {
        err(start, "\"## " name "\" is neither \"## Unreleased\" nor \"## X.Y.Z (YYYY-MM-DD)\"")
      }
      open = 0
    }
    BEGIN { bad = 0 }
    /^(```|~~~)/ { fence = !fence; if (open) body++; next }
    fence { if (open && $0 ~ /[^ \t]/) body++; next }
    /^## / { close_section(); open = 1; name = substr($0, 4); start = NR; body = 0; next }
    open && /[^ \t]/ { body++ }
    END {
      close_section()
      if (!unreleased) {
        printf "::error::%s has no \"## Unreleased\" section\n", FILENAME
        bad = 1
      }
      exit bad
    }
  ' "$file"
}

# `FIRST LAST` for the section of a version: its heading line, and the last line before the next
# level-two heading or the end of the file. Fails unless there is exactly one such section.
range() {
  awk -v want="$1" '
    /^(```|~~~)/ { fence = !fence }
    !fence && /^## / {
      if (open) { print start, NR - 1; open = 0 }
      if (substr($0, 1, length(want) + 5) == "## " want " (" && $0 ~ /\([0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]\)$/) {
        start = NR; open = 1; n++
      }
    }
    END { if (open) print start, NR; if (n != 1) exit 1 }
  ' "$2"
}

# The section's lines after its heading, or nothing and a failure.
body_of() {
  local version=$1 file=$2 span
  if ! span=$(range "$version" "$file"); then
    echo "::error::$file needs exactly one \"## $version (YYYY-MM-DD)\" section"
    return 1
  fi
  sed -n "${span% *},${span#* }p" "$file" | sed 1d
}

release() {
  local version=$1 file=$2 body
  body=$(body_of "$version" "$file") || return 1
  if [ -z "$(printf '%s' "$body" | tr -d ' \t\r\n')" ]; then
    echo "::error::the section for $version in $file is empty"
    return 1
  fi
}

notes() {
  local version=$1 file=$2
  release "$version" "$file"
  body_of "$version" "$file"
}

selftest() {
  local dir failed=0
  dir=$(mktemp -d)
  # shellcheck disable=SC2064
  trap "rm -rf \"$dir\"" EXIT

  # expect <description> <file> <diagnosis>: check must fail, and say the planted thing.
  expect_fail() {
    local out
    if out=$(check "$2" 2>&1); then
      echo "selftest: $1: passed, wanted a failure"
      failed=1
    elif ! printf '%s\n' "$out" | grep -qF -- "$3"; then
      echo "selftest: $1: failed without saying \"$3\": $out"
      failed=1
    fi
  }

  printf '# Changelog\n\n## Unreleased\n\n## 0.1.0 (2026-01-02)\n\n- First release.\n' >"$dir/good"
  if ! check "$dir/good" >/dev/null 2>&1; then
    echo "selftest: a well-formed file failed"
    failed=1
  fi
  # shellcheck disable=SC2016
  printf '# Changelog\n\n## Unreleased\n\n```text\n## not a heading\n```\n\n## 0.1.0 (2026-01-02)\n\n- x\n' >"$dir/fenced"
  if ! check "$dir/fenced" >/dev/null 2>&1; then
    echo "selftest: a heading inside a code fence was read as a heading"
    failed=1
  fi

  printf '# Changelog\n\n## 0.1.0 (2026-01-02)\n\n- x\n' >"$dir/no-unreleased"
  expect_fail "no Unreleased section" "$dir/no-unreleased" 'has no "## Unreleased" section'
  printf '# Changelog\n\n## 0.1.0 (2026-01-02)\n\n- x\n\n## Unreleased\n' >"$dir/late"
  expect_fail "Unreleased below a release" "$dir/late" "must be the first section"
  printf '# Changelog\n\n## Unreleased\n\n## Unreleased\n' >"$dir/two"
  expect_fail "two Unreleased sections" "$dir/two" 'a second "## Unreleased"'
  printf '# Changelog\n\n## Unreleased\n\n## 0.1.0 (2026-01-02)\n\n- x\n\n## 0.1.0 (2026-01-01)\n\n- y\n' >"$dir/twice"
  expect_fail "one version twice" "$dir/twice" "version 0.1.0 has two sections"
  printf '# Changelog\n\n## Unreleased\n\n## v0.1.0\n\n- x\n' >"$dir/heading"
  expect_fail "a heading in neither form" "$dir/heading" "is neither"
  printf '# Changelog\n\n## Unreleased\n\n## 0.1.0 (2026-01-02)\n\n' >"$dir/empty"
  expect_fail "an empty release" "$dir/empty" "the section for 0.1.0 is empty"
  : >"$dir/blank"
  expect_fail "an empty file" "$dir/blank" "is missing or empty"

  if ! release 0.1.0 "$dir/good" >/dev/null 2>&1; then
    echo "selftest: release: the 0.1.0 section of the good file was not found"
    failed=1
  fi
  if release 0.2.0 "$dir/good" >/dev/null 2>&1; then
    echo "selftest: release: a version with no section passed"
    failed=1
  fi
  if [ "$(notes 0.1.0 "$dir/good" 2>/dev/null)" != "
- First release." ]; then
    echo "selftest: notes: not exactly the 0.1.0 body"
    failed=1
  fi

  [ "$failed" -eq 0 ] || return 1
  echo "ok: the changelog checker fails on every planted defect and passes a good file"
}

usage() {
  cat >&2 <<'EOF'
usage: ci/changelog.sh check [FILE]
       ci/changelog.sh release VERSION [FILE]
       ci/changelog.sh notes VERSION [FILE]
       ci/changelog.sh selftest
EOF
  exit 2
}

case "${1:-}" in
  check)
    check "${2:-CHANGELOG.md}"
    echo "ok: ${2:-CHANGELOG.md} is well formed"
    ;;
  release)
    [ -n "${2:-}" ] || usage
    release "$2" "${3:-CHANGELOG.md}"
    ;;
  notes)
    [ -n "${2:-}" ] || usage
    notes "$2" "${3:-CHANGELOG.md}"
    ;;
  selftest) selftest ;;
  *) usage ;;
esac
