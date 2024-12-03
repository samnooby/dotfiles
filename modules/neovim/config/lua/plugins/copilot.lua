return {
  {
    "hrsh7th/nvim-cmp",
    keys = {
      { "<CR>", false },
      {
        "<C-e>",
        function()
          LazyVim.cmp.confirm({ select = true })
        end,
      },
    },
  },
}
