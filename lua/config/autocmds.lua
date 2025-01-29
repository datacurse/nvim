local api = vim.api

api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- auto close brackets
api.nvim_create_autocmd('FileType', { pattern = 'man', command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup('CursorLine', { clear = true })
api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  pattern = '*',
  command = 'set cursorline',
  group = cursorGrp,
})
api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, { pattern = '*', command = 'set nocursorline', group = cursorGrp })

-- resize neovim split when terminal is resized
vim.api.nvim_command 'autocmd VimResized * wincmd ='

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- Configure indentation for specific filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'mdx', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'tsx', 'jsx', 'json', 'yaml', 'html', 'css', 'scss', 'lua', 'elm' },
  callback = function()
    vim.opt_local.expandtab = true -- Convert tabs to spaces
    vim.opt_local.tabstop = 2 -- How many columns a tab counts for
    vim.opt_local.shiftwidth = 2 -- Size of an indent
    vim.opt_local.softtabstop = 2 -- How many columns when you press Tab
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'rust', 'go' },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Auto-format Elm files on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.elm',
  callback = function()
    vim.cmd 'silent! !elm-format --yes %' -- formats the current file
  end,
})

-- vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
--   pattern = { '*.mdx' },
--   callback = function()
--     -- some folks use "markdown.mdx", others "mdx"—adjust as you like
--     vim.bo.filetype = 'markdown.mdx'
--   end,
-- })

vim.api.nvim_create_autocmd('SwapExists', {
  pattern = '*',
  callback = function()
    vim.v.swapchoice = 'e' -- Automatically select "Edit Anyway"
  end,
})
