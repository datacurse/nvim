if not nixCats('general') then
  return
end
require("snacks").setup({
  terminal = {},
  lazygit = {},
  picker = {
    sources = {
      explorer = {
        -- Explorer picker configuration (optional)
      }
    }
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
  indent = {},
  gitbrowse = {},
  scope = {},
  explorer = {
    replace_netrw = true, -- Replace netrw with the snacks explorer
  }
})

-- terminal
vim.keymap.set("n", "<c-\\>", function() Snacks.terminal.open() end, { desc = 'Snacks Terminal' })
-- lazygit
vim.keymap.set("n", "<leader>lg", function() Snacks.lazygit.open() end, { desc = 'Snacks LazyGit' })
-- picker
vim.keymap.set('n', "<leader>sf", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set('n', "<leader><leader>s", function() Snacks.picker.buffers() end, { desc = "Search Buffers" })
-- find
vim.keymap.set('n', "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set('n', "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
-- Grep
vim.keymap.set('n', "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set('n', "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
vim.keymap.set('n', "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
-- search
vim.keymap.set('n', "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set('n', "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set('n', "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
vim.keymap.set('n', "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set('n', "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set('n', "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set('n', "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
vim.keymap.set('n', "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set('n', "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
vim.keymap.set('n', "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set('n', "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
vim.keymap.set('n', "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })

-- Explorer
vim.keymap.set('n', "<leader>e", function() Snacks.explorer.open() end, { desc = "Open Explorer" })
vim.keymap.set('n', "<leader>r", function() Snacks.explorer.reveal() end, { desc = "Reveal in Explorer" })

-- Window navigation
vim.keymap.set('n', "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
vim.keymap.set('n', "<C-l>", "<C-w>l", { desc = "Navigate to right window" })
