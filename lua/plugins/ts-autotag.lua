return {
  'windwp/nvim-ts-autotag',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-ts-autotag').setup {
      -- Default configuration
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    }
  end,
  -- While lazy-loading isn't strictly necessary according to the docs,
  -- if you want to lazy load, you can use these events:
  event = { 'BufReadPre', 'BufNewFile' },
}
