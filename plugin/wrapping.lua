if not nixCats('general') then
  return
end

require('wrapping').setup({
  auto_set_mode_heuristically = true,
  auto_set_mode_filetype_allowlist = {
    'asciidoc',
    'gitcommit',
    'latex',
    'mail',
    'markdown',
    'rst',
    'tex',
    'text',
  },
  softener = { markdown = 1.2 },
  create_commands = true,
  notify_on_switch = false,
  hard_wrap_column = 80,
})

vim.keymap.set('n', '<leader>wt', function()
  require('wrapping').toggle_wrap_mode()
end, { desc = 'Toggle wrap mode (soft/hard)' })
