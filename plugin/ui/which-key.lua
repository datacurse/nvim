if not nixCats('general') then
  return
end

require('which-key').setup({})
require('which-key').add {
  { "<leader><leader>", group = "buffer commands" },
  { "<leader>c", group = "[c]ode" },
  { "<leader>d", group = "[d]ocument" },
  { "<leader>g", group = "[g]it" },
  { "<leader>r", group = "[r]ename" },
  { "<leader>s", group = "[s]earch" },
  { "<leader>f", group = "[f]ind" },
  { "<leader>t", group = "[t]oggles" },
  { "<leader>w", group = "[w]orkspace" },
}
