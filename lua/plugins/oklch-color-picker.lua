return {
  'eero-lehtinen/oklch-color-picker.nvim',
  event = 'VeryLazy',
  version = '*',
  keys = {
    -- One handed keymap recommended, you will be using the mouse
    {
      '<leader>cp',
      function()
        require('oklch-color-picker').pick_under_cursor()
      end,
      desc = 'Color pick under cursor',
    },
  },
  ---@type oklch.Opts
  opts = {
    highlight = {
      enabled = true,
      edit_delay = 60, -- async delay in ms
      scroll_delay = 0, -- async delay in ms
      -- options: 'background'|'foreground'|'virtual_left'|'virtual_right'|'virtual_eol'
      style = 'background',
      -- '● ' also looks nice (space can be removed if using monospace nerd symbols)
      virtual_text = '■ ',
      priority = 500,
    },
  },
}
