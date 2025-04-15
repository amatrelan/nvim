return {
  {
    'stevearc/conform.nvim',
    keys = {
      {
        '<localleader>f',
        function()
          LazyVim.format({ force = true })
        end,
        desc = 'Format',
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { 'biome' },
        typescript = { 'biome' },
        nix = { 'alejandra' },
        rust = { 'rustfmt' },
        xml = { 'xmllint' },
      },
    },
  },
  -- {
  --   'nvim-neo-tree/neo-tree.nvim',
  --   opts = {
  --     event_handlers = {
  --       {
  --         event = 'file_open_requested',
  --         handler = function()
  --           require('neo-tree.command').execute({ action = 'close' })
  --         end,
  --       },
  --     },
  --   },
  -- },
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
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = { eslint = {}, biome = {} },
      setup = {
        eslint = function()
          require('lazyvim.util').lsp.on_attach(function(client)
            if client.name == 'eslint' then
              client.server_capabilities.documentFormattingProvider = false
            elseif client.name == 'tsserver' then
              client.server_capabilities.documentFormattingProvider = false
            elseif client.name == 'jsonls' then
              client.server_capabilities.documentFormattingProvider = false
            elseif client.name == 'vtsls' then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/neotest-jest',
      'fredrikaverpil/neotest-golang',
    },
    opts = {
      adapters = {
        'neotest-jest',
        require('neotest-golang')({
          go_test_args = {
            '-v',
            '-race',
            '-count=1',
            '-coverprofile=' .. vim.fn.getcwd() .. '/coverage.out',
          },
        }),
      },
    },
  },
  {
    'andythigpen/nvim-coverage',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {},
  },
  {
    'saghen/blink.cmp',
    opts = {
      signature = {
        enabled = true,
        window = {
          show_documentation = false,
        },
      },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },
    },
  },
}
