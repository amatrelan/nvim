--- @type LazySpec
return {
  'nvimdev/dashboard-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VimEnter',
  opts = {
    theme = 'doom',

    config = {
      -- disable_move = true,
      week_header = {
        enable = true,
      },
      -- header = {},
      center = {
        {
          icon = ' ',
          desc = 'projects',
          action = 'Telescope projects',
          key_format = ' %s',
          key = 'p',
          keymap = 'SPC f p',
        },
        {
          icon = ' ',
          desc = 'dotfiles',
          group = 'Number',
          action = 'Telescope find_files cwd=~/nixos-config',
          key_format = ' %s',
          key = 'd',
        },
        {
          icon = ' ',
          desc = 'config',
          group = 'variable',
          action = 'Telescope find_files cwd=~/.config/nvim',
          key_format = ' %s',
          key = 'c',
        },
        {
          icon = '󰒲 ',
          desc = 'lazy',
          action = 'Lazy',
          key_format = ' %s',
          key = 'l',
        },
        {
          icon = ' ',
          desc = 'quit',
          action = function()
            vim.api.nvim_input('<cmd>qa<cr>')
          end,
          key_format = ' %s',
          key = 'q',
        },
      },
      footer = {},
    },
  },
}
