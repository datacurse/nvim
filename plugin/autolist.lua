if not nixCats('general') then
  return
end

-- Setup autolist.nvim
require('autolist').setup({
  enabled = true,
  colon = {
    indent = true, -- if in list and line ends in `:` then create list
    indent_raw = true, -- above, but doesn't need to be in a list to work
    preferred = '-', -- what the new list starts with (can be `1.` etc)
  },
  cycle = {
    '-', -- unordered list marker
    '*', -- alternative unordered marker
    '1.', -- ordered list (numbers)
    '1)', -- ordered list with parenthesis
    'a)', -- ordered list with lowercase letters
    'I.', -- ordered list with uppercase Roman numerals
  },
  lists = {
    -- List patterns for different filetypes
    markdown = {
      '[-+*]', -- unordered lists
      '%d+[.)]', -- numbered lists (1. or 1))
      '%a[.)]', -- letter lists (a) or a.)
      '%u*[.)]', -- Roman numeral lists (I. or I))
    },
    text = {
      '[-+*]',
      '%d+[.)]',
      '%a[.)]',
      '%u*[.)]',
    },
    tex = { '\\item' },
    plaintex = { '\\item' },
    norg = {
      '%-',
      '%-%-',
      '%-%-%-',
      '%-%-%-%-',
      '%-%-%-%-%-',
    },
  },
  checkbox = {
    left = '%[', -- the left checkbox delimiter
    right = '%]', -- the right checkbox delimiter
    fill = 'x', -- the checkbox fill character
  },
})

-- Key mappings
vim.keymap.set('i', '<tab>', '<cmd>AutolistTab<cr>')
vim.keymap.set('i', '<s-tab>', '<cmd>AutolistShiftTab<cr>')
vim.keymap.set('i', '<CR>', '<CR><cmd>AutolistNewBullet<cr>')
vim.keymap.set('n', 'o', 'o<cmd>AutolistNewBullet<cr>')
vim.keymap.set('n', 'O', 'O<cmd>AutolistNewBulletBefore<cr>')
vim.keymap.set('n', '<CR>', '<cmd>AutolistToggleCheckbox<cr><CR>')
vim.keymap.set('n', '<C-r>', '<cmd>AutolistRecalculate<cr>')

-- Cycle list types with dot-repeat
vim.keymap.set('n', '<leader>cn', require('autolist').cycle_next_dr, { expr = true })
vim.keymap.set('n', '<leader>cp', require('autolist').cycle_prev_dr, { expr = true })

-- Functions to recalculate list on edit
vim.keymap.set('n', '>>', '>><cmd>AutolistRecalculate<cr>')
vim.keymap.set('n', '<<', '<<<cmd>AutolistRecalculate<cr>')
vim.keymap.set('n', 'dd', 'dd<cmd>AutolistRecalculate<cr>')
vim.keymap.set('v', 'd', 'd<cmd>AutolistRecalculate<cr>')
