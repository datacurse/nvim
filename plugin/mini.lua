if not nixCats('general') then
  return
end

require('mini.pairs').setup()
require('mini.icons').setup()
require('mini.ai').setup()
require('mini.files').setup({
  mappings = {
    close       = 'q',
    go_in       = 'l',
    go_in_plus  = 'L',
    go_out      = 'h',
    go_out_plus = 'H',
    mark_goto   = "'",
    mark_set    = 'm',
    reset       = '<BS>',
    reveal_cwd  = '@',
    show_help   = 'g?',
    synchronize = '=',
    trim_left   = '<',
    trim_right  = '>',
  },
})
vim.keymap.set("n", "<leader>-", function() MiniFiles.open() end, { desc = 'mini.files explorer' })

