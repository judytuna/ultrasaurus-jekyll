---
layout: post
title: "rust 2020: fulfill the promise"
date: 2019-11-29
tags: [rust, programming, roadmap]
---

As a newcomer to Rust, my suggestion for 2020 theme is to fulfill the promise of "empowering everyone to build reliable and efficient software" by finishing what's started (rather than adding new features), continuing the focus on good docs and good tools, and expanding to develop a coherent ecosystem.

> Rust empowers you to reach farther, to program with confidence in a wider variety of domains than you did before. — Rust Language Book forward

## 2020 roadmap: finish what's started, fulfill the promise

**2021 edition: scalability** – Can newcomers to Rust create a real-world, complex system without recreating basic components or contributing to the language itself?

Tooling is great! rustup toolchain, feature flags, online/offline docs make it easy to experiment with new Rust/crate features, even as a relatively new Rust programmer.

## Key Areas for 2020

**Transparency** (like this call for blog posts, RFC process including roadmap) Focus on good docs & good error reporting is incredibly helpful. Keep iterating on this!

**Safety beyond memory safety and concurrency.** For example: URL parsing should:
- be in std  
- have a shared implementation that supports common use cases — it's risky for Internet apps to not have a stable, well vetted URL parser, why are there three? (That's a rhetorical question. I know why, but don't think there need to be.)

**Async all the things!** I think this is already the plan. I look forward to async I/O (network and files) to be supported in the std library. I appreciate the thoughtfulness about safety, factoring out useful core concepts (like Pin/Task), and ensuring compatibility with Futures and Tokio crates.

*Caveat: I am new to Rust. There's probably stuff I don't even know about that is more important than anything here. This is just me doing my part to give back to the awesome Rust community.*