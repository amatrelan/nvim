return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
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
  },
}
