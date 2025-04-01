# hide default status line in favour of lualine

[reddit](https://www.reddit.com/r/neovim/comments/1gg478d/cant_figure_out_how_to_hide_default_status_line/)
Settting `vim.opt.showmode` = false should make that go away.

Technically, that won't get you any space back since the mode is being displayed in the command line area. If you really want that space back, you'd need noice.

# ghostty padding

[github](https://github.com/ghostty-org/ghostty/discussions/3716)

```toml
window-padding-balance = true
window-padding-x = 0
window-padding-y = 0
window-padding-color = extend
```
This removes ugly padding around neovim.

