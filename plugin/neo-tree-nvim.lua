if not nixCats('general') then
  return
end
require("neo-tree").setup({
  -- Only override what you need to change
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true,
  },
  window = {
    width = 30, -- Set width to 20
    auto_close = true, -- Close neo-tree when last window is closed
  },
})

-- Keep your existing keymaps
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle file explorer', silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus left', silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus right', silent = true })

-- Add autocmd to open neo-tree when Neovim starts
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
  end
})
