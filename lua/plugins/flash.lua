--- @type LazySpec
return {
  'folke/flash.nvim',
  event = "VeryLazy",
  enabled = true,

  --- @type Flash.Config
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
    },
  },
}
