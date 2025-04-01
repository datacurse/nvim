if not nixCats('general') then
  return
end
require('snacks').setup({
  dashboard = {
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1, padding = 1 },
    },
    header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
  },
  gitbrowse = {},
  input = {},
  lazygit = {},
  terminal = {
    shell = '/run/current-system/sw/bin/fish',
  },
  explorer = {
    replace_netrw = true,
  },
  picker = {
    sources = {
      explorer = {
        layout = {
          layout = {
            width = 24,
          },
        },
      },
    },
  },
  bigfile = {},
  image = {
    enabled = true,
    doc = {
      enabled = true,
      inline = true,
      float = true,
      conceal = function(lang, type)
        return false
      end,
    },
  },
  rename = {},
  notifier = {},
  indent = {
    animate = { enabled = false },
    filter = function(buf)
      -- Get the filetype of the buffer
      local ft = vim.bo[buf].filetype

      -- Skip indent guides for markdown files
      if ft == 'markdown' then
        return false
      end

      -- Otherwise, use the default filter logic
      return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ''
    end,
  },
  scope = {},
  styles = {
    terminal = {
      keys = {
        term_normal = {
          '<esc>',
          function()
            vim.cmd('stopinsert')
          end,
          mode = 't',
          desc = 'Single escape to normal mode',
        },
      },
    },
  },
  -- statuscolumn = {},
})

-- terminal
vim.keymap.set('n', '<c-\\>', function()
  Snacks.terminal.open()
end, { desc = 'Snacks Terminal' })
-- lazygit
vim.keymap.set('n', '<leader>lg', function()
  Snacks.lazygit.open()
end, { desc = 'Snacks LazyGit' })
-- picker
vim.keymap.set('n', '<leader>sf', function()
  Snacks.picker.smart()
end, { desc = 'Smart Find Files' })
vim.keymap.set('n', '<leader><leader>s', function()
  Snacks.picker.buffers()
end, { desc = 'Search Buffers' })
-- find
vim.keymap.set('n', '<leader>ff', function()
  Snacks.picker.files()
end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', function()
  Snacks.picker.git_files()
end, { desc = 'Find Git Files' })
-- Grep
vim.keymap.set('n', '<leader>sb', function()
  Snacks.picker.lines()
end, { desc = 'Buffer Lines' })
vim.keymap.set('n', '<leader>sB', function()
  Snacks.picker.grep_buffers()
end, { desc = 'Grep Open Buffers' })
vim.keymap.set('n', '<leader>sg', function()
  Snacks.picker.grep()
end, { desc = 'Grep' })
vim.keymap.set({ 'n', 'x' }, '<leader>sw', function()
  Snacks.picker.grep_word()
end, { desc = 'Visual selection or word' })
-- search
vim.keymap.set('n', '<leader>sb', function()
  Snacks.picker.lines()
end, { desc = 'Buffer Lines' })
vim.keymap.set('n', '<leader>sd', function()
  Snacks.picker.diagnostics()
end, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>sD', function()
  Snacks.picker.diagnostics_buffer()
end, { desc = 'Buffer Diagnostics' })
vim.keymap.set('n', '<leader>sh', function()
  Snacks.picker.help()
end, { desc = 'Help Pages' })
vim.keymap.set('n', '<leader>sj', function()
  Snacks.picker.jumps()
end, { desc = 'Jumps' })
vim.keymap.set('n', '<leader>sk', function()
  Snacks.picker.keymaps()
end, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>sl', function()
  Snacks.picker.loclist()
end, { desc = 'Location List' })
vim.keymap.set('n', '<leader>sm', function()
  Snacks.picker.marks()
end, { desc = 'Marks' })
vim.keymap.set('n', '<leader>sM', function()
  Snacks.picker.man()
end, { desc = 'Man Pages' })
vim.keymap.set('n', '<leader>sq', function()
  Snacks.picker.qflist()
end, { desc = 'Quickfix List' })
vim.keymap.set('n', '<leader>sR', function()
  Snacks.picker.resume()
end, { desc = 'Resume' })
vim.keymap.set('n', '<leader>su', function()
  Snacks.picker.undo()
end, { desc = 'Undo History' })

-- Explorer
vim.keymap.set('n', '<leader>e', function()
  Snacks.explorer.open()
end, { desc = 'Open Explorer' })
vim.keymap.set('n', '<leader>r', function()
  Snacks.explorer.reveal()
end, { desc = 'Reveal in Explorer' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Navigate to left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Navigate to right window' })

-- Close explorer on file quit
vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    local snacks_windows = {}
    local floating_windows = {}
    local windows = vim.api.nvim_list_wins()
    for _, w in ipairs(windows) do
      local filetype = vim.api.nvim_get_option_value('filetype', { buf = vim.api.nvim_win_get_buf(w) })
      if filetype:match('snacks_') then
        table.insert(snacks_windows, w)
      elseif vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_windows, w)
      end
    end
    if
      1 == #windows - #floating_windows - #snacks_windows
      and vim.api.nvim_win_get_config(vim.api.nvim_get_current_win()).relative == ''
    then
      for _, w in ipairs(snacks_windows) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

-- Setup keymaps for gitbrowse
vim.keymap.set('n', '<leader>go', function()
  -- Open the current file in the repo browser
  require('snacks').gitbrowse({
    what = 'file', -- Open the current file
    notify = true, -- Show notification on open
  })
end, { desc = 'Open file in Git browser' })

vim.keymap.set('n', '<leader>gr', function()
  -- Open the repo itself
  require('snacks').gitbrowse({
    what = 'repo', -- Open the repository root
    notify = true, -- Show notification on open
  })
end, { desc = 'Open repo in Git browser' })

vim.keymap.set('n', '<leader>t', function()
  -- Toggle a bottom terminal
  require('snacks').terminal.toggle(nil, {
    position = 'bottom',
    height = 0.3,
    start_insert = true,
  })
end, { desc = 'Toggle bottom terminal' })
