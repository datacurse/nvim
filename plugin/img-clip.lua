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
    copy_images = true, -- Added this option to copy images
    download_images = true,
    -- drag and drop options
    drag_and_drop = {
      enabled = true,
      insert_mode = true, -- Changed to true for more flexibility
    },
  },
  filetypes = {
    markdown = {
      url_encode_path = true,
      template = '![$FILE_NAME_NO_EXT]($FILE_PATH)',
      download_images = true, -- Explicitly enabled for markdown
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
  },
})

-- Add keymappings
vim.keymap.set('n', '<leader>ip', function()
  img_clip.paste_image()
end, { desc = 'Paste image from clipboard' })

-- Debug command
vim.keymap.set('n', '<leader>id', '<cmd>ImgClipDebug<cr>', { desc = 'Show img-clip debug info' })

-- Add the config command for quick inspection
vim.api.nvim_create_user_command('ImgClipConfig', function()
  require('img-clip.api').print_config()
end, {})
