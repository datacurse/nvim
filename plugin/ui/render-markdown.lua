if not nixCats('general') then
  return
end

local render_markdown = require('render-markdown')

render_markdown.setup({
  only_render_image_at_cursor = true,
  file_types = { 'markdown' },
  completions = { blink = { enabled = true } },

  heading = {
    render_modes = true,
    icons = { '󰬺  ', '󰬻  ', '󰬼  ', '󰬽  ', '󰬾  ', '󰬿  ' },
    position = 'inline',
    -- signs = { '󰫎 ' },
    sign = false,
    backgrounds = {},
  },

  code = {
    sign = false,
  },

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
    custom = {
      python = {
        pattern = '%.py$',
        icon = '󰌠 ',
      },
    },
  },

  --
  -- -- -- LaTeX support configuration
  -- -- latex = {
  -- --   enabled = true,
  -- --   conceal = { enabled = true },
  -- --   renderer = "pylatexenc",
  -- -- },
  --

  --
  -- -- Org-mode like indent guide
  -- indent = {
  --   enabled = true,
  --   icon = '│', -- Vertical bar for indent guide
  --   color = { enabled = true },
  -- },
  --
  -- -- Completions
  -- completions = {
  --   lsp = { enabled = true }, -- In-process LSP completions
  --   blink = { enabled = true }, -- Blink.cmp integration
  -- },
  --
  -- -- Window options when in rendered mode
  -- window_options = {
  --   conceallevel = 3, -- Hide characters for concealed elements
  --   wrap = true, -- Enable line wrapping for better readability
  --   linebreak = true, -- Break lines at word boundaries
  -- },
})

-- Set up keymaps for toggling rendering
vim.keymap.set('n', '<leader>mr', function()
  render_markdown.toggle()
end, { desc = '[M]arkdown [R]ender toggle' })

-- Optional additional keymaps for specific functions
vim.keymap.set('n', '<leader>me', function()
  render_markdown.expand()
end, { desc = '[M]arkdown [E]xpand anti-conceal margin' })

vim.keymap.set('n', '<leader>mc', function()
  render_markdown.contract()
end, { desc = '[M]arkdown [C]ontract anti-conceal margin' })
