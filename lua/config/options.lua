vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.have_nerd_font = true
-- vim.g.clipboard = {
--   name = 'OSC 52',
--   copy = {
--     ['+'] = require('vim.ui.clipboard.osc52').copy '+',
--     ['*'] = require('vim.ui.clipboard.osc52').copy '*',
--   },
--   paste = {
--     ['+'] = require('vim.ui.clipboard.osc52').paste '+',
--     ['*'] = require('vim.ui.clipboard.osc52').paste '*',
--   },
-- }
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.textwidth = 80
vim.opt.formatoptions = vim.opt.formatoptions
  + 't' -- Auto-wrap text using textwidth
  + 'c' -- Auto-wrap comments using textwidth
  + 'q' -- Allow formatting of comments with "gq"
  - 'o' -- Don't continue comments when pressing 'o' or 'O'
  + 'r' -- Continue comments when pressing Enter
  + 'n' -- Recognize numbered lists
  + 'j' -- Remove comment leader when joining lines
  + '2' -- Use indent from 2nd line of a paragraph
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
-- vim.api.nvim_set_hl(0, "Cursor", { reverse = true })
-- vim.o.guifont = "JetBrainsMono Nerd Font:h14"

-- Blinking cursor
-- vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,'
--   .. 'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,'
--   .. 'sm:block-blinkwait175-blinkoff150-blinkon175'
