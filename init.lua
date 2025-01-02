-- Set leader key before loading any other configuration
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Then load the rest of the configuration
require 'config.keymaps'
require 'config.options'
require 'config.autocmds'
require 'config.lazy'
