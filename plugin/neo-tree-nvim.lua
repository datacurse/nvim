if not nixCats('general') then
  return
end

-- Neo-tree setup with mini.icons integration
require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true,
  },
  window = {
    width = 30,  -- Set width to 30
    auto_close = true,  -- Close neo-tree when last window is closed
  },
  -- Set up the custom icon provider using mini.icons
  default_component_configs = {
    icon = {
      provider = function(icon, node)  -- Custom icon provider
        local text, hl
        local mini_icons = require("mini.icons")
        
        if node.type == "file" then  -- If it's a file, set the text/hl
          text, hl = mini_icons.get("file", node.name)
        elseif node.type == "directory" then  -- Get directory icons
          text, hl = mini_icons.get("directory", node.name)
          -- Only set the icon text if the directory is not expanded
          if node:is_expanded() then
            text = nil
          end
        elseif node.type == "symbol" then
          -- Handle LSP kinds for symbols
          local kind = vim.tbl_get(node, "extra", "kind", "name")
          if kind then
            text, hl = mini_icons.get("lsp", kind)
          end
        end

        -- Set the icon text/highlight only if it exists
        if text then
          icon.text = text
        end
        if hl then
          icon.highlight = hl
        end
      end,
    },
    -- Optional: setup for LSP symbols
    kind_icon = {
      provider = function(icon, node)
        local mini_icons = require("mini.icons")
        icon.text, icon.highlight = mini_icons.get("lsp", node.extra.kind.name)
      end,
    },
  },
})


-- Keep your existing keymaps
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle file explorer', silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus left', silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus right', silent = true })

-- Add autocmd to open neo-tree when Neovim starts
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
  end
})
