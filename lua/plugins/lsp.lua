return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      server = {
        keys = {
          { '<localleader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>' },
          { '<localleader>l', '<cmd>lua vim.lsp.codelens.run()<CR>' },
        },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        biome = {},
        typos_lsp = {},
        html = {},
        -- htmx = {},
        emmet_language_server = {},
        omnisharp = {
          settings = {
            FormattingOptions = {
              EnableEditorConfigSupport = false,
            },
          },
        },
        gopls = {
          filetypes = {
            'go',
            'gomod',
            'gowork',
            'gotmpl',
            'html',
          },
          settings = {
            gopls = {
              templateExtensions = { 'html' },
            },
          },
        },
      },
    },
  },
}
