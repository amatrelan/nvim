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
        desc = 'Neo[g]it',
      },
    },

    config = true,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
        map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[u]ndo stage hunk' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[p]review hunk' })
        map('n', '<leader>gb', gitsigns.blame_line, { desc = '[b]lame line' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = '[d]iff against index' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis('@')
        end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = 'git show [D]eleted' })
      end,
    },
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
