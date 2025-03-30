if not nixCats('general') then
  return
end

local render_markdown = require('render-markdown')

render_markdown.setup({
  -- Basic configuration
  only_render_image_at_cursor = true,
  file_types = { 'markdown' }, -- Add "vimwiki" here if you use it

  -- Heading configuration
  headings = {
    icons = { '󰲠 ', '󰲢 ', '󰲤 ', '󰲦 ', '󰲨 ', '󰲪 ' },
    background = { enabled = true },
    border = { enabled = true },
    padding = { enabled = true },
  },

  -- Code blocks configuration
  code_blocks = {
    icon = { enabled = true },
    background = { enabled = true },
    border = { enabled = true, thickness = 1 },
    padding = { enabled = true },
  },

  -- List bullet configuration
  bullets = {
    icons = { '•', '◦', '⦿' }, -- You can customize these icons
    enabled = true,
    color = { enabled = true },
  },

  -- Checkbox configuration
  checkboxes = {
    enabled = true,
    icons = {
      -- Default checkboxes with customizable icons
      { pattern = '%[ %]', icon = '☐', highlight = 'RenderMarkdownUnchecked' },
      { pattern = '%[x%]', icon = '☑', highlight = 'RenderMarkdownChecked' },
      -- Additional custom checkbox states
      { pattern = '%[/%]', icon = '⚀', highlight = 'RenderMarkdownTodo' },
      { pattern = '%[>%]', icon = '➡️', highlight = 'RenderMarkdownTodo' },
      { pattern = '%[!%]', icon = '⚠️', highlight = 'RenderMarkdownWarn' },
    },
  },

  -- Block quote configuration
  quotes = {
    enabled = true,
    icon = '▌', -- Block quote marker
    color = { enabled = true },
    line_breaks = { enabled = true },
  },

  -- Table configuration
  table = {
    border = { enabled = true },
    color = { enabled = true },
    alignment = { enabled = true },
    auto_align = { enabled = true },
  },

  -- Callout configuration
  callouts = {
    enabled = true,
    -- Default callout types
    icons = {
      note = { icon = '󰎚', highlight = 'RenderMarkdownInfo' },
      info = { icon = '󰋼', highlight = 'RenderMarkdownInfo' },
      tip = { icon = '󰌵', highlight = 'RenderMarkdownHint' },
      important = { icon = '󰀘', highlight = 'RenderMarkdownHint' },
      warning = { icon = '󰀦', highlight = 'RenderMarkdownWarn' },
      caution = { icon = '󰀪', highlight = 'RenderMarkdownWarn' },
      danger = { icon = '󰚌', highlight = 'RenderMarkdownError' },
      success = { icon = '󰄭', highlight = 'RenderMarkdownSuccess' },
      question = { icon = '󰮔', highlight = 'RenderMarkdownInfo' },
      todo = { icon = '󰄬', highlight = 'RenderMarkdownSuccess' },
      failure = { icon = '󰅙', highlight = 'RenderMarkdownError' },
      bug = { icon = '󰃤', highlight = 'RenderMarkdownError' },
      example = { icon = '󰛄', highlight = 'RenderMarkdownInfo' },
      quote = { icon = '󰅀', highlight = 'RenderMarkdownQuote' },
    },
  },

  -- Links configuration
  links = {
    enabled = true,
    icon = '🔗',
    color = { enabled = true },
  },

  -- -- LaTeX support configuration
  -- latex = {
  --   enabled = true,
  --   conceal = { enabled = true },
  --   renderer = "pylatexenc",
  -- },

  -- Horizontal break line
  dashed_line = {
    enabled = true,
    icon = '─', -- You can use other characters like "•" or "━"
    color = { enabled = true },
  },

  -- Org-mode like indent guide
  indent = {
    enabled = true,
    icon = '│', -- Vertical bar for indent guide
    color = { enabled = true },
  },

  -- Completions
  completions = {
    lsp = { enabled = true }, -- In-process LSP completions
    blink = { enabled = true }, -- Blink.cmp integration
  },

  -- Window options when in rendered mode
  window_options = {
    conceallevel = 3, -- Hide characters for concealed elements
    wrap = true, -- Enable line wrapping for better readability
    linebreak = true, -- Break lines at word boundaries
  },
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
