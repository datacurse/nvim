if not nixCats('general') then
  return
end

require('gitsigns').setup({
  -- See `:help gitsigns.txt`
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' },
    topdelete = { text = '-' },
    changedelete = { text = '~' },
  },
})
-- vim.cmd([[hi GitSignsAdd guifg=#04de21]])
-- vim.cmd([[hi GitSignsChange guifg=#83fce6]])
-- vim.cmd([[hi GitSignsDelete guifg=#fa2526]])
