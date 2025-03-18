return {
  "nvim-neorg/neorg",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter", -- recommended for parser support
  },
  lazy = false,         -- load at startup
  version = "*",        -- use the latest stable version
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},      -- load default modules
        ["core.concealer"] = {},       -- new module name for concealer
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
            index = "index.norg",
          },
        },
      },
    })
  end,
  ft = { "norg" }, -- optionally load only for .norg files
}

