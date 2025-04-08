if not nixCats('general') then
  return
end

local prose = require('nvim-prose')

prose.setup({
  -- Default configuration
  wpm = 200.0, -- Words per minute reading speed
  filetypes = { 'markdown', 'asciidoc', 'text', 'tex' }, -- Supported filetypes
  placeholders = {
    words = 'words',
    -- minutes = 'min',
  },
})

-- If you're using lualine, you can add this configuration
-- Uncomment if you have lualine installed
-- require('lualine').setup({
--   sections = {
--     lualine_x = {
--       { prose.word_count, cond = prose.is_available },
--       { prose.reading_time, cond = prose.is_available },
--     },
--   },
-- })

-- Optional: Add keymappings for quick info display
vim.keymap.set('n', '<leader>wc', function()
  local count = prose.word_count()
  local time = prose.reading_time()
  if prose.is_available() then
    vim.notify(count .. ' words, ' .. time .. ' min reading time', vim.log.levels.INFO)
  else
    vim.notify('Prose not available for this filetype', vim.log.levels.WARN)
  end
end, { desc = 'Show word count and reading time' })
