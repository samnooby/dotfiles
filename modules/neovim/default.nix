{ username, pkgs, config, ... }:

let
  packPath = "${
      pkgs.vimUtils.packDir
      config.home-manager.users.${username}.programs.neovim.finalPackage.passthru.packpathDirs
    }/pack/myNeovimPackages/start";
in {
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      nodejs_22
      gcc14
      lua-language-server
      stylua
      shfmt
      nixfmt
      nil
      ripgrep
    ];

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      withNodeJs = true;

      # TODO: All the required lazyvim plugins
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
        telescope-nvim
        dressing-nvim
        telescope-fzf-native-nvim

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
        nvim-treesitter-textobjects
        nvim-treesitter

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

        # Copilot
        copilot-lua
        copilot-cmp
        CopilotChat-nvim

        # Clipboard
        yanky-nvim
      ];

      extraLuaConfig = ''
        vim.g.mapleader = " "
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not (vim.uv or vim.loop).fs_stat(lazypath) then
          local lazyrepo = "https://github.com/folke/lazy.nvim.git"
          local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
          if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
              { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
              { out, "WarningMsg" },
              { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
          end
        end
        vim.opt.rtp:prepend(lazypath)

        require("lazy").setup({
          performance = {
            reset_packpath = false,
            rtp = {
              reset = false,
            },
          },
          dev = {
            path = "${packPath}",
            patterns = {""},
          },
          install = {
            missing = false,
          },
          spec = {
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },
            { import = "lazyvim.plugins.extras.lsp.neoconf" },
            { import = "lazyvim.plugins.extras.lsp.none-ls" },
            { import = "lazyvim.plugins.extras.editor.telescope" },
            { import = "lazyvim.plugins.extras.coding.yanky" },
            -- Languages
            { import = "lazyvim.plugins.extras.lang.nix" },
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
