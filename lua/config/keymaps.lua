-- Set default options for key mappings
local opts = { noremap = true, silent = true }

-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Jump to definition
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- Show references
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts) -- Go to implementation
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts) -- Go to type definition

-- Go back/forward in jump list
vim.keymap.set('n', '<C-o>', '<C-o>', opts) -- Jump back
vim.keymap.set('n', '<C-i>', '<C-i>', opts) -- Jump forward

-- LSP hover documentation
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

-- Scrolling controls that keep cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts) -- Scroll down half a page and center cursor
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts) -- Scroll up half a page and center cursor

-- Block movement in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts) -- Move selected block down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts) -- Move selected block up

-- Commented out quick save/quit mappings
-- vim.keymap.set('n', '<leader>w', ':write!<CR>', { silent = true, desc = 'Save file' })
-- vim.keymap.set('n', '<leader>q', ':q!<CR>', opts)

-- Better handling of wrapped lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true }) -- Move up respecting visual lines
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true }) -- Move down respecting visual lines

-- Maintain visual mode after indenting
vim.keymap.set('v', '<', '<gv') -- Unindent and maintain selection
vim.keymap.set('v', '>', '>gv') -- Indent and maintain selection

-- Paste operations that preserve the register
vim.keymap.set('v', 'p', '"_dp') -- Paste over selection without yanking
vim.keymap.set('v', 'P', '"_dP') -- Paste before selection without yanking

-- Special yank operation
vim.keymap.set('n', 'YY', 'va{Vy', opts) -- Yank everything between curly braces including the braces

-- Buffer navigation
vim.keymap.set('n', '<M-Right>', ':bnext<CR>', opts) -- Next buffer
vim.keymap.set('n', '<M-Left>', ':bprevious<CR>', opts) -- Previous buffer

-- Window resizing controls
vim.keymap.set('n', '+', ':vertical resize +5<CR>') -- Increase window width
vim.keymap.set('n', '-', ':vertical resize -5<CR>') -- Decrease window width
-- TODO assign better symbols
-- vim.keymap.set('n', '=', ':resize +5<CR>') -- Increase window height
-- vim.keymap.set('n', '-', ':resize -5<CR>') -- Decrease window height

-- Telescope integration
-- vim.keymap.set("n", ";", "<cmd>Telescope resume<cr>", opts)  -- Resume last telescope search
vim.keymap.set('n', '<C-s>', ':Telescope current_buffer_fuzzy_find<CR>', opts) -- Fuzzy find in current buffer

-- Text manipulation
vim.keymap.set('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>', { silent = true }) -- Split line at cursor
vim.keymap.set('n', '<C-x>', 'dd', opts) -- Cut current line
vim.keymap.set('n', '<C-a>', 'ggVG', opts) -- Select entire buffer

-- File operations
vim.keymap.set('n', '<C-n>', ':w %:h/', opts) -- Start writing file in current directory

-- Custom functions
vim.keymap.set('n', '<C-P>', ':lua require("config.utils").toggle_go_test()<CR>', opts) -- Toggle Go test

-- Clear search highlighting
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', opts)

-- Note: For delete operations, you can use:
-- w{number}dw  -- Delete forward {number} words
-- w{number}db  -- Delete backward {number} words

-- Add search navigation
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('n', '<leader>nc', ':Neotree $LOCALAPPDATA/nvim<CR>', { desc = 'Open Neovim config in Neo-tree' })

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Floating Neotree in the middle of the screen
-- vim.keymap.set('n', '<leader>e', function()
--   require('neo-tree.command').execute {
--     action = 'focus', -- OPTIONAL, this is the default value
--     source = 'filesystem', -- OPTIONAL, this is the default value
--     position = 'float',
--     toggle = true,
--     reveal = true,
--   }
-- end, { desc = 'Toggle floating Neotree' })
--
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<space>st', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 5)
end)

vim.keymap.set('n', 'ciw', '"_ciw', { noremap = true })

vim.keymap.set('n', '<leader>rn', function()
  return ':IncRename ' .. vim.fn.expand '<cword>'
end, { expr = true })
