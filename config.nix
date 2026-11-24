{
  inputs,
  lib,
  pkgs,
  ...
}:
{
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
          fs = lib.fileset;
        in
        fs.toSource {
          root = ./.;
          fileset = fs.unions [ ./lua ];
        };
      impure = "~/nvim-config";
    };
  };
}
