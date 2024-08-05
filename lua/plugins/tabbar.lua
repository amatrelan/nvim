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
    {
      '<leader>bd',
      '<cmd>BufferClose<cmd>',
      desc = 'Buffer Close',
    },
    {
      '<leader>bsn',
      '<cmd>BufferOrderByName<cmd>',
      desc = 'Buffer order by Name',
    },
    {
      '<leader>bsd',
      '<cmd>BufferOrderByDirectory<cmd>',
      desc = 'Buffer order by Directory',
    },
    {
      '<leader>bsl',
      '<cmd>BufferOrderByLanguage<cmd>',
      desc = 'Buffer order by Language',
    },
    {
      '<leader>bsw',
      '<cmd>BufferOrderByWindowNumber<cmd>',
      desc = 'Buffer order by Window Number',
    },
    {
      '<leader>bsb',
      '<cmd>BufferOrderByBufferNumber<cmd>',
      desc = 'Buffer order by Buffer Number',
    },
  },
  opts = {},
}
