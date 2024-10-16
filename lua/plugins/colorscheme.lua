return {
  {
    'rebelot/kanagawa.nvim',
    -- enabled = false,
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
}
