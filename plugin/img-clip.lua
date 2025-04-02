if not nixCats('general') then
  return
end

local img_clip = require('img-clip')

img_clip.setup({
  default = {
    -- file and directory options
    dir_path = 'assets',
    extension = 'png',
    file_name = '%Y-%m-%d-%H-%M-%S',

    -- template options
    template = '$FILE_PATH',
    url_encode_path = false,

    -- prompt options
    prompt_for_file_name = true,

    -- image options
    process_cmd = '',
    download_images = true,

    -- drag and drop options
    drag_and_drop = {
      enabled = true,
      insert_mode = false,
    },
  },

  -- You can keep the default filetype-specific configurations
  filetypes = {
    markdown = {
      url_encode_path = true,
      template = '![$CURSOR]($FILE_PATH)',
    },

    tex = {
      relative_template_path = false,
      template = [[
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{$FILE_PATH}
  \caption{$CURSOR}
  \label{fig:$LABEL}
\end{figure}
      ]],
    },

    -- Add more filetype configurations as needed
  },
})

-- Add keymappings
vim.keymap.set('n', '<leader>p', function()
  img_clip.paste_image()
end, { desc = 'Paste image from clipboard' })

-- Optional: Add command for debugging
vim.keymap.set('n', '<leader>id', '<cmd>ImgClipDebug<cr>', { desc = 'Show img-clip debug info' })

-- Optional: Add command to view current configuration
vim.keymap.set('n', '<leader>ic', '<cmd>ImgClipConfig<cr>', { desc = 'Show img-clip configuration' })
