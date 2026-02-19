{ pkgs ? import <nixpkgs> {} }:

let
  devenv = import (builtins.fetchTarball "https://github.com/cachix/devenv/archive/v1.0.5.tar.gz");

  traceySrc = builtins.fetchGit {
    url = "https://github.com/spynnn-org/tracey"; 
    # rev = "..."; 
  };

in devenv.lib.mkShell {
  inherit pkgs;
  
  inputs = { 
    nixpkgs = pkgs;
    tracey-src = traceySrc;
  };
  
  modules = [
    ./devenv.nix

    ({ ... }: {
      _module.args.self = {
        outPath = ./.;
        # You might need this if you rely on dirty/clean state, 
        # otherwise 0 is fine for a shell.
        lastModified = 0; 
      };
    })
  ];
}