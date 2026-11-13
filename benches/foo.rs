use criterion::{Criterion, criterion_group, criterion_main};
use std::hint::black_box;

fn version(c: &mut Criterion) {
  c.bench_function("version", |b| b.iter(|| black_box(template_rs::VERSION)));
}

criterion_group!(benches, version);
criterion_main!(benches);
