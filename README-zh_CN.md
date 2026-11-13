<div align="center">
<h1>template-rs</h1>
</div>
<div align="center">

创建开源 Rust 代码库的 GitHub 模板

[<img alt="github" src="https://img.shields.io/badge/github-al8n/template--rs-8da0cb?style=for-the-badge&logo=Github" height="22">][Github-url]
<img alt="LoC" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fgist.githubusercontent.com%2Fal8n%2F327b2a8aef9003246e45c6e47fe63937%2Fraw%2Ftemplate-rs" height="22">
[<img alt="Build" src="https://img.shields.io/github/actions/workflow/status/al8n/template-rs/ci.yml?logo=Github-Actions&style=for-the-badge" height="22">][CI-url]
[<img alt="codecov" src="https://img.shields.io/codecov/c/gh/al8n/template-rs?style=for-the-badge&token=6R3QFWRWHL&logo=codecov" height="22">][codecov-url]

[<img alt="docs.rs" src="https://img.shields.io/badge/docs.rs-template--rs-66c2a5?style=for-the-badge&labelColor=555555&logo=data:image/svg+xml;base64,PHN2ZyByb2xlPSJpbWciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmlld0JveD0iMCAwIDUxMiA1MTIiPjxwYXRoIGZpbGw9IiNmNWY1ZjUiIGQ9Ik00ODguNiAyNTAuMkwzOTIgMjE0VjEwNS41YzAtMTUtOS4zLTI4LjQtMjMuNC0zMy43bC0xMDAtMzcuNWMtOC4xLTMuMS0xNy4xLTMuMS0yNS4zIDBsLTEwMCAzNy41Yy0xNC4xIDUuMy0yMy40IDE4LjctMjMuNCAzMy43VjIxNGwtOTYuNiAzNi4yQzkuMyAyNTUuNSAwIDI2OC45IDAgMjgzLjlWMzk0YzAgMTMuNiA3LjcgMjYuMSAxOS45IDMyLjJsMTAwIDUwYzEwLjEgNS4xIDIyLjEgNS4xIDMyLjIgMGwxMDMuOS01MiAxMDMuOSA1MmMxMC4xIDUuMSAyMi4xIDUuMSAzMi4yIDBsMTAwLTUwYzEyLjItNi4xIDE5LjktMTguNiAxOS45LTMyLjJWMjgzLjljMC0xNS05LjMtMjguNC0yMy40LTMzLjd6TTM1OCAyMTQuOGwtODUgMzEuOXYtNjguMmw4NS0zN3Y3My4zek0xNTQgMTA0LjFsMTAyLTM4LjIgMTAyIDM4LjJ2LjZsLTEwMiA0MS40LTEwMi00MS40di0uNnptODQgMjkxLjFsLTg1IDQyLjV2LTc5LjFsODUtMzguOHY3NS40em0wLTExMmwtMTAyIDQxLjQtMTAyLTQxLjR2LS42bDEwMi0zOC4yIDEwMiAzOC4ydi42em0yNDAgMTEybC04NSA0Mi41di03OS4xbDg1LTM4Ljh2NzUuNHptMC0xMTJsLTEwMiA0MS40LTEwMi00MS40di0uNmwxMDItMzguMiAxMDIgMzguMnYuNnoiPjwvcGF0aD48L3N2Zz4K" height="20">][doc-url]
[<img alt="crates.io" src="https://img.shields.io/crates/v/template-rs?style=for-the-badge&logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik0yNTYsMEwzMS41MjgsMTEyLjIzNnYyODcuNTI4TDI1Niw1MTJsMjI0LjQ3Mi0xMTIuMjM2VjExMi4yMzZMMjU2LDB6IE0yMzQuMjc3LDQ1Mi41NjRMNzQuOTc0LDM3Mi45MTNWMTYwLjgxDQoJCQlsMTU5LjMwMyw3OS42NTFWNDUyLjU2NHogTTEwMS44MjYsMTI1LjY2MkwyNTYsNDguNTc2bDE1NC4xNzQsNzcuMDg3TDI1NiwyMDIuNzQ5TDEwMS44MjYsMTI1LjY2MnogTTQzNy4wMjYsMzcyLjkxMw0KCQkJbC0xNTkuMzAzLDc5LjY1MVYyNDAuNDYxbDE1OS4zMDMtNzkuNjUxVjM3Mi45MTN6IiBmaWxsPSIjRkZGIi8+DQoJPC9nPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=" height="22">][crates-url]
[<img alt="crates.io" src="https://img.shields.io/crates/d/template-rs?color=critical&logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNjQ1MTE3MzMyOTU5IiBjbGFzcz0iaWNvbiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjM0MjEiIGRhdGEtc3BtLWFuY2hvci1pZD0iYTMxM3guNzc4MTA2OS4wLmkzIiB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwvc3R5bGU+PC9kZWZzPjxwYXRoIGQ9Ik00NjkuMzEyIDU3MC4yNHYtMjU2aDg1LjM3NnYyNTZoMTI4TDUxMiA3NTYuMjg4IDM0MS4zMTIgNTcwLjI0aDEyOHpNMTAyNCA2NDAuMTI4QzEwMjQgNzgyLjkxMiA5MTkuODcyIDg5NiA3ODcuNjQ4IDg5NmgtNTEyQzEyMy45MDQgODk2IDAgNzYxLjYgMCA1OTcuNTA0IDAgNDUxLjk2OCA5NC42NTYgMzMxLjUyIDIyNi40MzIgMzAyLjk3NiAyODQuMTYgMTk1LjQ1NiAzOTEuODA4IDEyOCA1MTIgMTI4YzE1Mi4zMiAwIDI4Mi4xMTIgMTA4LjQxNiAzMjMuMzkyIDI2MS4xMkM5NDEuODg4IDQxMy40NCAxMDI0IDUxOS4wNCAxMDI0IDY0MC4xOTJ6IG0tMjU5LjItMjA1LjMxMmMtMjQuNDQ4LTEyOS4wMjQtMTI4Ljg5Ni0yMjIuNzItMjUyLjgtMjIyLjcyLTk3LjI4IDAtMTgzLjA0IDU3LjM0NC0yMjQuNjQgMTQ3LjQ1NmwtOS4yOCAyMC4yMjQtMjAuOTI4IDIuOTQ0Yy0xMDMuMzYgMTQuNC0xNzguMzY4IDEwNC4zMi0xNzguMzY4IDIxNC43MiAwIDExNy45NTIgODguODMyIDIxNC40IDE5Ni45MjggMjE0LjRoNTEyYzg4LjMyIDAgMTU3LjUwNC03NS4xMzYgMTU3LjUwNC0xNzEuNzEyIDAtODguMDY0LTY1LjkyLTE2NC45MjgtMTQ0Ljk2LTE3MS43NzZsLTI5LjUwNC0yLjU2LTUuODg4LTMwLjk3NnoiIGZpbGw9IiNmZmZmZmYiIHAtaWQ9IjM0MjIiIGRhdGEtc3BtLWFuY2hvci1pZD0iYTMxM3guNzc4MTA2OS4wLmkwIiBjbGFzcz0iIj48L3BhdGg+PC9zdmc+&style=for-the-badge" height="22">][crates-url]
<img alt="license" src="https://img.shields.io/badge/License-Apache%202.0/MIT-blue.svg?style=for-the-badge&fontColor=white&logoColor=f5c076&logo=data:image/svg+xml;base64,PCFET0NUWVBFIHN2ZyBQVUJMSUMgIi0vL1czQy8vRFREIFNWRyAxLjEvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkIj4KDTwhLS0gVXBsb2FkZWQgdG86IFNWRyBSZXBvLCB3d3cuc3ZncmVwby5jb20sIFRyYW5zZm9ybWVkIGJ5OiBTVkcgUmVwbyBNaXhlciBUb29scyAtLT4KPHN2ZyBmaWxsPSIjZmZmZmZmIiBoZWlnaHQ9IjgwMHB4IiB3aWR0aD0iODAwcHgiIHZlcnNpb249IjEuMSIgaWQ9IkNhcGFfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmlld0JveD0iMCAwIDI3Ni43MTUgMjc2LjcxNSIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgc3Ryb2tlPSIjZmZmZmZmIj4KDTxnIGlkPSJTVkdSZXBvX2JnQ2FycmllciIgc3Ryb2tlLXdpZHRoPSIwIi8+Cg08ZyBpZD0iU1ZHUmVwb190cmFjZXJDYXJyaWVyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz4KDTxnIGlkPSJTVkdSZXBvX2ljb25DYXJyaWVyIj4gPGc+IDxwYXRoIGQ9Ik0xMzguMzU3LDBDNjIuMDY2LDAsMCw2Mi4wNjYsMCwxMzguMzU3czYyLjA2NiwxMzguMzU3LDEzOC4zNTcsMTM4LjM1N3MxMzguMzU3LTYyLjA2NiwxMzguMzU3LTEzOC4zNTcgUzIxNC42NDgsMCwxMzguMzU3LDB6IE0xMzguMzU3LDI1OC43MTVDNzEuOTkyLDI1OC43MTUsMTgsMjA0LjcyMywxOCwxMzguMzU3UzcxLjk5MiwxOCwxMzguMzU3LDE4IHMxMjAuMzU3LDUzLjk5MiwxMjAuMzU3LDEyMC4zNTdTMjA0LjcyMywyNTguNzE1LDEzOC4zNTcsMjU4LjcxNXoiLz4gPHBhdGggZD0iTTE5NC43OTgsMTYwLjkwM2MtNC4xODgtMi42NzctOS43NTMtMS40NTQtMTIuNDMyLDIuNzMyYy04LjY5NCwxMy41OTMtMjMuNTAzLDIxLjcwOC0zOS42MTQsMjEuNzA4IGMtMjUuOTA4LDAtNDYuOTg1LTIxLjA3OC00Ni45ODUtNDYuOTg2czIxLjA3Ny00Ni45ODYsNDYuOTg1LTQ2Ljk4NmMxNS42MzMsMCwzMC4yLDcuNzQ3LDM4Ljk2OCwyMC43MjMgYzIuNzgyLDQuMTE3LDguMzc1LDUuMjAxLDEyLjQ5NiwyLjQxOGM0LjExOC0yLjc4Miw1LjIwMS04LjM3NywyLjQxOC0xMi40OTZjLTEyLjExOC0xNy45MzctMzIuMjYyLTI4LjY0NS01My44ODItMjguNjQ1IGMtMzUuODMzLDAtNjQuOTg1LDI5LjE1Mi02NC45ODUsNjQuOTg2czI5LjE1Miw2NC45ODYsNjQuOTg1LDY0Ljk4NmMyMi4yODEsMCw0Mi43NTktMTEuMjE4LDU0Ljc3OC0zMC4wMDkgQzIwMC4yMDgsMTY5LjE0NywxOTguOTg1LDE2My41ODIsMTk0Ljc5OCwxNjAuOTAzeiIvPiA8L2c+IDwvZz4KDTwvc3ZnPg==" height="22">

[English][en-url] | 简体中文

</div>

## 安装

```toml
[dependencies]
template-rs = "0.1"
```

## 特性

| 特性 | 默认 | 作用 |
| --- | --- | --- |
| `std` | 是 | 标准库 |
| `alloc` | 否 | 不依赖标准库的堆类型 |

两个特性都不启用时，crate 是 `no_std` 的，并且不分配内存。两者相互独立：`std` 不蕴含 `alloc`，四种组合都是合法的构建。

## 模板提供什么

一个 crate 骨架，以及作者自己的 crate 正在使用的 CI/CD，改个名字即可使用。

- **crate。** `Cargo.toml` 带有上面的特性层级、`[lints]`、docs.rs 元数据和一个 criterion 基准。`src/lib.rs` 是惯用的 crate 根，每一层各有一个条目，使每一层都有东西可构建、可测试；它的单元测试放在单独的文件 `src/tests.rs` 中。`tests/foo.rs`、`examples/foo.rs` 和 `benches/foo.rs` 是占位文件，用来被替换。
- **合并门禁。** `ci.yml` 只在 Linux 上运行，所以几十分钟内就能得到结论。更慢的任务各自是独立的 workflow，每一个都可以单独暂停。
- **发布。** 推送标签 `vX.Y.Z` 即通过 crates.io 的 Trusted Publishing 发布，不在任何地方存放 token；发布前会检查该提交在 `main` 上并且 CI 已通过。
- **配置。** `rustfmt.toml`；`.codecov.yml`（仅供参考，覆盖率永远不会阻止合并）；`.github/dependabot.yml`；以及 `CHANGELOG.md`，其结构由 `ci/changelog.sh` 检查。

| Workflow | 运行内容 | 可否暂停 |
| --- | --- | --- |
| `ci.yml` | 合并门禁，仅 Linux：rustfmt；对每个特性运行 clippy；对每种特性组合构建并测试；裸机 `no_std` 构建；MSRV；带 `-D warnings` 和 docs.rs 配置的文档构建；15 个目标的交叉构建；address sanitizer；`cargo publish --dry-run`；changelog 结构检查 | 否 |
| `macos.yml`、`windows.yml` | 在这两种系统上运行 clippy、构建和测试 | 可以：这两种 runner 要排队数小时 |
| `miri-tb.yml`、`miri-sb.yml` | 在六个 Linux 目标上分别用 Tree Borrows 和 Stacked Borrows 运行 Miri | 可以：Miri 很慢 |
| `perf.yml` | 把 criterion 基准只运行一次，作为冒烟检查 | 可以 |
| `coverage.yml` | cargo-llvm-cov，上传到 codecov | 可以 |
| `release.yml` | 发布，见下文 | 否 |
| `loc.yml` | 代码行数徽章，写入 gist | 可以 |

## 用模板创建 crate

1. **创建仓库**：在 GitHub 上点击 "Use this template"，然后克隆。
2. **改名**。`git grep -n 'template[-_]rs'` 会列出所有出现这个名字的地方：
   - `Cargo.toml`：`name`、`repository`、`homepage`、`documentation`、`description`、`keywords` 和 `categories`；
   - `tests/foo.rs`、`examples/foo.rs` 和 `benches/foo.rs` 中，crate 的名字是 `template_rs`；
   - 本 README 和 `README.md`：标题、徽章和链接；
   - `.github/workflows/loc.yml`：gist 中的文件名。

   还要修改两个许可证文件以及下方的版权所有者。`release.yml` 会拒绝发布仍然叫 `template-rs` 的包。
3. **选择保留什么**。下面每一项都只需要改一行：
   - `Cargo.toml` 中的 `edition` 和 `rust-version`。模板使用 2024 edition，它要求 `rust-version` 不低于 1.85。`msrv` 任务读取 `rust-version`，所以改它不需要动别处。
   - `release.yml` 中的 `REQUIRED_WORKFLOWS`：发布所打标签的那个提交上必须通过的 workflow。把 `macos.yml` 和 `windows.yml` 加进去，就同样要求它们通过。
   - 删掉 crate 用不上的东西，连同上表中它的那一行。没有基准测试时，就是 `perf.yml`、`benches/`、`[[bench]]` 条目和 `criterion` 开发依赖。不需要 Miri 时，就是 `miri-tb.yml`、`miri-sb.yml` 和 `ci/miri_*.sh`，以及它们在 `REQUIRED_WORKFLOWS` 中的名字。不使用 codecov 时，就是 `coverage.yml`、`.codecov.yml` 和徽章。
4. **添加 secret**（都是可选的）。`CODECOV_TOKEN` 让 `coverage.yml` 能够上传；没有它时，报告仍会生成，任务会提示报告已被丢弃。`loc.yml` 需要一个 gist：创建一个，把它的 id 填进 workflow，并把带有 gist 权限的个人访问令牌添加为 secret `GIST_PAT`。
5. **设置 crates.io（只需一次）**。crates.io 只能为已经存在的 crate 配置 trusted publisher，所以第一个版本要手动发布：
   - 用 `cargo login` 再 `cargo publish` 发布版本 `0.0.0`。它用来占住名字，而 `release.yml` 特意拒绝发布 `0.0.0`；
   - 在 crates.io 打开该 crate 的设置，进入 Trusted Publishing，添加一个 GitHub 配置：本仓库、workflow `release.yml`、environment `crates-io`；
   - GitHub 的 environment `crates-io` 会在首次使用时自动创建。如果希望发布前等待审批，到 `Settings > Environments` 添加必需的审核人。

   在完成这些之前，发布会失败，并给出说明缺少哪一步的信息；它绝不会跳过发布还报告成功。
6. **工作期间暂停用不到的 workflow**。`macos.yml`、`windows.yml`、`miri-tb.yml`、`miri-sb.yml`，愿意的话还有 `perf.yml` 和 `coverage.yml`。`ci.yml` 保持它的结论，那正是合并所等待的结论。暂停是仓库设置，所以暂停时仓库里的文件不会有任何变化：

   ```sh
   gh workflow disable macos.yml   # 暂停
   gh workflow enable macos.yml    # 重新启用
   ```

   发布之前把所有 workflow 都重新启用，并让它们在 `main` 上运行：`release.yml` 要求 `ci.yml` 和两个 Miri workflow 在被发布的提交上通过，而被暂停的 workflow 在该提交上没有运行记录。
7. **发布**。在 `Cargo.toml` 中设置 `version`，把 `CHANGELOG.md` 的 `Unreleased` 小节改名为 `## X.Y.Z (YYYY-MM-DD)`，并在它上方新开一个，然后合并到 `main`。接着：

   ```sh
   gh workflow run release.yml          # 可选：打标签之前，先检查 main 是否可以发布
   git tag -a vX.Y.Z -m vX.Y.Z
   git push origin vX.Y.Z
   ```

   `release.yml` 会检查提交、版本与标签是否一致、changelog 以及各个 workflow，然后发布，并用 changelog 的对应小节创建 GitHub Release。

#### License

`template-rs` is under the terms of both the MIT license and the
Apache License (Version 2.0).

See [LICENSE-APACHE](LICENSE-APACHE), [LICENSE-MIT](LICENSE-MIT) for details.

Copyright (c) 2021 Al Liu.

[Github-url]: https://github.com/al8n/template-rs/
[CI-url]: https://github.com/al8n/template-rs/actions/workflows/ci.yml
[doc-url]: https://docs.rs/template-rs
[crates-url]: https://crates.io/crates/template-rs
[codecov-url]: https://app.codecov.io/gh/al8n/template-rs/
[en-url]: https://github.com/al8n/template-rs/tree/main/README.md
