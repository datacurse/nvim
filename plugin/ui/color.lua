if not nixCats('general') then
  return
end

local colorscheme = 'catppuccin'

require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = false,
  term_colors = false,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    which_key = true,
  }
})

vim.cmd.colorscheme(colorscheme)
