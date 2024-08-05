-- { '<leader>b', group = 'buffer' },
-- { '<leader>bs', group = 'sort' },
-- { '<leader>d', group = 'document' },
-- { '<leader>n', group = 'notes (org-roam)' },
-- { '<leader>na', group = 'alias' },
-- { '<leader>nd', group = 'daily' },
-- { '<leader>no', group = 'origin' },
-- { '<leader>nr', group = 'roaming' },
-- { '<leader>o', group = 'org' },
-- { '<leader>ob', group = 'tangle' },
-- { '<leader>oi', group = 'insert' },
-- { '<leader>ol', group = 'link' },
-- { '<leader>on', group = 'note' },
-- { '<leader>ox', group = 'time / effort' },
-- { '<leader>t', group = 'toggle' },
-- { '<leader>w', group = 'workspace' },
-- { '<localleader>d', group = 'debug' },
-- { '<localleader>t', group = 'test' },
---@type LazySpec
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      {
        '\\',
        function()
          require('neo-tree.command').execute({ toggle = true })
        end,
        desc = 'NeoTree reveal',
      },
      {
        '<leader>ge',
        function()
          require('neo-tree.command').execute({ source = 'git_status', toggle = true })
        end,
        desc = 'Git Explorer',
      },
    },
    opts = {
      -- sources = { 'filesystem', 'buffers', 'git_status' },
      -- open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
      filesystem = {
        -- bind_to_cwd = false,
        -- follow_current_file = { enabled = true },
        -- use_libuv_file_watcher = true,
        hijack_netrw_behavior = 'open_default',
        window = {
          mappings = {
            ['\\'] = 'close_window',
            ['P'] = { 'toggle_preview', config = { use_float = false } },
          },
        },
      },
      event_handlers = {
        {
          event = 'file_opened',
          handler = function(_file_path)
            require('neo-tree.command').execute({ action = 'close' })
          end,
        },
      },
    },
  },
  {
    'MagicDuck/grug-far.nvim',
    opts = { headerMaxWidth = 80 },
    cmd = 'GrugFar',
    keys = {
      {
        '<leader>sr',
        function()
          local grug = require('grug-far')
          local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')
          grug.grug_far({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
            },
          })
        end,
        mode = { 'n', 'v' },
        desc = 'Search and Replace',
      },
    },
  },
  {
    'folke/flash.nvim',
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = { 'o' },
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = { -- This is the function that runs, AFTER loading
      spec = {
        {
          mode = { 'n', 'v' },
          -- Document existing key chains
          { '<leader><tab>', group = 'tabs' },
          { '<leader>c', group = 'code' },
          { '<leader>f', group = 'file/find' },
          { '<leader>g', group = 'git' },
          { '<leader>s', group = 'search' },
          { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
          { '<leader>x', group = 'diagnostics/quickfix', icon = { icon = '󱖫 ', color = 'green' } },
          { '[', group = 'prev' },
          { ']', group = 'next' },
          { 'g', group = 'goto' },
          { 'gs', group = 'surround' },
          { 'z', group = 'fold' },
          { '<BS>', desc = 'Decrement Selection', mode = 'x' },
          { '<c-space>', desc = 'Increment Selection', mode = { 'x', 'n' } },

          {
            '<leader>b',
            group = 'buffer',
            expand = function()
              return require('which-key.extras').expand.buf()
            end,
          },
          {
            '<leader>w',
            group = 'windows',
            proxy = '<c-w>',
            expand = function()
              return require('which-key.extras').expand.win()
            end,
          },
        },
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Keymaps (which-key)',
      },
      {
        '<c-w><space>',
        function()
          require('which-key').show({ keys = '<c-w>', loop = true })
        end,
        desc = 'Window Hydra Mode (which-key)',
      },
    },
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
      signs_staged = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },

      on_attach = function(bufnr)
        local gs = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Actions
        -- visual mode
        map('v', '<leader>gs', function()
          gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'stage git hunk' })
        map('v', '<leader>gr', function()
          gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>ghs', gs.stage_hunk, { desc = 'Stage hunk' })
        map('n', '<leader>ghr', gs.reset_hunk, { desc = 'Reset hunk' })
        map('n', '<leader>ghS', gs.stage_buffer, { desc = 'Stage buffer' })
        map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
        map('n', '<leader>ghR', gs.reset_buffer, { desc = 'Reset buffer' })
        map('n', '<leader>ghp', gs.preview_hunk, { desc = 'Preview hunk' })
        map('n', '<leader>gb', gs.blame_line, { desc = 'Blame line' })
        map('n', '<leader>gd', gs.diffthis, { desc = 'Diff against index' })
        map('n', '<leader>gD', function()
          gs.diffthis('@')
        end, { desc = 'git Diff against last commit' })
        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'git show blame line' })
        map('n', '<leader>tD', gs.toggle_deleted, { desc = 'git show Deleted' })
      end,
    },
  },
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    cmd = 'Trouble',
    opts = {
      modes = {
        lsp = {
          win = { position = 'right' },
        },
      },
    },

    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle<cr>',
        desc = 'Symbols',
      },
      {
        '<leader>cS',
        '<cmd>Trouble lsp toggle<cr>',
        desc = 'LSP: Def / Ref / etc...',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List',
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufEnter',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
      { '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
      { '<leader>sT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo' },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
  },
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    lazy = false,
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = false,

    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      {
        'ahmedkhalf/project.nvim',
        config = function()
          require('project_nvim').setup()
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      {
        'nvim-telescope/telescope-frecency.nvim',
        config = function()
          require('telescope').load_extension('frecency')
        end,
      },
    },
    keys = {
      {
        '<leader>fh',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = 'Help',
      },
      {
        '<leader>fk',
        function()
          require('telescope.builtin').keymaps()
        end,
        desc = 'Keymaps',
      },
      {
        '<leader>ff',
        function()
          require('telescope').extensions.frecency.frecency({
            workspace = 'CWD',
          })
        end,
        desc = 'Find Files',
      },
      {
        '<leader>fs',
        function()
          require('telescope.builtin').lsp_document_symbols()
        end,
        desc = 'Symbols',
      },
      {
        '<leader>fS',
        function()
          require('telescope.builtin').lsp_workspace_symbols()
        end,
        desc = 'Workspace Symbols',
      },
      {
        '<leader>fw',
        function()
          require('telescope.builtin').grep_string()
        end,
        desc = 'Current Word',
      },
      {
        '<leader>fg',
        function()
          require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())
        end,
        desc = 'Grep',
      },
      {
        '<leader>fd',
        function()
          require('telescope.builtin').diagnostics()
        end,
        desc = 'Diagnostics',
      },
      {
        '<leader>fr',
        function()
          require('telescope.builtin').resume()
        end,
        desc = 'Resume',
      },
      {
        '<leader>f.',
        function()
          require('telescope.builtin').oldfiles()
        end,
        desc = 'Recent Files ("." for repeat)',
      },
      {
        '<leader>fm',
        function()
          require('telescope.builtin').marks()
        end,
        desc = 'Find marks',
      },
      {
        '<leader><leader>',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = 'Find existing buffers',
      },
      {
        '<leader>/',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({}))
        end,
        desc = '/ Fuzzily search in current buffer',
      },
      {
        '<leader>fn',
        function()
          require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })
        end,
        desc = 'Neovim files',
      },
      {
        '<leader>fp',
        function()
          require('telescope').extensions.projects.projects({})
        end,
        desc = 'Projects',
      },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      })

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'projects')
    end,
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup({
        disable_when_zoomed = false,
        keybindings = {
          left = '<C-h>',
          down = '<C-j>',
          up = '<C-k>',
          right = '<C-l>',
        },
      })
    end,
  },
}
