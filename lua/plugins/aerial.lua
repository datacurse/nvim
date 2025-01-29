return {
  'stevearc/aerial.nvim',
  opts = {
    backends = { 'treesitter', 'lsp' },
    filter_kind = { 'Class', 'Function', 'Method' },
    layout = { default_direction = 'prefer_right' },
  },
  config = function()
    require('aerial').setup() -- Make sure setup is called!
    vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { noremap = true, silent = true })
  end,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
}
