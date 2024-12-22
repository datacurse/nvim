return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
    'neovim/nvim-lspconfig', -- optional
  },

  opts = function()
    local patterns = {
      'clsx%(([^)]+)%)',
    }

    return {
      extension = {
        patterns = {
          typescript = patterns,
          javascript = patterns,
          typescriptreact = patterns,
          javascriptreact = patterns,
        },
      },
    }
  end,
}
