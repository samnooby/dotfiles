return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>fm",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Set default options
    -- default_format_opts = {
    --  lsp_format = "fallback",
    -- },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500 },
    -- Customize formatters
  },
}
