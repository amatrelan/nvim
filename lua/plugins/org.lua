return {
  {
    {
      'nvim-orgmode/orgmode',
      event = 'VeryLazy',
      -- enabled = false,
      ft = { 'org' },
      dependencies = {
        'chipsenkbeil/org-roam.nvim',
        { 'akinsho/org-bullets.nvim', opts = {} },
        {
          'Saghen/blink.cmp',
          opts = {
            sources = {
              per_filetype = {
                org = { 'orgmode' },
              },
              providers = {
                orgmode = {
                  name = 'Orgmode',
                  module = 'orgmode.org.autocompletion.blink',
                  fallbacks = { 'buffer' },
                },
              },
            },
          },
        },
      },
      keys = {},
      config = function()
        -- Setup orgmode
        local org_leader = '<leader>o'
        local org_localleader = '<localleader>o'
        local wk = require('which-key')
        wk.add({
          { org_leader, group = 'org-mode' },
          { org_leader .. 'd', group = 'dailies' },
          { org_leader .. 'o', group = 'origin' },
          { org_leader .. 'n', group = 'notes' },
          { '<localleader>' .. 'i', group = 'insert' },
          {
            org_leader .. 'f',
            function()
              Snacks.picker.files({ cwd = '~/notes' })
            end,
            desc = 'Find from notes',
          },
        })
        vim.api.nvim_create_autocmd('Filetype', {
          pattern = 'org',
          callback = function()
            wk.add({
              { org_localleader, group = 'org-mode' },
              { org_localleader .. 'r', group = 'roam' },
              { org_localleader .. 'b', group = 'build/tangle' },
              { org_localleader .. 'd', group = 'time' },
              { org_localleader .. 'i', group = 'insert' },
              { org_localleader .. 'l', group = 'link' },
              { org_localleader .. 'n', group = 'note' },
              { org_localleader .. 'x', group = 'clock' },
            }, { mode = 'n' })
          end,
        })

        require('orgmode').setup({
          org_agenda_files = '~/notes/**/*.org',
          org_default_notes_file = '~/notes/refile.org',

          org_capture_templates = {
            a = {
              description = 'Discuss in appsync',
              template = '* TODO %? :appsync:\n %u',
              target = '~/notes/work/appsync.org',
            },
            m = {
              description = 'Discuss with manager',
              template = '* TODO %? :manager:\n %u',
              target = '~/notes/work/manager.org',
            },
          },

          mappings = {
            global = {
              org_agenda = org_leader .. 'a',
              org_capture = org_leader .. 'c',
            },
            agenda = {
              org_agenda_clock_goto = org_localleader .. 'xj',
              org_agenda_priority = org_localleader .. 'o,',
              org_agenda_archive = org_localleader .. '$',
              org_agenda_toggle_archive_tag = org_localleader .. 'A',
              org_agenda_set_tags = org_localleader .. 't',
              org_agenda_deadline = org_localleader .. 'id',
              org_agenda_schedule = org_localleader .. 'is',
              org_agenda_refile = org_localleader .. 'r',
              org_agenda_add_note = org_localleader .. 'na',
            },
            capture = {
              org_capture_refile = org_localleader .. 'r',
              org_capture_kill = org_localleader .. 'k',
            },
            note = {
              org_note_kill = org_localleader .. 'k',
            },
            org = {
              org_add_note = org_localleader .. 'na',
              org_archive_subtree = org_localleader .. '$',
              org_babel_tangle = org_localleader .. 'bt',
              org_clock_cancel = org_localleader .. 'xq',
              org_clock_goto = org_localleader .. 'xj',
              org_clock_in = org_localleader .. 'xi',
              org_clock_out = org_localleader .. 'xo',
              org_deadline = org_localleader .. 'id',
              org_edit_special = org_localleader .. "'",
              org_export = org_localleader .. 'e',
              org_insert_heading_respect_content = org_localleader .. 'ih',
              org_insert_link = org_localleader .. 'li',
              org_insert_todo_heading = org_localleader .. 'iT',
              org_insert_todo_heading_respect_content = org_localleader .. 'it',
              org_move_subtree_down = org_localleader .. 'J',
              org_move_subtree_up = org_localleader .. 'K',
              org_open_at_point = org_localleader .. 'o',
              org_priority = org_localleader .. ',',
              org_refile = org_localleader .. 'r',
              org_schedule = org_localleader .. 'is',
              org_set_effort = org_localleader .. 'xe',
              org_set_tags_command = org_localleader .. 't',
              org_store_link = org_localleader .. 'ls',
              org_time_stamp = org_localleader .. 'i.',
              org_time_stamp_inactive = org_localleader .. 'i!',
              org_todo = org_localleader .. 'it',
              org_todo_prev = org_localleader .. 'iT',
              org_toggle_archive_tag = org_localleader .. 'A',
              org_toggle_checkbox = '<M-Space>',
              org_toggle_heading = org_localleader .. '*',
              org_toggle_timestamp_type = org_localleader .. 'd!',
            },
            edit = {
              org_edit_src_abort = org_localleader .. 'k',
              org_edit_src_save = org_localleader .. 'w',
            },
          },
        })

        require('org-roam').setup({
          directory = '~/notes/roam',
          org_files = {
            '~/notes',
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
