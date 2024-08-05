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
      '<leader>bn',
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
    {
      '<leader>bp',
      '<cmd>BufferPrevious<cr>',
      desc = 'Previous Buffer',
      mode = 'n',
    },
    {
      '<leader>bd',
      '<cmd>BufferClose<cr>',
      desc = 'Buffer Close',
    },
    {
      '<leader>bsn',
      '<cmd>BufferOrderByName<cr>',
      desc = 'Buffer order by Name',
    },
    {
      '<leader>bsd',
      '<cmd>BufferOrderByDirectory<cr>',
      desc = 'Buffer order by Directory',
    },
    {
      '<leader>bsl',
      '<cmd>BufferOrderByLanguage<cr>',
      desc = 'Buffer order by Language',
    },
    {
      '<leader>bsw',
      '<cmd>BufferOrderByWindowNumber<cr>',
      desc = 'Buffer order by Window Number',
    },
    {
      '<leader>bsb',
      '<cmd>BufferOrderByBufferNumber<cr>',
      desc = 'Buffer order by Buffer Number',
    },
  },
  opts = {},
}
