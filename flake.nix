{
  description = "";

  outputs =
    { self, ... }@args:
    let
      inputs = (import ./.tack) { overrides = args.tackOverrides or { }; };

      inherit (import ./lib.nix { inherit inputs; }) forAllSupportedSystems pkgsFor;
    in
    {
      formatter = forAllSupportedSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        pkgs.writeShellApplication {
          name = "format";
          runtimeInputs = builtins.attrValues {
            inherit (pkgs)
              nixfmt
              deadnix
              statix
              fd
              stylua
              ;
          };
          text = ''
            fd "$@" -t f -e nix -x statix fix -- '{}'
            fd "$@" -t f -e nix -X deadnix -e -- '{}' \; -X nixfmt '{}'
            fd "$@" -t f -e lua -X stylua --indent-type Spaces --indent-width 2 '{}'
          '';
        }
      );

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
