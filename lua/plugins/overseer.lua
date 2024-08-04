--- @type LazySpec
return {
  'stevearc/overseer.nvim',
  keys = {
    {
      '<leader>rt',
      function()
        require('overseer').toggle()
      end,
      desc = 'Overseer toggle',
    },
  },
  opts = {},
}
