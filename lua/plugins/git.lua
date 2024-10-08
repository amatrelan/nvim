return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      {
        '<leader>gg',
        function()
          require('neogit').open()
        end,
        desc = 'Neogit',
      },
      {
        '<leader>gl',
        function()
          require('neogit').open({ 'log' })
        end,
        desc = 'Neogit Log',
      },
    },
    config = true,
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
}
