use super::*;

#[test]
fn version_is_the_manifest_version() {
  assert_eq!(VERSION, env!("CARGO_PKG_VERSION"));
}

#[cfg(any(feature = "std", feature = "alloc"))]
#[test]
fn name_is_the_manifest_name() {
  assert_eq!(name(), env!("CARGO_PKG_NAME"));
}

#[cfg(feature = "std")]
#[test]
fn target_os_names_the_build_target() {
  assert!(!target_os().is_empty());
}
