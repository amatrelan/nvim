-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.maplocalleader = ','

vim.g.lazyvim_python_lsp = 'pyright'
vim.g.lazyvim_python_ruff = 'ruff'
vim.g.autoformat = false

vim.g.snacks_animate = false

if vim.fn.has("windows") then
  vim.o.shell = "nu"
end

-- Neovide
if vim.g.neovide then
  local default_path = vim.fn.expand("~/")
  vim.api.nvim_set_current_dir(default_path)
  vim.o.guifont = 'MonaspiceKr Nerd Font:16h'
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_short_animation_length = 0
end
