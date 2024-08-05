--- @type LazySpec
return {
  {
    'NeogitOrg/neogit',
    -- branch = '*',
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
    },

    config = true,
  },
  {
    'pwntester/octo.nvim',
    enabled = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    event = {
      {
        event = 'BufReadCmd',
        pattern = 'octo://',
      },
    },
    --- @type OctoConfig
    opts = {
      enable_builtin = true,
      default_to_projects_v2 = true,
      default_merge_method = 'squash',
      picker = 'telescope',
    },

    keys = {
      {
        '<leader>gi',
        '<cmd>Octo issue list<cr>',
        desc = 'List Issues',
      },
      {
        '<leader>gI',
        '<cmd>Octo issue search<cr>',
        desc = 'Search Issues',
      },
      {
        '<leader>gp',
        '<cmd>Octo pr list<cr>',
        desc = 'List PRs',
      },
      {
        '<leader>gP',
        '<cmd>Octo pr search<cr>',
        desc = 'Search PRs',
      },
      {
        '<leader>gr',
        '<cmd>Octo repo list<cr>',
        desc = 'List Repos',
      },
      {
        '<leader>gS',
        '<cmd>Octo search<cr>',
        desc = 'Search (Octo)',
      },

      { '<leader>a', '', desc = '+assignee (Octo)', ft = 'octo' },
      { '<leader>c', '', desc = '+comment/code (Octo)', ft = 'octo' },
      { '<leader>l', '', desc = '+label (Octo)', ft = 'octo' },
      { '<leader>i', '', desc = '+issue (Octo)', ft = 'octo' },
      { '<leader>r', '', desc = '+react (Octo)', ft = 'octo' },
      { '<leader>p', '', desc = '+pr (Octo)', ft = 'octo' },
      { '<leader>v', '', desc = '+review (Octo)', ft = 'octo' },
      { '@', '@<C-x><C-o>', mode = 'i', ft = 'octo', silent = true },
      { '#', '#<C-x><C-o>', mode = 'i', ft = 'octo', silent = true },
    },
  },
}
