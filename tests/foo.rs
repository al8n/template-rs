#[test]
fn the_version_is_exposed() {
  assert_eq!(template_rs::VERSION, env!("CARGO_PKG_VERSION"));
}
