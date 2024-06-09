--- @type LazySpec
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    enabled = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd.colorscheme('gruvbox')
    end,
  },
}
