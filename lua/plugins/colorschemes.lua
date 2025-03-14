local current_theme = 'catppuccin' 

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = current_theme == 'rose-pine',
    init = function()
      require('rose-pine').setup {
        variant = 'moon',
        dark_variant = 'main',
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
  {
    'gmr458/vscode_modern_theme.nvim',
    enabled = current_theme == 'vscode-modern',
    config = function()
      require('vscode_modern').setup {
        cursorline = true,
        transparent_background = false,
        nvim_tree_darker = true,
      }
      vim.cmd [[colorscheme vscode_modern]]
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require('catppuccin').setup {
        flavour = "macchiato"
      }
      vim.cmd [[colorscheme catppuccin]]
    end,
  }
}
