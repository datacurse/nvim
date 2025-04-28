if not nixCats('general') then
  return
end

-- Setup grug-far.nvim
require('grug-far').setup({
  -- Default engine is 'ripgrep'
  engine = 'ripgrep',

  -- Basic UI configuration
  ui = {
    width = 0.7, -- Width of the grug-far window as percentage of screen
    position = 'right', -- Position of the split
    keywordPreview = {
      maxHeight = 10, -- Maximum height of the keyword preview
    },
  },

  -- Search behavior
  search = {
    debounceMs = 300, -- Debounce time for auto search
    minChars = 3, -- Minimum characters before auto search triggers
  },

  -- Customize behavior
  instanceName = 'far', -- For toggling and tracking instances
  historyFile = vim.fn.stdpath('data') .. '/grug-far-history.txt',
  autoSaveHistory = true,
})

-- Set up keybindings following your pattern
-- Main finder
vim.keymap.set('n', '<leader>fr', function()
  require('grug-far').open()
end, { desc = 'Open Grug Find and Replace' })

-- Search word under cursor
vim.keymap.set('n', '<leader>fw', function()
  require('grug-far').open({
    prefills = { search = vim.fn.expand('<cword>') },
  })
end, { desc = 'Find word under cursor' })

-- Make sure localleader is set for the plugin's internal keybindings
vim.g.maplocalleader = ','
