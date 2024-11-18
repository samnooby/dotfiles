local parser_install_dir = vim.fn.stdpath("data") .. "/nvim/nix/treesitters/"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:append(parser_install_dir)

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      parser_install_dir = parser_install_dir,
      ensure_installed = {},
    },
  },
}
