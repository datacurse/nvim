if not nixCats('general') then
  return
end

require('typst-preview').setup({
  dependencies_bin = { -- use nix-installed binaries
    tinymist = 'tinymist',
    websocat = 'websocat',
  },
  port = 0, -- random free port
  follow_cursor = true,
})
