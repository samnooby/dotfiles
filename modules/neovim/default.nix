{
  username,
  pkgs,
  config,
  ...
}:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      nodejs_22
    ];

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      withNodeJs = true;

      plugins = with pkgs.vimPlugins; [
        lazy-nvim
        which-key-nvim
      ];

      extraLuaConfig = ''
        vim.g.mapleader = " "
        require("lazy").setup({
          performance = {
            reset_packpath = false,
            rtp = {
              reset = false,
            },
          },
          dev = {
            path = "${
              pkgs.vimUtils.packDir
                config.home-manager.users.${username}.programs.neovim.finalPackage.passthru.packpathDirs
            }/pack/myNeovimPackages/start",
            patterns = {""},
          },
          install = {
            missing = false,
          },
          spec = {
            { import = "plugins" },
          }
        })
      '';
    };

    home.file."./.config/nvim/" = {
     source = ./config;
     recursive = true;
    };
  };

  environment.variables.EDITOR = "nvim";
}
