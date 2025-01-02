return {
  'goolord/alpha-nvim',
  enabled = true,
  event = 'VimEnter',
  opts = function()
    local dashboard = require 'alpha.themes.dashboard'
    local header = {
      [[                                   ]],
      [[    Hello Loki. Ready to kill?     ]],
      [[                                   ]],
    }
    local project_dirs = {
      ['0'] = '~/code/valtio-chess/',
      ['1'] = '~/code/quickstart/',
    }
    local buttons = {}
    for key, path in pairs(project_dirs) do
      local button_text = path
      table.insert(buttons, dashboard.button(key, button_text, ':cd ' .. path .. ' | Telescope find_files<CR>'))
    end
    table.insert(buttons, dashboard.button('q', ' Quit', ':qa<CR>'))
    dashboard.section.header.val = header
    dashboard.section.buttons.val = buttons
    dashboard.section.buttons.opts.hl = 'CustomAlphaButtons'
    dashboard.opts.layout[1].val = 2
    return dashboard
  end,
  config = function(_, dashboard)
    require('alpha').setup(dashboard.opts)
  end,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
}
