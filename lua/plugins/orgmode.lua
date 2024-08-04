--- @type LazySpec
return {
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      'akinsho/org-bullets.nvim',
      {
        'nvim-orgmode/telescope-orgmode.nvim',
        dependencies = {
          'nvim-telescope/telescope.nvim',
        },
      },
      -- {
      --   'lukas-reineke/headlines.nvim',
      --   dependencies = {
      --     'nvim-treesitter/nvim-treesitter',
      --   },
      --   config = true,
      -- },
    },
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/docs/**/*',
        org_default_notes_file = '~/docs/refile.org',
      })

      local tele = require('telescope')
      tele.load_extension('orgmode')
      tele.setup({
        extensions = {
          orgmode = {
            max_depth = 3,
          },
        },
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'org',
        group = vim.api.nvim_create_augroup('orgmode_telescope_nvim', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
          end
          map('<leader>or', require('telescope').extensions.orgmode.refile_heading, 'Refile heading')
          map('<leader>oli', require('telescope').extensions.orgmode.insert_link, 'Insert link')
        end,
      })
      vim.keymap.set(
        'n',
        '<leader>fo',
        require('telescope').extensions.orgmode.search_headings,
        { desc = 'Find (org) heading' }
      )
    end,
  },
  {
    'akinsho/org-bullets.nvim',
    opts = {},
  },
  {
    'chipsenkbeil/org-roam.nvim',
    tag = '0.1.0',
    dependencies = {
      'nvim-orgmode/orgmode',
    },
    config = function()
      require('org-roam').setup({
        extensions = {
          dailies = {
            templates = {
              d = {
                describtion = 'default',
                title = 'Daily: %<%Y-%m-%d>',
                template = '** %<%H:%M>\n%?',
                target = '%<%Y-%m-%d>.org',
              },
            },
            bindings = {
              capture_date = '<leader>ndD',
              capture_today = '<leader>ndN',
              capture_tomorrow = '<leader>ndT',
              capture_yesterday = '<leader>ndY',
              find_directory = '<leader>nd.',
              goto_date = '<leader>ndd',
              goto_next_date = '<leader>ndf',
              goto_prev_date = '<leader>ndb',
              goto_today = '<leader>ndn',
              goto_tomorrow = '<leader>ndt',
              goto_yesterday = '<leader>ndy',
            },
          },
        },
        directory = '~/docs/roam',
        -- optional
        org_files = {
          '~/docs',
        },
      })
    end,
  },
}
