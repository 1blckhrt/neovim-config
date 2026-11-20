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
          default = inputs.mnw.lib.wrap pkgs {
            neovim = pkgs.neovim-unwrapped;
            luaFiles = [ ./init.lua ];
            plugins = {
              start = [
                pkgs.vimPlugins.lazy-nvim
                pkgs.vimPlugins.plenary-nvim
              ];

              dev.myconfig = {
                pure =
                  let
                    fs = inputs.nixpkgs.lib.fileset;
                  in
                  fs.toSource {
                    root = ./.;
                    fileset = fs.unions [ ./lua ];
                  };
                impure = "~/nvim-config";
              };
            };
          };
          dev = self.packages.${system}.default.devMode;
        }
      );
    };
}
