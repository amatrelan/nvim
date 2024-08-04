--- @type LazySpec
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  --- @type CatppuccinOptions
  opts = {
    flavour = 'mocha',

    styles = {},

    integrations = {
      barbar = true,
      diffview = true,
      hop = true,
      mason = true,
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      octo = true, -- TODO: Check this plugin
      overseer = true, -- TODO: Check this plugin
      markdown = true, -- TODO: Check this plugin
      which_key = true,
    },
  },

  init = function()
    vim.cmd.colorscheme('catppuccin')
  end,
}
