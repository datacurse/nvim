if not nixCats('general') then
  return
end

local colorscheme = 'catppuccin'

require('catppuccin').setup({
  flavour = 'mocha', -- latte, frappe, macchiato, mocha
  transparent_background = false,
  term_colors = false,
  integrations = {
    blink_cmp = true,
    gitsigns = true,
    markdown = true,
    mini = {
      enabled = true,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
        ok = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
        ok = { 'underline' },
      },
      inlay_hints = {
        background = true,
      },
    },
    render_markdown = true,
    snacks = {
      enabled = false,
    },
    treesitter = true,
    which_key = true,
  },
})

vim.cmd.colorscheme(colorscheme)
