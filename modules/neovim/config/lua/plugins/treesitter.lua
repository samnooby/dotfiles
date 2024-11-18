return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  main = "nvim-treesitter.configs",
  dev = true,
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
