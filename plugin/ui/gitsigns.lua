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
