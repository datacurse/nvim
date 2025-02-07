return {
  'edgedb/edgedb-vim',
  ft = { 'esdl', 'edgeql' },
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'esdl', 'edgeql' },
      callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
      end,
    })
  end,
}
