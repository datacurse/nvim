if not nixCats('general') then
  return
end

-- Only set Wrapwidth for specific filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'mdx', 'text' },
  callback = function()
    vim.cmd('Wrapwidth 80')
  end,
})
