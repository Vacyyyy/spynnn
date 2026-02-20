<!--Copyright © 2026 Vacyyyy and contributors (see git history)
SPDX-License-Identifier: AGPL-3.0-or-later-->
### **(NOTE: If you want to develop, [START HERE](#development))**

---

# Contribution guidelines

## Preamble

Thank you for your interest in contributing. Speaking as the admin of this project, I do not take help for granted, whether it be discussions, pull requests, input, feedback, bug reporting, issues, or whatever else.

I hope you can also respect the work I put into this project, _including_ the specific, strict, and perhaps even pedantic processes I enforce. I am aware that the process I enforce through CI and policies makes it harder for outsiders to contribute code. **One of the primary philosohpies of this project is correctness; ease of access for new code contributors is simply secondary to this**. If you are a software developer, want to contribute, but don't want to follow this project's processes, first of all I encourage you to give it a chance and see its potential, please consider opening an issue for your contribution regardless—just respect the project's issue process in that case.
**If you you give the process a try, you should see that I put a lot of work into making the DX as seemless as possible and guiding you through it.**

## Legal matters

With that out of the way, onto some legal stuff. With spynnn-org not being a legal entity, I, Vacyyyy, as the creator, hold the copyright.

The project name "Spynnn" and related components' name "SpynnnIR", "SpynnnLang", and "SpynnnUI", and all brand assets (`brand/assets/*`) are trademarks of Vacyyyy. Use in forks or derivative projects is prohibited without permission. This ensures that modified versions do not cause confusion with the official project. 

All code, however, is licensed under AGPLv3, so you are free to fork, modify, and redistribute the software as long as you comply with the AGPLv3 terms.

We do not use a Contributer License Agreement. Still, please be aware, by contributing, you agree to GitHub's Terms of Service, specifically the "Inbound=Outbound" rule, which states that:

> Whenever you make a contribution to a repository containing notice of a license, you license your contribution under the same terms, and you agree that you have the right to license your contribution under those terms.

This means once you contribute, you generally do not have the right to revoke the license you give to the creator, even though there is no CLA. For technical legal reason, this project enforces every file (except `LICENSE` and `NOTICE`) to contain this copyright header at the very top (optionally in comments, as per the file's needs):

```
Copyright © 2026 Vacyyyy and contributors (see git history)
SPDX-License-Identifier: AGPL-3.0-or-later
```

Due to this project being licensed under AGPL (instead of just GPL), we are also required, as per Section 13 of the license, to share code even if users only access it over the network. This is why this repository itself contains `NOTICE`.

## Contribution guidelines

## Issues (Feature requests, bug reporting, etc.)

**Issues are NOT for questions. For questions, support requests, or general discussion, please use Discussions.**

Before opening an Issue, read `CODE_OF_CONDUCT.md`. By creating an Issue, you agree to this project's code of conduct.

### Before Opening a new Issue

1. **Search existing issues**: Check if your issue has already been reported or requested. This includes both open and closed issues. If you find a similar issue, add a comment with additional context rather than opening a duplicate.

2. **Verify the issue**: 
   - For bugs: Ensure you can reproduce the issue consistently
   - For feature requests: Consider whether the feature aligns with the project's goals and philosophy
   - Check the latest version: Make sure you're using the most recent release

3. **Gather information**: Collect relevant details before posting:
   - Version numbers (project, dependencies, operating system)
   - Reproduction steps for bugs
   - Error messages, logs, or stack traces
   - Screenshots or recordings if applicable

### Opening an Issue

#### Issue Title
- Use a clear, descriptive title that summarizes the issue
- Start with a prefix: `[BUG]`, `[FEATURE]`, `[ENHANCEMENT]`, `[DOCS]`, etc.
- Good example: `[BUG] Application crashes when parsing malformed JSON`
- Bad example: `it doesn't work`

#### Issue Description

Your issue should include the following sections as applicable:

**For Bug Reports:**

```markdown
### Description
A clear and concise description of what the bug is.

### Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

### Expected Behavior
A clear description of what you expected to happen.

### Actual Behavior
What actually happened instead.

### Environment
- OS: [e.g., Ubuntu 24.04, Windows 11, macOS 14]
- Project Version: [e.g., v1.2.3; include the commit hash if applicable]

### Additional Context
- Error logs or stack traces (use code blocks)
- Screenshots or videos
- Related issues or PRs
- Any workarounds you've discovered
```

**For Feature Requests:**

```markdown
### Problem Statement
Describe the problem or limitation you're experiencing that this feature would solve.

### Proposed Solution
A clear description of what you want to happen.

### Alternatives Considered
Describe any alternative solutions or features you've considered.

### Additional Context
- Use cases
- Examples from other projects
- Mockups or diagrams (if applicable)
- How this aligns with project goals
```

**For Documentation Issues:**

```markdown
### Location
Link to or describe the location of the documentation issue.

### Issue
Describe what is incorrect, unclear, or missing.

### Suggested Improvement
Propose how the documentation should be improved.
```

### Issue Etiquette

1. **Be respectful**: Remember that maintainers and contributors are volunteers. Be patient and courteous.

2. **Be specific**: Vague issues like "it's broken" or "add more features" are not actionable.

3. **One issue per report**: Don't combine multiple unrelated bugs or feature requests in a single issue.

4. **Stay on topic**: Keep discussion focused on the specific issue at hand.

5. **Follow up**: If maintainers ask for more information, respond timely. Issues may be closed if they become stale without response.

6. **Accept decisions**: The maintainers have final say on what gets implemented or fixed. If your issue is closed or rejected, respect that decision. You're welcome to fork the project if you disagree.

### Issue Lifecycle

1. **Triage**: Maintainers will review and label your issue
2. **Discussion**: Clarifications and refinements may be requested
3. **Acceptance/Rejection**: Issue may be accepted, rejected, or marked as help-wanted
4. **Implementation**: Work begins (either by maintainers or contributors)
5. **Resolution**: Issue is closed when resolved or determined to be invalid

### Labels

Issues will be labeled to help with organization:
- `bug`: Confirmed bugs
- `feature`: New feature requests
- `enhancement`: Improvements to existing features
- `documentation`: Documentation-related issues
- `good-first-issue`: Suitable for new contributors
- `help-wanted`: Maintainer is looking for contributions
- `wontfix`: Issue will not be addressed
- `duplicate`: Issue already exists elsewhere
- `invalid`: Issue is not valid
- `needs-info`: More information required from reporter

### What NOT to Post as an Issue

- **Questions**: Use Discussions instead
- **Support requests**: Use Discussions or relevant support channels
- **Security vulnerabilities**: Follow the security policy (see `SECURITY.md` if available)
- **Spam or promotional content**: This will be deleted and may result in being blocked
- **Duplicate reports**: Search first before posting
- **Demands**: Issues like "fix this now" or "you must add this feature" will likely be closed

### Closing Issues

Issues may be closed if:
- The issue is resolved
- The issue cannot be reproduced
- The issue is a duplicate
- The issue is out of scope for the project
- The reporter is unresponsive after requests for information
- The issue violates the Code of Conduct

Closed issues can be reopened if new information becomes available or if the closing was in error.


**Remember**: Quality issues lead to better outcomes. Taking time to write a well-structured issue helps maintainers understand and address your concern more effectively.

## Pull requests

**Please open an Issue before opening a Pull Request, except for the most trivial of changes.**

For any Pull Request, this project requires the contributor to have read relevant development documentation (see `docs/dev/`), have understand the philosophies of this project, especially regarding the enforcement of our process.

**If you do not use the required process, CI and this project's policies WILL REJECT YOUR PULL REQUEST.**

This will only be overwritten extreme cases, for example when enforment was in error or it is a security-critical PR. We are thankful for your interest in contributing, but please respect this projects work _and_ its philosophy and policies.

### Contributing to an Existing Issue (including the one you created before opening a PR)

Thank you for your interest in contributing code to address an open issue. Before you start work, please read this template and follow the guidelines below.

#### Before You Begin

1. **Read the contribution guidelines**: Thoroughly review `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, and `docs/dev/` to understand the project's philosophy, process, and strict requirements.

2. **Check the issue status**: 
   - Ensure the issue is still open and hasn't been assigned to someone else
   - Look for labels like `help-wanted` or `good-first-issue` that indicate the maintainer actively welcomes contributions (if you find an Issue with such a tag, contribute anyways, if you would like)
   - Check if there are any existing PRs linked to the issue

1. **Understand the process**: This project enforces strict development processes through CI and policies. Review `docs/dev/` to understand the required development practices. **PRs that don't follow the process will be rejected.** For a guide, see [below](#development).

2. **Comment on the issue**: Before starting work, comment on the issue to:
   - Express your interest in working on it
   - Ask any clarifying questions
   - Outline your proposed approach (if applicable)
   - Optionally: Wait for maintainer confirmation to avoid duplicate work

#### During Development

1. **Follow project standards and processes** (see [below](#development))

2. **Test thoroughly**:
   - Verify your changes work as intended
   - Test edge cases and potential failure scenarios
   - Ensure existing functionality isn't broken

3. **Document your changes**:
   - Update relevant documentation, including specifications and ADRs (this is strictly enforced)
   - Add additional code comments where necessary to explain complex implementation logic

#### Opening Your Pull Request

1. **Reference the issue**: In your PR description, reference the issue you're addressing (e.g., "Fixes #123" or "Addresses #456")

2. **Provide a clear description**:
   ```markdown
   ### Related Issue
   Closes #[issue-number]

   ### Summary
   Brief description of what this PR accomplishes.

   ### Changes Made
   - List the key changes you made
   - Be specific about what was modified, added, or removed

   ### Testing
   Describe how you tested your changes and what scenarios you covered.

   ### Additional Notes
   Any other context, decisions, or trade-offs worth noting.
   ```

3. **Keep PRs focused**: Address only the specific issue at hand. Don't combine unrelated changes or refactoring in the same PR.

4. **Be responsive**: If maintainers request changes or ask questions, respond promptly and make necessary updates.

#### Legal Agreement

By submitting a pull request, you agree to:
- GitHub's Terms of Service, including the "Inbound=Outbound" rule
- License your contribution under AGPL-3.0-or-later
- For details, see [above](#legal-matters)

You certify that you have the right to submit the code under this license.

#### What to Expect

- **CI checks**: Your PR must pass all automated checks. The process is strict but designed to ensure correctness.
- **Code review**: The maintainer will review your code. Be patient—maintainers are volunteers.
- **Possible revisions**: You may be asked to make changes. This is normal and helps maintain code and documentation quality.
- **Final decision**: The maintainers have final say on whether a PR is merged. Respect this decision. If you believe a decision was made in error, _constructive_ criticism is welcome.

#### Important Reminders

- **Trivial changes only**: Only very trivial changes (typo fixes, etc.) should skip the "open an issue first" step. For anything else, an issue must exist.
- **process is mandatory**: This project's philosophy prioritizes correctness over ease of contribution. The strict process is intentional and will be enforced.
- **Developer experience**: While the process is strict, the project provides [guidance](#development) and tooling to make the process as seamless as possible. Give it a chance.

### Questions?

If you have questions about:
- **The issue itself**: Comment on the issue
- **General development**: Use Discussions
- **The process**: Review `docs/dev/`. Ask in Discussions or write to maintainers' emails (find our emails in git)

## Development

Please read the section on [Pull Requests](#pull-requests) first, before you start working.

If you are interested in the _why_ and the technical side of this development process, see [Development Process Specification](docs/dev/meta/SPECIFICATION.md).

### Setup

This project uses a hermetic build environment. You do not need to install Rust tooling, or build tools system-wide. You need **Nix** (the package manager, _not_ NixOS), **devenv**, **Git**, **Jujutsu**, and a commit signing setup using GPG. **Nix is a hard requirement**; development using other system-wide tools is not supported.

#### Install Nix

Install the Nix package manager with Flake support enabled.

(NOTE: Nix does not exist on Windows, and, as such, we don't support development on Windows (you may attempt development in WSL at your own risk))

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

#### Install devenv
```bash
nix-env --install --attr devenv -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable
```

#### Clone the repository and configure Jujutsu

If you do not have a working GPG commit signing setup, please follow: [this guide](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key) followed by [this guide](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account) and then continue below. If you need to use the ssh backend, please see [these docs](https://docs.jj-vcs.dev/latest/config/#ssh-signing).

```bash
cd <WHERE YOU WANT THE REPOSITORY>
jj git clone https://github.com/spynnn-org/spynnn.git
jj config set --repo user.name "<YOUR NAME OR NAME>"
jj config set --repo user.email "<YOUR EMAIL>"
jj config set --repo signing.behavior true
jj config set --repo signing.backend gpg
## You can set `key` to anything accepted by `gpg -u`
## If not set then defaults to the key associated with `user.email`
## If your key of choice has the same email you set above as a uid
## you can skip setting a key explicity, otherwise:
# jj config set --repo signing.key <VALUE>
jj config set --repo git.sign-on-push true
jj config set --repo ui.show-cryptographic-signatures true
jj config set --repo revsets.sign "all() & mine() & ~(heads(::@) & empty())"
jj config set --repo remotes.origin.auto-track-bookmarks "*"
jj config set --repo remotes.upstream.auto-track-bookmarks "main"
```

#### Optional—recommended: Install direnv

See [here](https://direnv.net/#basic-installation).

#### Entering the development shell

##### Option A: Manual Activation (Ephemeral)
```bash
devenv shell
```

##### Option B: Direnv (Automatic—Recommended)
If you use `direnv`:
```bash
direnv allow
## Tools are now available automatically whenever you `cd` into the directory.
```

### 2. The Interface (`just`)

We do not use raw `cargo` commands for process tasks. Use `just` to interact with the project.

| Command | Action |
| :--- | :--- |
| **`just test`** | Runs unit tests, doctests, and verifies spec coverage. |
| **`just lint`** | Runs code formatting (`rustfmt`), linter (`clippy`), and checks the Tracey graph integrity. |
| **`just trace`** | Compiles the Requirement Graph. Outputs the Traceability Matrix to `tracey/matrix.html`. |
| **`just doc`** | Generates HTML documentation, compiling embedded Typst diagrams. |
| **`just doc-watch`** | Serves documentation on `localhost`, live-reloading as you edit Rust files. |

### 3. The Development Loop

We strictly use **Jujutsu (`jj`)** for version control. Do not use `git` commands directly (except if you really know what you are doing), CI will reject it. If you are not used to `jj`, we recommend reading `jj help -k tutorial`.

#### 3.1. Start a Task
Create a new anonymous working copy off the main branch:
```bash
jj new main
```

#### 3.2. Implement & Tag (Tracey)
We use `tracey` to link code to specs. You **must** add tags if you are implementing features.

**Linking Logic to Requirements:**
Add `implements: [TAG]` to module-level documentation (`//!`) or function docs (`///`).

```rust
//! # User Auth
//! implements: REQ-AUTH-001
//!
//! This module handles login...
```

**Linking Tests to Specs:**
Add `verifies: [TAG]` to test functions.

```rust
#[test]
/// verifies: REQ-AUTH-001
fn test_password_hashing() {
    // ...
}
```

#### 3.3. Verify Changes
Run the full suite. This checks both code correctness and graph integrity.
```bash
just test
just lint
```
*If `just lint` fails with "Dangling Requirement," you defined a spec tag but didn't implement it, or implemented logic without a test verifying it.*

#### 3.4. Commit
Describe your changes. This generates the required `Change-Id` footer automatically.
```bash
jj describe -m "feat: implement auth handshake"
```

#### 3.5. Push
Push the change to the remote.
```bash
jj git push
```

### 4. Diagram Reference

Simple ASCII diagrams are allowed. For complex diagrams do not use Mermaid, use Typst. Embed Typst code directly in Rust documentation comments wrapped in triple backticks.

```rust
/// ```typst
/// #set page(width: auto, height: auto, margin: 1cm)
/// #rect(fill: blue.lighten(80%), radius: 5pt)[
///   *Auth Module*
/// ]
/// ```
pub struct AuthState;
```
Run `just doc-watch` to see the rendered SVG in real-time.
