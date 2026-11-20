{ inputs }:
let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;

  forAllSupportedSystems = lib.genAttrs [
    "x86_64-linux"
    "aarch64-linux"
  ];

  pkgsFor = system: nixpkgs.legacyPackages.${system} or (import nixpkgs { inherit system; });
in
{
  inherit forAllSupportedSystems pkgsFor;
}
