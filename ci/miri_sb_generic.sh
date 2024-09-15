#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Error: CONFIG_FLAGS are not provided"
  exit 1
fi

CONFIG_FLAGS=$1

rustup toolchain install nightly --component miri
rustup override set nightly
cargo miri setup

export MIRIFLAGS="-Zmiri-strict-provenance -Zmiri-disable-isolation -Zmiri-symbolic-alignment-check"
export RUSTFLAGS="--cfg test_$CONFIG_FLAGS"

cargo miri test --tests --lib
