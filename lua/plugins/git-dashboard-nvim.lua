return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    { 'juansalvatore/git-dashboard-nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  opts = function()
    local ascii_heatmap = require('git-dashboard-nvim').setup {}

    local opts = {
      theme = 'doom',
      config = {
        header = ascii_heatmap,
        center = {
          { action = '', desc = '', icon = '', key = 'n' },
        },
        footer = function()
          return {}
        end,
      },
    }
    return opts
  end,
}
