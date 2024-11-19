return {
  -- Other plugins
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-R>",
            next = "<M-]>",
            prev = "<M-[>",
          },
        },
        filetypes = {
          markdown = true,
          help = true,
          ["*"] = true,
        },
      })
    end,
  },
}
