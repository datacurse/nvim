if not nixCats('general') then
  return
end

local render_markdown = require('render-markdown')

render_markdown.setup({
  completions = { blink = { enabled = true } },
  heading = {
    render_modes = true,
    icons = { '󰬺  ', '󰬻  ', '󰬼  ', '󰬽  ', '󰬾  ', '󰬿  ' },
    position = 'inline',
    -- backgrounds = {},
  },
  checkbox = {
    unchecked = { icon = '󰄱 ' },
    checked = { icon = '󰄵 ' },
    custom = { todo = { rendered = ' ' } },
  },
  quote = { repeat_linebreak = true },
  pipe_table = {
    preset = 'round',
    alignment_indicator = '',
  },
  link = {
    wiki = { icon = '󰇈 ' },
    custom = {
      python = { pattern = '%.py$', icon = '󰌠 ' },
      markdown = { pattern = '%.md$', icon = '󰍔 ' },
    },
  },
  sign = { enabled = false },
  latex = { enabled = false },
})

vim.keymap.set('n', '<leader>mr', function()
  render_markdown.toggle()
end, { desc = '[M]arkdown [R]ender toggle' })

-- Get catppuccin color pallet
local C = require('catppuccin.palettes').get_palette()

-- Text color for quotes
vim.api.nvim_set_hl(0, '@markup.quote', { fg = C.text, bold = false })

-- Lavender color for links
vim.api.nvim_set_hl(0, '@markup.link.label', { fg = C.lavender, bold = false })
vim.api.nvim_set_hl(0, '@markup.link.url', { fg = C.lavender, bold = false })
vim.api.nvim_set_hl(0, 'RenderMarkdownLink', { fg = C.lavender, bold = false })
vim.api.nvim_set_hl(0, 'RenderMarkdownWikiLink', { fg = C.lavender, bold = false })

-- Text color for math
vim.api.nvim_set_hl(0, '@markup.math', { fg = C.text, bold = false })
vim.api.nvim_set_hl(0, '@markup.math.latex', { fg = C.text, bold = false })
vim.api.nvim_set_hl(0, '@function.latex', { fg = C.text, italic = false })
vim.api.nvim_set_hl(0, '@operator.latex', { fg = C.text, bold = false })
