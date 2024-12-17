return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    init = function()
      require('rose-pine').setup {
        variant = 'moon', -- can be 'auto', 'main', 'moon', or 'dawn'
        dark_variant = 'main', -- used if variant = 'auto'
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
      }

      vim.cmd 'colorscheme rose-pine'
    end,
  },
}
