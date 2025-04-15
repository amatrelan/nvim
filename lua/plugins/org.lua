return {
  {
    {
      'nvim-orgmode/orgmode',
      event = 'VeryLazy',
      enabled = false,
      ft = { 'org' },
      dependencies = {
        'chipsenkbeil/org-roam.nvim',
        { 'akinsho/org-bullets.nvim', opts = {} },
        {
          'nvim-orgmode/telescope-orgmode.nvim',
          dependencies = {
            'nvim-telescope/telescope.nvim',
          },
          opts = function(_, opts)
            local tl = require('telescope')
            tl.load_extension('orgmode')

            opts.extensions = {
              orgmode = {
                max_depth = 3,
              },
            }
          end,
        },
        {
          'hrsh7th/nvim-cmp',
          opts = function(_, opts)
            table.insert(opts.sources, { name = 'orgmode' })
          end,
        },
      },
      keys = {},
      config = function()
        -- Setup orgmode
        local wk = require('which-key')
        wk.add({
          { '<leader>n', group = 'note' },
          { '<leader>nd', group = 'dailies' },
          { '<leader>no', group = 'origin' },
        })
        vim.api.nvim_create_autocmd('Filetype', {
          pattern = 'org',
          callback = function()
            wk.add({
              { '<localleader>o', group = 'org-mode' },
              { '<localleader>n', group = 'roam' },
              { '<localleader>ob', group = 'build/tangle' },
              { '<localleader>od', group = 'time' },
              { '<localleader>oi', group = 'insert' },
              { '<localleader>ol', group = 'link' },
              { '<localleader>on', group = 'note' },
              { '<localleader>ox', group = 'clock' },
              {
                '<localleader>or',
                function()
                  require('telescope').extensions.orgmode.refile_heading()
                end,
                desc = 'org refile',
              },
              {
                '<localleader>oli',
                function()
                  require('telescope').extensions.orgmode.insert_link()
                end,
                desc = 'insert link',
              },
            }, { mode = 'n' })
          end,
        })

        require('orgmode').setup({
          org_agenda_files = '~/docs/**/*',
          org_default_notes_file = '~/docs/refile.org',

          mappings = {
            global = {
              org_agenda = '<leader>na',
              org_capture = '<leader>nc',
            },
            agenda = {
              org_agenda_clock_goto = '<localleader>oxj',
              org_agenda_priority = '<localleader>o,',
              org_agenda_archive = '<localleader>o$',
              org_agenda_toggle_archive_tag = '<localleader>oA',
              org_agenda_set_tags = '<localleader>ot',
              org_agenda_deadline = '<localleader>oid',
              org_agenda_schedule = '<localleader>ois',
              org_agenda_refile = '<localleader>or',
              org_agenda_add_note = '<localleader>ona',
            },
            capture = {
              org_capture_refile = '<localleader>or',
              org_capture_kill = '<localleader>ok',
            },
            note = {
              org_note_kill = '<localleader>ok',
            },
            org = {
              org_refile = '<localleader>or',
              org_toggle_timestamp_type = '<localleader>od!',
              org_priority = '<localleader>o,',
              org_toggle_checkbox = '<M-Space>o',
              org_toggle_heading = '<localleader>o*',
              org_insert_link = '<localleader>oli',
              org_store_link = '<localleader>ols',
              org_open_at_point = '<localleader>oo',
              org_edit_special = "<localleader>o'",
              org_add_note = '<localleader>ona',
              org_archive_subtree = '<localleader>o$',
              org_set_tags_command = '<localleader>ot',
              org_toggle_archive_tag = '<localleader>oA',
              org_insert_heading_respect_content = '<localleader>oih',
              org_insert_todo_heading = '<localleader>ooiT',
              org_insert_todo_heading_respect_content = '<localleader>ooit',
              org_move_subtree_up = '<localleader>oK',
              org_move_subtree_down = '<localleader>oJ',
              org_export = '<localleader>oe',
              org_deadline = '<localleader>oid',
              org_schedule = '<localleader>ois',
              org_times_stamp = '<localleader>oi.',
              org_times_stamp_inactive = '<localleader>oi!',
              org_clock_in = '<localleader>oxi',
              org_clock_out = '<localleader>oxo',
              org_clock_cancel = '<localleader>oxq',
              org_clock_goto = '<localleader>oxj',
              org_set_effort = '<localleader>oxe',
              org_babel_tangle = '<localleader>obt',
            },
            edit = {
              org_edit_src_abort = '<localleader>ok',
              org_edit_src_save = '<localleader>ow',
            },
          },
        })

        require('org-roam').setup({
          directory = '~/docs/roam',
          org_files = {
            '~/docs',
          },
          extensions = {
            dailies = {
              templates = {
                d = {
                  description = 'default',
                  title = 'Daily: %<%Y-%m-%d>',
                  template = '** %<%H:%M>\n   %?',
                  target = '%<%Y-%m-%d>.org',
                },
              },
            },
          },
        })
      end,
    },
  },
}
