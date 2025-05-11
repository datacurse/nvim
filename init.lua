-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Startup time configuration (ensure nixCats is available)
vim.g.startuptime_event_width = 0
vim.g.startuptime_tries = 10
-- vim.g.startuptime_exe_path = nixCats.packageBinPath -- Ensure nixCats.packageBinPath is defined

-- Display and UI
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.showmode = false -- Hide default mode text (e.g., -- INSERT --)
vim.opt.cmdheight = 0 -- Set to 0 for minimal UI, or 1 for more space for messages

-- Search settings
vim.opt.hlsearch = true -- Highlight search results
vim.opt.inccommand = 'split' -- Preview substitutions live
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })

-- Scrolling
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above/below cursor
vim.opt.smoothscroll = true -- Enable smooth scrolling (terminal dependent)

-- Wrapping
vim.opt.wrap = true -- Enable soft wrapping of lines
vim.opt.linebreak = true -- Wrap lines at 'breakat' characters
vim.opt.breakindent = true -- Maintain indent for wrapped lines
-- vim.opt.showbreak = '↪ ' -- Character to show before wrapped lines

-- Line numbers
vim.opt.number = true -- Show line numbers by default
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'mdx', 'text' },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
  desc = 'Disable line numbers for markdown, MDX, and text files',
})

-- Mouse support
vim.opt.mouse = 'a' -- Enable mouse support in all modes

-- Indentation
vim.opt.cpoptions:append('I')
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Number of spaces a <Tab> counts for
vim.opt.softtabstop = 2 -- Number of spaces <Tab> inserts in Insert mode
vim.opt.shiftwidth = 2 -- Number of spaces for auto/manual indent
vim.opt.autoindent = true -- Copy indent from current line when starting new line

-- File-specific indentation
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
  desc = 'Disable listchars for Markdown',
})

-- Undo history
vim.opt.undofile = true -- Save undo history to a file

-- Searching behavior
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override 'ignorecase' if search pattern contains uppercase

-- UI elements
vim.opt.signcolumn = 'yes' -- Always show the signcolumn
vim.opt.relativenumber = false -- Show relative line numbers (overridden by global 'number')

-- Performance and responsiveness
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500 -- Time in ms to wait for a mapped sequence

-- Completion settings
vim.opt.completeopt = 'menu,preview,noselect' -- Completion options

-- Colors
vim.opt.termguicolors = true -- Enable 24-bit RGB colors

-- Netrw settings (built-in file explorer)
vim.g.netrw_liststyle = 0 -- Thin listing
vim.g.netrw_banner = 0 -- Disable banner

-- Disable auto comment on new lines
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*', -- Apply to all filetypes
  desc = 'Remove auto-commenting format options',
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Keymaps ]]

-- Visual mode line movement (moving selected logical lines)
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move selected lines up' })

-- Centered scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- Centered search navigation
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

-- Buffer navigation
vim.keymap.set('n', '<leader><leader>[', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader><leader>]', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader><leader>l', '<cmd>b#<CR>', { desc = 'Last used buffer' })
vim.keymap.set('n', '<leader><leader>d', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- always move by screen lines, even if you prefix a count
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

-- do the same for beginning/end of line
vim.keymap.set('n', '0', 'g0', { noremap = true, silent = true })
vim.keymap.set('n', '^', 'g^', { noremap = true, silent = true })
vim.keymap.set('n', '$', 'g$', { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader><leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Clipboard operations
vim.keymap.set({ 'v', 'x', 'n' }, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })

-- Select all
vim.keymap.set({ 'n', 'v', 'i' }, '<C-a>', '<Esc>ggVG', { desc = 'Select All' })

-- Save file
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<CR>', { desc = 'Save file', noremap = true, silent = true })
vim.keymap.set(
  'i',
  '<C-s>',
  '<Esc><cmd>w<CR>',
  { desc = 'Save file and exit insert mode', noremap = true, silent = true }
)

-- Quit Neovim / Close window
vim.keymap.set({ 'n', 'i', 'v', 't' }, '<C-q>', '<Nop>', { noremap = true, silent = true }) -- Unmap first
vim.keymap.set({ 'n', 'v' }, '<C-q>', '<cmd>quit<CR>', {
  noremap = true,
  silent = true,
  desc = 'Close window / Quit if last',
})
vim.keymap.set('i', '<C-q>', '<Esc><cmd>quit<CR>', {
  noremap = true,
  silent = true,
  desc = 'Close window / Quit if last (from Insert)',
})
vim.keymap.set('t', '<C-q>', '<C-\\><C-n><cmd>quit<CR>', {
  noremap = true,
  silent = true,
  desc = 'Exit terminal & Close window / Quit if last',
})

-- Custom command: Remove [number] patterns
vim.keymap.set(
  'n',
  '<leader>m[',
  ':%s/\\[\\d\\+\\]//g<CR>',
  { noremap = true, silent = true, desc = 'Remove [number] patterns' }
)

-- Visual mode indentation (reselects after indenting)
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true, desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true, desc = 'Indent right and reselect' })

-- Visual Selection with Wrapped Lines
-- Make V select the current visual line when wrap is enabled
vim.keymap.set('n', 'V', function()
  if vim.wo.wrap then
    -- Go to start of visual line, start charwise visual, go to end of visual line
    return 'g0vg$'
  else
    -- Default V behavior (select logical line) if wrap is off
    return 'V'
  end
end, { expr = true, silent = true, desc = 'Select visual line (if wrap on)' })

-- Make j and k extend selection by visual lines in Visual mode when wrap is enabled
vim.keymap.set('x', 'j', function()
  if vim.wo.wrap then
    return 'gj' -- Extend selection by one visual line
  else
    return 'j' -- Extend selection by one logical line
  end
end, { expr = true, silent = true, desc = 'Extend selection down by visual line' })

vim.keymap.set('x', 'k', function()
  if vim.wo.wrap then
    return 'gk' -- Extend selection by one visual line
  else
    return 'k' -- Extend selection by one logical line
  end
end, { expr = true, silent = true, desc = 'Extend selection up by visual line' })

-- Toggle case without moving cursor (improved version)
vim.keymap.set('n', '~', function()
  local col = vim.fn.col('.')
  local line = vim.fn.line('.')
  vim.cmd('normal! ~')
  vim.fn.cursor(line, col)
end, { noremap = true, desc = 'Toggle case without moving cursor' })
