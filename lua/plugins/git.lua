return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'folke/snacks.nvim',
    },
    keys = {
      {
        '<leader>gg',
        function()
          require('neogit').open()
        end,
        desc = 'Neogit',
      },
    },
    opts = {
      integrations = {
        diffview = true,
        snacks = true,
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    keys = {
      {
        '<leader>gd',
        function()
          require('diffview').open({})
        end,
        desc = 'Diffview',
      },
    },
  },
}
