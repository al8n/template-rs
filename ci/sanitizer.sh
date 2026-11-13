#!/bin/bash
#
# Sanitizer legs. Nightly only (`-Z sanitizer`, and `-Zbuild-std` for two of them).
#
# Run by the `sanitizer` job in `.github/workflows/ci.yml`, one matrix cell per sanitizer:
#
#     ci/sanitizer.sh                                  # address, on x86_64-unknown-linux-gnu
#     ci/sanitizer.sh x86_64-unknown-linux-gnu thread  # one target, one or more sanitizers
#
# ## The target is an argument
#
# Which sanitizers exist is a property of the target, so the target belongs where the matrix can
# set it. To see what one supports:
#
#     rustc +nightly --print target-spec-json -Z unstable-options --target <t> | grep supported-sanitizers
#
# ## Why the default is `address` alone
#
# `leak` and `memory` are unsupported on some targets, and an unsupported leg fails as a platform
# fact rather than as a finding. `thread` needs an instrumented `std`, which `-Zbuild-std`
# rebuilds on every run: worth paying for a crate that spawns threads or shares state, and not for
# one that does neither. They stay available as the second argument. Add the ones the crate needs
# to the matrix in `ci.yml`.
#
# ## `-Zbuild-std` is not optional for `thread` and `memory`
#
# The shipped `std` is uninstrumented. Without the flag these two legs fail with an ABI or
# interceptor mismatch that reads like a sanitizer report, so it is written down here instead of
# being rediscovered as a defect.
#
# `RUSTFLAGS` is replaced, not extended: these legs measure memory safety, and the workflow's
# `-Dwarnings` would only make a nightly lint a failure here.
set -eu

TARGET="${1:-x86_64-unknown-linux-gnu}"
SANITIZERS="${2:-address}"

export ASAN_OPTIONS="detect_odr_violation=0 detect_leaks=0"

for san in $SANITIZERS; do
  echo "=== sanitizer: ${san} on ${TARGET} ==="
  case "$san" in
    memory | thread)
      RUSTFLAGS="-Z sanitizer=${san}" \
        cargo -Zbuild-std test --tests --target "$TARGET" --all-features
      ;;
    *)
      RUSTFLAGS="-Z sanitizer=${san}" \
        cargo test --tests --target "$TARGET" --all-features
      ;;
  esac
done
