#![doc = include_str!("../README.md")]
#![cfg_attr(not(feature = "std"), no_std)]
#![cfg_attr(docsrs, feature(doc_cfg))]
#![cfg_attr(docsrs, allow(unused_attributes))]
#![deny(missing_docs)]

#[cfg(all(not(feature = "std"), feature = "alloc"))]
extern crate alloc as std;

#[cfg(feature = "std")]
extern crate std;

/// The version of this crate, as `Cargo.toml` declares it.
///
/// This is the core tier: it needs neither `std` nor `alloc`.
pub const VERSION: &str = env!("CARGO_PKG_VERSION");

/// The name of this crate, as an owned string.
///
/// This is the heap tier, available with `std` or with `alloc`. Heap types are spelled through
/// `std::`: with `alloc` and without `std` that name is the `alloc` crate.
#[cfg(any(feature = "std", feature = "alloc"))]
#[cfg_attr(docsrs, doc(cfg(any(feature = "std", feature = "alloc"))))]
pub fn name() -> std::string::String {
  std::string::String::from(env!("CARGO_PKG_NAME"))
}

/// The operating system this crate was built for, such as `"linux"` or `"macos"`.
///
/// This is the `std` tier: it exists only with the standard library.
#[cfg(feature = "std")]
#[cfg_attr(docsrs, doc(cfg(feature = "std")))]
pub fn target_os() -> &'static str {
  std::env::consts::OS
}

#[cfg(test)]
mod tests;
