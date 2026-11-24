{
  description = "";

  outputs =
    { self, ... }@args:
    let
      inputs = (import ./.tack) { overrides = args.tackOverrides or { }; };

      inherit (import ./lib.nix { inherit inputs; }) forAllSupportedSystems pkgsFor;
    in
    {
      packages = forAllSupportedSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        {
          default = self.packages.${system}.neovim;
          dev = self.packages.${system}.default.devMode;
          neovim = inputs.mnw.lib.wrap { inherit pkgs inputs; } ./config.nix;
        }
      );
    };
}
