if not nixCats('general') then
  return
end

local colorscheme = 'catppuccin'
local prose = require('nvim-prose')

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = colorscheme,
    component_separators = '|',
    section_separators = '',
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        path = 1,
        status = true,
      },
    },
    lualine_x = {
      'encoding',
      -- 'fileformat', -- Removed this line to hide unix indicator
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = {
      { prose.word_count, cond = prose.is_available },
      -- { prose.reading_time, cond = prose.is_available },
    },
  },
  inactive_sections = {
    lualine_b = {
      {
        'filename',
        path = 3,
        status = true,
      },
    },
    lualine_x = { 'filetype' },
  },
})
