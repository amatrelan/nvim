return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
    keys = {
      { '<leader>xt', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
      { '<leader>xT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo' },
    },
  },
}
