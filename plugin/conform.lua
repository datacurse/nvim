if not nixCats("general") then
  return
end

local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    nix = { "nixfmt" },
  },
  formatters = {
    -- Configure formatters to use buffer-local indent settings
    stylua = {
      prepend_args = function()
        return {
          "--indent-type",
          "Spaces",
          "--indent-width",
          vim.bo.shiftwidth,
        }
      end,
    },
    black = {
      prepend_args = function()
        return {
          "--line-length=88",
          -- Black automatically uses 4 spaces for Python, so no need to configure indent
        }
      end,
    },
  },
})

vim.keymap.set({ "n", "v" }, "<leader>FF", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "[F]ormat [F]ile" })
