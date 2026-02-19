{ pkgs, lib, inputs, config, ... }:

let
  tracey = pkgs.rustPlatform.buildRustPackage {
    pname = "tracey";
    version = "0.0.0-rev-${inputs.tracey-src.shortRev}";

    src = inputs.tracey-src;

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
      version = "0.0.0-rev-${inputs.tracey-src.shortRev}";
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
  ];

  # Environment variables
  env.RUST_SRC_PATH = lib.mkForce "${pkgs.rustPlatform.rustLibSrc}";

  # Shell hook
  enterShell = ''
    echo "------------------------------------------------"
    echo "👻 Traceable Dev Environment Active"
    echo "   Tracey: $(tracey --version) (Pinned to devenv.lock)"
    echo "   Rust:   $(rustc --version)"
    echo "------------------------------------------------"
  '';
}
