return {
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    dependencies = {
      {
        'LazyVim/LazyVim',
        opts = {
          colorscheme = 'kanagawa',
        },
      },
    },
    opts = {
      compile = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
    },
  },
  {
    'catppuccin/nvim',
    enabled = false,
    dependencies = {
      {
        'LazyVim/LazyVim',
        opts = {
          colorscheme = 'catppuccin',
        },
      },
    },
    opts = {},
  },
  {
    'luisiacc/gruvbox-baby',
    enabled = false,
    dependencies = {
      {
        'LazyVim/LazyVim',
        opts = {
          colorscheme = 'gruvbox-baby',
        },
      },
    },
  },
  {
    'sainnhe/gruvbox-material',
    enabled = false,
    dependencies = {},
    config = function()
      vim.g.gruvbox_naterial_enable_italic = true
      vim.cmd.colorscheme('gruvbox-material')
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    enabled = false,
    dependencies = {
      {
        'LazyVim/LazyVim',
        opts = {
          colorscheme = 'gruvbox',
        },
      },
    },
  },
}
