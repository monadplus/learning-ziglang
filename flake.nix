{
  description = "Ziglang devtools";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    zig.url = "github:mitchellh/zig-overlay";
  };

  outputs = { self, nixpkgs, flake-utils, zig, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell =
          pkgs.mkShell {
            buildInputs = [
              # We need to match zig and zls version
              zig.packages.${system}."0.13.0"
              pkgs.zls
            ];
          };
      });
}
