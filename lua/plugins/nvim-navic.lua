return {
  'SmiteshP/nvim-navic',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  config = function()
    local navic = require 'nvim-navic'

    navic.setup {
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
      },
    }

    -- TypeScript setup (using tsserver)
    require('lspconfig').ts_ls.setup {
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end,
    }

    -- Elm setup
    require('lspconfig').elmls.setup {
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end,
    }
  end,
}
