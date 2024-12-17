return {
  'andrewferrier/wrapping.nvim',
  config = function()
    require('wrapping').setup {
      softener = {
        default = false, -- Add the required default field
        markdown = false,
        text = false,
      },
      -- Add the required set_nvim_opt_defaults option
      set_nvim_opt_defaults = true,
      notify_on_switch = true,
      auto_set_mode_filetype_allowlist = {
        'asciidoc',
        'gitcommit',
        'latex',
        'mail',
        'markdown',
        'text',
      },
      create_commands = true,
    }

    -- Create an autocommand to set proper formatting for specific filetypes
    vim.api.nvim_create_autocmd({ 'FileType' }, {
      pattern = { 'markdown', 'text' },
      callback = function()
        vim.opt_local.textwidth = 80
        vim.opt_local.formatoptions = vim.opt_local.formatoptions
          + 't' -- Auto-wrap text using textwidth
          + 'c' -- Auto-wrap comments using textwidth
          + 'q' -- Allow formatting of comments with "gq"
      end,
    })
  end,
}
