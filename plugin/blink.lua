if not nixCats('general') then
  return
end

require('blink.cmp').setup({
  -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- See :h blink-cmp-config-keymap for configuring keymaps
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono',
  },
  signature = { enabled = true },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  -- Disable autocompletion for specific filetypes
  enabled = function()
    local disabled_filetypes = { 'markdown', 'text', 'tex', 'plaintex', 'md', 'txt' }
    local current_filetype = vim.bo.filetype

    for _, ft in ipairs(disabled_filetypes) do
      if ft == current_filetype then
        return false
      end
    end

    return true
  end,
})
