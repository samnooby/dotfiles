return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function() end
    }
  },
  -- Disable theming, controled by stylix
  { "folke/lazydev.nvim", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin", enabled = false },
  -- Disable mason package manager, instead using nix
  { "williamboman/mason.nvim", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
  -- Seems to only add support for a luvit package
  { "Bilal2453/luvit-meta", enabled = false },
  -- Treesitter html and jsx plugin (Useless for now)
  { "windwp/nvim-ts-autotag", enabled = false },
}
