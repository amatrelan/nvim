--- @type LazySpec
return {
  'nvimdev/dashboard-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VimEnter',
  opts = {
    theme = 'hyper',

    config = {
      disable_move = true,

      week_header = {
        enable = true,
      },

      shortcut = {
        {
          desc = '󰊳 Update',
          group = '@property',
          action = 'Lazy update',
          key = 'u',
        },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        -- {
        --   desc = ' Apps',
        --   group = 'DiagnosticHint',
        --   action = 'Telescope app',
        --   key = 'a',
        -- },
        {
          desc = ' nvim',
          group = 'variable',
          action = 'Telescope find_files cwd=~/.config/nvim',
          key = 'n',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope find_files cwd=~/nixos-config',
          key = 'd',
        },
      },
    },
  },
}
