--- @type LazySpec
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  lazy = false,

  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup()
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

  },
  keys = {
    {
      '<leader>fh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fk',
      function()
        require('telescope.builtin').find_keymaps()
      end,
      desc = '[F]ind [k]eymaps',
    },
    {
      '<leader>fh',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fk',
      function()
        require('telescope.builtin').keymaps()
      end,
      desc = '[F]ind [K]eymaps',
    },
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>fs',
      function()
        require('telescope.builtin').builtin()
      end,
      desc = '[F]ind [S]elect Telescope',
    },
    {
      '<leader>fw',
      function()
        require('telescope.builtin').grep_string()
      end,
      desc = '[F]ind current [W]ord',
    },
    {
      '<leader>fg',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = '[F]ind by [G]rep',
    },
    {
      '<leader>fd',
      function()
        require('telescope.builtin').diagnostics()
      end,
      desc = '[F]ind [D]iagnostics',
    },
    {
      '<leader>fr',
      function()
        require('telescope.builtin').resume()
      end,
      desc = '[F]ind [R]esume',
    },
    {
      '<leader>f.',
      function()
        require('telescope.builtin').oldfiles()
      end,
      desc = '[F]ind Recent Files ("." for repeat)',
    },
    {
      '<leader>fm',
      function()
        require('telescope.builtin').marks()
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader><leader>',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>fn',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind [N]eovim files',
    },
    {
      '<leader>fp',
      function()
        require('telescope').extensions.projects.projects{}
      end,
      desc = '[F]ind [P]rojects',
    },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'projects')

    local builtin = require 'telescope.builtin'
  end,
}
