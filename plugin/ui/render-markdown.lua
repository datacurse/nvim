if not nixCats('general') then
  return
end

local render_markdown = require('render-markdown')

render_markdown.setup({
  file_types = { 'markdown' },
  only_render_image_at_cursor = true,
  completions = { blink = { enabled = true } },
  heading = {
    render_modes = true,
    icons = { '󰬺  ', '󰬻  ', '󰬼  ', '󰬽  ', '󰬾  ', '󰬿  ' },
    position = 'inline',
    backgrounds = {},
  },
  code = {},
  dash = {},
  bullet = {
    icons = { '●', '○', '◆', '◇' },
  },
  checkbox = {
    unchecked = {
      icon = '󰄱 ',
      highlight = 'RenderMarkdownUnchecked',
    },
    checked = {
      icon = '󰄵 ',
      highlight = 'RenderMarkdownChecked',
    },
    custom = {
      todo = { raw = '[-]', rendered = ' ', highlight = 'RenderMarkdownTodo' },
    },
  },
  quote = {
    repeat_linebreak = true,
  },
  pipe_table = {
    preset = 'round',
    alignment_indicator = '',
  },
  callout = {},
  link = {
    highlight = 'RenderMarkdownLink',
    wiki = {
      icon = '󰇈 ',
      highlight = 'RenderMarkdownWikiLink',
    },
    custom = {
      python = {
        pattern = '%.py$',
        icon = '󰌠 ',
      },
      markdown = {
        pattern = '%.md$',
        icon = '󰍔 ',
      },
    },
  },
  sign = { enabled = false },
  indent = { enabled = false },
  latex = { enabled = false },
})

vim.keymap.set('n', '<leader>mr', function()
  render_markdown.toggle()
end, { desc = '[M]arkdown [R]ender toggle' })

local C = require('catppuccin.palettes').get_palette()
vim.api.nvim_set_hl(0, '@markup.quote', { fg = C.text, bold = false })
vim.api.nvim_set_hl(0, '@markup.link.label', { fg = C.lavender, bold = false })
vim.api.nvim_set_hl(0, '@markup.link.url', { fg = C.lavender, bold = false })
vim.api.nvim_set_hl(0, 'RenderMarkdownLink', { fg = C.lavender, bold = false })
vim.api.nvim_set_hl(0, 'RenderMarkdownWikiLink', { fg = C.lavender, bold = false })
