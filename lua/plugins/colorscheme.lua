return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  --- @type CatppuccinOptions
  opts = {
    flavour = 'mocha',

    integrations = {
      aerial = true,
      alpha = true,
      barbar = true,
      cmp = true,
      dashboard = true,
      diffview = true,
      flash = true,
      gitsigns = true,
      grug_far = true,
      headlines = true,
      hop = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      markdown = true,
      mason = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { 'undercurl' },
          hints = { 'undercurl' },
          warnings = { 'undercurl' },
          information = { 'undercurl' },
        },
        inlay_hints = {
          background = false,
        },
      },
      navic = { enabled = true, custom_bg = 'lualine' },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      octo = true,
      overseer = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },

  init = function()
    vim.cmd.colorscheme('catppuccin')
  end,
}
