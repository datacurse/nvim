vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.startuptime_event_width = 0
vim.g.startuptime_tries = 10
vim.g.startuptime_exe_path = nixCats.packageBinPath

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.showmode = false
vim.opt.cmdheight = 0 -- or 1 if you still want some space

-- Set highlight on search
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Soft wrapping
vim.o.wrap = true
vim.o.linebreak = true
-- vim.o.showbreak = '↪ '
vim.o.breakindent = true
vim.opt.smoothscroll = true

-- Make line numbers default
vim.wo.number = true
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'mdx', 'text' },
  callback = function()
    -- Disable line numbers for these file types
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
  desc = 'Disable line numbers for markdown, MDX, and text files',
})

-- Enable mouse mode
vim.o.mouse = 'a'

-- Indent
-- vim.o.smarttab = true
vim.opt.cpoptions:append('I')
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.autoindent = true

-- File-specific indentation settings
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
  desc = 'Set Python-specific indent to 4 spaces',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    -- Disable 'list' option for markdown files to hide whitespace characters
    vim.opt_local.list = false
  end,
})

-- stops line wrapping from being confusing
-- vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
vim.wo.relativenumber = false

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,preview,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0
-- [[ Disable auto comment on enter ]]
-- See :help formatoptions
vim.api.nvim_create_autocmd('FileType', {
  desc = 'remove formatoptions',
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Moves Line Down' })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Moves Line Up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll Up' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next Search Result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous Search Result' })

-- Keymaps for working with buffer
vim.keymap.set('n', '<leader><leader>[', '<cmd>bprev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader><leader>]', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader><leader>l', '<cmd>b#<CR>', { desc = 'Last buffer' })
vim.keymap.set('n', '<leader><leader>d', '<cmd>bdelete<CR>', { desc = 'delete buffer' })

-- Remap for dealing with word wrap
-- Better navigation with wrapped lines
vim.keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
vim.keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
vim.keymap.set('n', '0', 'v:count == 0 ? "g0" : "0"', { expr = true, silent = true })
vim.keymap.set('n', '^', 'v:count == 0 ? "g^" : "^"', { expr = true, silent = true })
vim.keymap.set('n', '$', 'v:count == 0 ? "g$" : "$"', { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader><leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Copy Paste
vim.keymap.set({ 'v', 'x', 'n' }, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })
vim.keymap.set(
  'i',
  '<C-p>',
  '<C-r><C-p>+',
  { noremap = true, silent = true, desc = 'Paste from clipboard from within insert mode' }
)
vim.keymap.set(
  'x',
  '<leader>P',
  '"_dP',
  { noremap = true, silent = true, desc = 'Paste over selection without erasing unnamed register' }
)

-- Select
vim.keymap.set({ 'n', 'v', 'i' }, '<C-a>', '<Esc>ggVG', { desc = 'Select All' })

-- Save file with Ctrl+S (in normal, insert, and visual modes)
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<CR>', { desc = 'Save file', noremap = true, silent = true })
-- Make Ctrl+S in insert mode return to normal mode after saving
vim.keymap.set(
  'i',
  '<C-s>',
  '<Esc><cmd>w<CR>',
  { desc = 'Save file and exit insert mode', noremap = true, silent = true }
)

-- Unmap Ctrl+Q from Visual Block mode first
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>', '<Nop>', { noremap = true })

-- Now map Ctrl+Q to quit Neovim in all modes
vim.keymap.set({ 'n', 'v' }, '<C-q>', ':qa<CR>', { noremap = true })
vim.keymap.set('i', '<C-q>', '<Esc>:qa<CR>', { noremap = true })

-- -- Exit Vim with Ctrl+E
-- vim.keymap.set({ 'n', 'i', 'v' }, '<leader>e', '<cmd>q<CR>', { desc = 'Exit Vim', noremap = true, silent = true })
-- -- Make Ctrl+E in insert mode return to normal mode before quitting
-- vim.keymap.set(
--   'i',
--   '<leader>e',
--   '<Esc><cmd>q<CR>',
--   { desc = 'Exit insert mode and quit Vim', noremap = true, silent = true }
-- )

-- Remove [number] patterns
vim.keymap.set('n', '<leader>m[', ':%s/\\[\\d\\+\\]//g<CR>', { noremap = true, silent = true })
