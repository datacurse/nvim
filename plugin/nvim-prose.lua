if not nixCats('general') then
  return
end

local prose = require('nvim-prose')

prose.setup({
  wpm = 200.0,
  filetypes = { 'markdown', 'asciidoc', 'tex' },
  placeholders = {
    words = 'words',
    minutes = 'min',
  },
})

-- Add keymapping for quick display
vim.keymap.set('n', '<leader>wc', function()
  if prose.is_available() then
    local count = prose.word_count()
    local time = prose.reading_time()
    vim.notify(count .. ', ' .. time .. ' reading time', vim.log.levels.INFO)
  else
    vim.notify('Prose not available for this filetype', vim.log.levels.WARN)
  end
end, { desc = 'Show word count and reading time' })
