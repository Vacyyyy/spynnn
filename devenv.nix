# Copyright © 2026 Vacyyyy and contributors (see git history)
# SPDX-License-Identifier: AGPL-3.0-or-later
{ pkgs, lib, inputs, config, ... }:
let
  cargoToml = builtins.fromTOML (builtins.readFile "${inputs.tracey-src}/crates/tracey/Cargo.toml");

  tracey = pkgs.rustPlatform.buildRustPackage {
    pname = "tracey";
    version = cargoToml.package.version;
    src = inputs.tracey-src;

    # Ensure --version can show git hash in Nix store builds (no .git metadata).
    TRACEY_GIT_COMMIT = inputs.tracey-src.shortRev or "unknown";

    cargoLock = {
      lockFile = "${inputs.tracey-src}/Cargo.lock";
      outputHashes = {
        "facet-0.42.0" = "sha256-uHhXGTo6K3RSRQGVLHeds68gJWpHGT6eEgN4fz3iNVk=";
        "facet-cargo-toml-0.1.0" = "sha256-n1mpnold8WYt/RgD3wdr/a6QB8zKIuMPeVx+onGlAU0=";
        "facet-styx-0.1.0" = "sha256-G5g3MBxgd2jte9pM8W1s4IEZsyZfBpO/lxglcMCGmwM=";
        "marq-0.1.0" = "sha256-ChARz/yiDH4IRHeAOF4PM8xfH1ayMPdE0hAH1ydb35g=";
        "pikru-1.0.1" = "sha256-0dZGqx/tgARWRrbzWE7aU4YEb/rIV8+hc2BGlFYx/9Q=";
        "roam-0.6.0" = "sha256-pM1FwNp4V+cBsay3iU42mzkesQnNNoExg3eHc6KM660=";
      };
    };

    pnpmDeps = pkgs.fetchPnpmDeps {
      pname = "tracey-dashboard";
      version = "${cargoToml.package.version}-rev-${inputs.tracey-src.shortRev}";
      src = inputs.tracey-src;
      sourceRoot = "source/crates/tracey/src/bridge/http/dashboard";
      fetcherVersion = 2;
      hash = "sha256-oFyJcA5/tzTaxDOP07nudp1jn/s+sixHC7MuasINFf8=";
    };

    nativeBuildInputs = [
      pkgs.nodejs
      pkgs.pnpm
      pkgs.pnpmConfigHook
    ];

    pnpmRoot = "crates/tracey/src/bridge/http/dashboard";
    doCheck = false;

    meta = {
      description = "Requirements tracing tool (pinned)";
      mainProgram = "tracey";
    };
  };
in
{
  cachix.pull = [ "spynnn-org" ];
  cachix.push = "spynnn-org";

  # Rust toolchain via devenv's built-in module
  languages.rust = {
    enable = true;
    components = [ "rustc" "cargo" "clippy" "rustfmt" ];
  };

  # Additional packages
  packages = [
    tracey
    pkgs.typst
    pkgs.jujutsu
    pkgs.cocogitto
    pkgs.just
  ];

  # Environment variables
  env.RUST_SRC_PATH = lib.mkForce "${pkgs.rustPlatform.rustLibSrc}";

  enterShell = ''
    LOGOS_FILE="${./brand/assets/LOGO_VARIATIONS}"
    INIT_FLAG=".devenv/first_run"

    echo ""

    # Pick logo into variable first
    if [ ! -f "$INIT_FLAG" ]; then
      logo="$(tail -n +3 "$LOGOS_FILE" | awk 'BEGIN { RS=""; } { print; exit }')"
      touch "$INIT_FLAG"
    else
      logo="$(tail -n +3 "$LOGOS_FILE" | awk -v seed=$RANDOM '
        BEGIN { RS=""; srand(seed); }
        { a[NR]=$0 }
        END { if (NR>0) print a[int(rand()*NR) + 1] }
      ')"
    fi

    # Calculate logo width (longest line length)
    logo_width=$(printf "%s\n" "$logo" | awk '{ if (length > max) max = length } END { print max }')

    # Get terminal width
    term_width=$(tput cols 2>/dev/null || echo 0)

    if [ "$term_width" -ge "$logo_width" ]; then
      # Terminal wide enough → disable wrapping
      printf '\033[?7l'
      printf "%s\n" "$logo"
      printf '\033[?7h'
    else
      # Terminal too narrow → render normally
      printf "%s\n" "$logo"
      echo ""
      echo '⚠ Please resize your terminal to at least '"$logo_width"' columns (current: '"$term_width"') to see our logo properly.'
    fi

    echo ""
    echo "╷"
    echo "│ Spynnn: development shell"
    echo "│ Copyright © 2026 Vacyyyy and contributors (see git history)"
    echo "│"
    echo "│ This program is distributed in the hope that it will be useful,"
    echo "│ but WITHOUT ANY WARRANTY; without even the implied warranty of"
    echo "│ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the"
    echo "│ \`LICENSE\` and \`NOTICE\` for more details."
    echo "│"
    echo "│ The source code for this version is available at https://github.com/spynnn-org/spynnn."
    echo "│"
    echo "│"
    echo "│ Shell with:"
    echo "│ Tracey:  $(tracey --version) (from spynnn-org/tracey)"
    echo "│ Rust:    $(rustc --version)"
    echo "│ Cargo:   $(cargo --version)"
    echo "│ Rustdoc: $(rustdoc --version)"
    echo "│ Clippy:  $(cargo clippy --version)"
    echo "│ Rustfmt: $(rustfmt --version)"
    echo "│ Just:    $(just --version)"
    echo "╰─────────────────────────────────────────────────────────────────────────────────────────────────╴"
  '';
}