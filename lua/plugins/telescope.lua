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
}
