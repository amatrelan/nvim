return {
  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      local keys = require('lazyvim.plugins.lsp.keymaps').get()
      keys[#keys + 1] = { '<localleader>a', vim.lsp.buf.code_action, desc = 'Code Action' }
      keys[#keys + 1] = { '<localleader>l', vim.lsp.codelens.run, desc = 'Code Lens' }
      -- Not all languages support this, so I check how I can enable this
      -- on specific languages only.
      -- opts.codelens.enabled = true
    end,
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
