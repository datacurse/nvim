if not nixCats('general') then
  return
end

require('lazygit')

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
