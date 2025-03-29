if not nixCats('general') then
  return
end

local colorscheme = 'catppuccin'

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = colorscheme,
    component_separators = '|',
    section_separators = '',
  },
  -- sections = {
  --   lualine_a = {'mode'},
  --   lualine_c = {
  --     {
  --       'filename', path = 1, status = true,
  --     },
  --   },
  -- },
  -- inactive_sections = {
  --   lualine_b = {
  --     {
  --       'filename', path = 3, status = true,
  --     },
  --   },
  --   lualine_x = {'filetype'},
  -- },
  -- tabline = {
  --   lualine_a = { 'buffers' },
  --   lualine_z = { 'lsp_progress', },
  --   -- lualine_z = { 'tabs' }
  -- },
  extensions = {
    -- extensions change statusline for specified filetypes
    "neo-tree"
  }
})

