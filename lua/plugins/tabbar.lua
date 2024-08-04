--- @type LazySpec
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  lazy = false,
  keys = {
    {
      '<TAB>',
      '<cmd>BufferNext<cr>',
      desc = 'Next Buffer',
      mode = 'n',
    },
    {
      '<S-TAB>',
      '<cmd>BufferPrevious<cr>',
      desc = 'Previous Buffer',
      mode = 'n',
    },
  },
  opts = {},
}
