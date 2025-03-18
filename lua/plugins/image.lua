return {
  "3rd/image.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Ensure plenary is installed
  },
  config = function()
    require("image").setup({
      backend = "kitty", -- ✅ Works in Ghostty
      processor = "magick_cli", -- Use ImageMagick CLI (instead of Lua rock)
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
        neorg = {
          enabled = true,
          filetypes = { "norg" },
        },
        typst = {
          enabled = true,
          filetypes = { "typst" },
        },
      },
      max_width_window_percentage = 50,
      max_height_window_percentage = 50,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    })
  end,
  ft = { "markdown", "norg", "typst" },
}

