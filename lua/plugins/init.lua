return {
  {
    'LazyVim/LazyVim',
    opts = function(_, opts)
      -- add keymaps
      opts.keys = opts.keys or {}
      vim.list_extend(opts.keys, {
        { '<C-a>', 'ggVG', mode = 'n', desc = 'Select all text' },
        { '<C-a>', '<Esc>ggVG', mode = 'v', desc = 'Select all text' },
        { '<C-a>', '<Esc>ggVG', mode = 'i', desc = 'Select all text' },
      })
    end,
  },
}
