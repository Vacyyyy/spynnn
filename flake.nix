{
  description = "Traceable Inverted Literate Programming Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # FRAMEWORK:
    flake-parts.url = "github:hercules-ci/flake-parts";

    tracey-src = {
      url = "github:bearcove/tracey";
      flake = false;
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { config, pkgs, system, ... }: {
        packages = {
          tracey = pkgs.rustPlatform.buildRustPackage {
            pname = "tracey";
            version = "0.0.0-rev-${inputs.tracey-src.shortRev}";
            
            src = inputs.tracey-src;

            # Cargo deps
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

            # Pnpm deps
            pnpmDeps = pkgs.fetchPnpmDeps {
              pname = "tracey-dashboard";
              version = "0.0.0-rev-${inputs.tracey-src.shortRev}";
              src = inputs.tracey-src;
              sourceRoot = "source/crates/tracey/src/bridge/http/dashboard";
              fetcherVersion = 2;
              hash = "sha256-oFyJcA5/tzTaxDOP07nudp1jn/s+sixHC7MuasINFf8=";
            };

            # Build tools
            nativeBuildInputs = [ 
              pkgs.nodejs
              pkgs.pnpm
              pkgs.pnpmConfigHook
            ];

            pnpmRoot = "crates/tracey/src/bridge/http/dashboard";

            # Optimization: Skip running tracey's own unit tests during the build
            # to speed up the devShell startup time.
            doCheck = false;

            meta = {
              description = "Requirements tracing tool (pinned)";
              mainProgram = "tracey";
            };
          };

          # YOUR CUSTOM GLUE TOOL
          # Assuming this lives in your repo at /tools/doc-glue
          # doc-glue = pkgs.rustPlatform.buildRustPackage {
          #   pname = "doc-glue";
          #   version = "0.1.0";
          #   src = ./tools/doc-glue;
          #   cargoLock.lockFile = ./tools/doc-glue/Cargo.lock;
          # };
        };

        devShells.default = pkgs.mkShell {
          name = "traceable-dev";

          packages = with pkgs; [
            rustc 
            cargo 
            clippy 
            rustfmt
            config.packages.tracey
            typst
            # config.packages.doc-glue ?
            jujutsu
            cocogitto
          ];

          # Useful for rust-analyzer to find stdlib source
          RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

          shellHook = ''
            echo "------------------------------------------------"
            echo "👻 Traceable Dev Environment Active"
            echo "   Tracey: $(tracey --version) (Pinned to flake.lock)"
            echo "   Rust:   $(rustc --version)"
            echo "------------------------------------------------"
          '';
        };
      };
    };
}