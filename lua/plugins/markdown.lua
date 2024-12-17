return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'cd app && pnpm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      -- Set Chrome as the browser
      -- vim.g.mkdp_browser = 'chrome'
      vim.g.mkdp_browser = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'
      -- Echo the URL when opening preview (helpful for debugging)
      vim.g.mkdp_echo_preview_url = 1
    end,
  },
}
