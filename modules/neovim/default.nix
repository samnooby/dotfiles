{
  username,
  pkgs,
  config,
  ...
}:

let
  treesitterWithGrammers = (
    pkgs.vimPlugins.nvim-treesitter.withPlugins(p: [
      p.fish
      p.comment
    ])
  );
in
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      nodejs_22
      gcc14
    ];

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      withNodeJs = true;

      plugins = with pkgs.vimPlugins; [
        # Base lazyvim pkgs
        LazyVim
        lazy-nvim

        # Coding pkgs
        cmp-nvim-lsp
        cmp-path
        cmp-buffer
        nvim-cmp
        nvim-snippets
        friendly-snippets
        mini-pairs
        mini-ai
        ts-comments-nvim
        
        # Editor pkgs
        neo-tree-nvim
        grug-far-nvim
        flash-nvim
        gitsigns-nvim
        trouble-nvim
        todo-comments-nvim

        # Formatting
        conform-nvim

        # Linting
        nvim-lint

        # LSP
        nvim-lspconfig
        neoconf-nvim
        none-ls-nvim

        # Treesitter
        which-key-nvim
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects

        # UI
        bufferline-nvim
        lualine-nvim
        indent-blankline-nvim
        noice-nvim
        mini-icons
        nui-nvim
        dashboard-nvim

        # Util
        persistence-nvim
        plenary-nvim
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
	          { "LazyVim/LazyVim", import = "lazyvim.plugins" },
            { import = "lazyvim.plugins.extras.lsp.neoconf" },
            { import = "lazyvim.plugins.extras.lsp.none-ls" },
            { import = "plugins" },
          },
	        defaults = {
	          lazy = false,
	          version = false,
	        },
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
