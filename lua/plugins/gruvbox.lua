--- @type LazySpec
return {
  'ellisonleao/gruvbox.nvim',
  enabled = false,
  priority = 1000,
  opts = {},
  init = function()
    vim.cmd.colorscheme 'gruvbox'
  end,
}
