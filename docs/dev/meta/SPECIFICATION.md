<!--Copyright © 2026 Vacyyyy and contributors
SPDX-License-Identifier: AGPL-3.0-or-later-->
**(NOTE: This workflow specification does not follow itself; it is not bootstrapped)**

---

# Development Process Specification

## 1. Core Philosophy
This repository adheres to a **Traceable Inverted Literate Programming** methodology.

1.  **Explicit Traceability:** Every line of logic must be traced back to a specific requirement or specification via [`tracey`](https://github.com/bearcove/tracey).
2.  **Code implements the Spec:** The code source files are the source of truth for implementation, but they are nodes in a larger Requirement Graph.
3.  **Hermetic Tooling:** The build environment is defined strictly by Nix. We do not rely on required system-installed tools.
4.  **Linear History:** We enforce a strict, linear commit history via Jujutsu (`jj`).

## 2. The Hermetic Environment (Nix)

The root `flake.nix` defines the single source of truth for the toolchain.

### 2.1. The Toolchain (`buildInputs`)
The flake provides the following pinned binaries:
*   **Core:** `rustc`, `cargo`, `clippy`, `rustfmt`.
*   **Governance & Tracing:**
    *   `tracey`: The requirements tracing engine.
    *   `just`: Command runner.
*   **Documentation:**
    *   `typst`: CLI compiler for diagrams.
    *   `doc-glue`: Custom Rust binary for extracting Typst from comments.
*   **Version Control:** `jujutsu` (`jj`) and `cocogitto` (`cog`).

### 2.2. The Interface (`Justfile`)
The `Justfile` abstracts the `tracey` pipeline.

**Commands:**
*   `just dev`: Enters the Nix shell.
*   `just test`: Runs unit tests and verifies `tracey` coverage.
*   `just lint`: Runs Format + Clippy + **Tracey Graph Check** (ensures no dangling requirements).
*   **`just trace`**: Runs `tracey parse` to build the requirements graph and generate the HTML traceability matrix.
*   `just doc`: Runs Typst pre-processor -> `cargo doc`.

## 3. Documentation Architecture & Tracing

We use `tracey` to link three layers of abstraction: **Requirements** (Markdown), **Specifications** (Markdown/Rust), and **Implementation/Verification** (Rust).

### 3.1. High-Level Requirements (`dev_docs/`)
Business requirements and Architecture Decision Records (ADRs) live in `dev_docs/`.
*   **Format:** Markdown with frontmatter.
*   **Tagging:** defined via strict naming conventions in files.
    ```markdown
    ---
    tag: REQ-001
    ---
    # User Authentication
    The system must allow users to log in...
    ```

### 3.2. Module-Level Specs (Rust Comments)
Implementation details live inside `.rs` files. Instead of just describing logic, we **explicitly link** to the requirements they fulfill.
*   **Format:** Rust Doc comments (`///`) or Module comments (`//!`).
*   **Tracey Integration:** Use `implements:` to link to high-level specs.

    ```rust
    //! # Auth Module
    //! implements: REQ-001
    //!
    //! This module handles the JWT handshakes.
    ```

### 3.3. Verification (Tests)
We strictly separate "Logic Tests" from "Verification Tests."
*   **Logic Tests:** Standard `#[test]` for internal consistency.
*   **Verification Tests:** Tests that explicitly validate a spec. These must define a `verifies:` tag in the comment immediately preceding the test function.

    ```rust
    /// verifies: REQ-001
    #[test]
    fn test_login_success() {
        // ...
    }
    ```

### 3.4. Diagrams (Typst)
We continue to use **Typst** for diagrams.
*   **Usage:** Embed Typst code in comments.
*   **Traceability:** Diagrams usually illustrate a specific spec. The comment block containing the Typst code should arguably implement a spec tag.

## 4. Version Control & History

### 4.1. The "Anti-Raw-Git" Policy
Interaction is primarily via `jj`.

### 4.2. Enforcement Mechanism
*   **Change-Id:** Mandatory.
*   **Traceability Check:** Commits that introduce new Logic (code) without updating the Traceability Graph (e.g., linking to a spec) should ideally be flagged during review, though strict enforcement is handled by `just lint`.

## 5. Testing Strategy

*   **Unit & DocTests:** `cargo test`.
*   **Tracey Validation:** `just trace` ensures:
    1.  All `REQ-` tags are implemented by at least one `SPEC-` or code block.
    2.  All `SPEC-` tags are verified by at least one `#[test]`.
*   **Grammar:** Validated via macros in `tests/`.

## 6. Continuous Integration (CI) Authority

### 6.1. Local CI (`just lint`)
*   **Authority:** Advisory.
*   **Checks:** `tracey graph` (checks for broken links), `cargo clippy`, `cargo fmt`.

### 6.2. Remote CI
*   **Authority:** Final Gatekeeper.
*   **Checks:**
    1.  **Trace Integrity:** Fails if `tracey` detects "dangling" requirements (defined but not implemented/verified).
    2.  **Clean Build:** Compiles in release.
    3.  **Linear History:** `jj` enforcement.

---

# Architecture Decision Records (ADR)

## ADR-001: Adoption of Traceable Spec-First Engineering
**Context:** Specs rot when separated from code. Logic drifts from requirements.
**Decision:** Use `tracey` to create a hard-linked graph between Requirements (Markdown) and Implementation (Rust).
**Consequences:** High confidence in coverage. Requires discipline to tag code blocks.

## ADR-002: Enforcement of Executable Documentation
**Decision:** All code blocks in docs must be Rust Doctests.

## ADR-003: Hermetic Environment via Nix
**Decision:** `flake.nix` defines the universe, including the `tracey` binary.

## ADR-004: Typst for Diagrams
**Decision:** Embed Typst source code in Rust comments.

## ADR-005: Enforcement of Jujutsu via Change-ID
**Decision:** Enforce `Change-Id` footers to ensure linear history.

## ADR-006: Tracey as the System of Record
**Context:** We need to know if a feature is fully implemented and tested.
**Decision:** We adopt [tracey](https://github.com/bearcove/tracey).
*   **Requirements** live in `dev_docs/*.md`.
*   **Specs** live in `dev_docs/*.md` or `src/**/*.rs`.
*   **Tests** in `src/**/*.rs` act as validators.
**Consequences:** Replaces generic "Obsidian" knowledge base with a structured Requirement Graph. Obsidian can still be used as a Markdown editor, but `tracey` owns the relationships.

## ADR-007: Split Authority CI Model
**Decision:** Remote CI enforces the Traceability Graph integrity. You cannot merge code that claims to implement a missing spec.