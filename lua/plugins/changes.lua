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
  {
    'snacks.nvim',
    keys = {
      {
        '<leader>N',
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.notifications()
          else
            Snacks.notifier.show_history()
          end
        end,
        desc = 'Notification History',
      },
      {
        '<leader>un',
        function()
          Snacks.notifier.hide()
        end,
        desc = 'Dismiss All Notifications',
      },
      {
        '<leader>gd',
        false,
      },
    },
  },
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
    'mason-org/mason.nvim',
    opts = { ensure_installed = { 'staticcheck' } },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        biome = {},
        typos_lsp = {},
        html = {},
        htmx = {},
        emmet_language_server = {},
        gopls = {
          filetypes = { 'go', 'gomod', 'gowork', 'gotmpl', 'html' },
          settings = {
            gopls = {
              templateExtensions = { 'html' },
            },
          },
        },
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
    'vhyrro/luarocks.nvim',
    lazy = false,
    opts = {
      rocks = { 'xml2lua', 'inspect' },
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      {
        'arthur944/neotest-bun',
        'fredrikaverpil/neotest-golang',
        -- 'nvim-neotest/neotest-jest',
      },
    },
    lazy = false,
    opts = {
      adapters = {
        -- 'neotest-jest',
        'neotest-bun',
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
  {
    'mfussenegger/nvim-lint',
    event = 'LazyFile',
    opts = {
      -- Event to trigger linters
      events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
      linters_by_ft = {
        fish = { 'fish' },
        go = { 'golangcilint' },
        bash = { 'bash' },
        -- ["*"] = { "typos" },
      },
      ---@type table<string,table>
      linters = {},
    },
  },
  {
    'elkowar/yuck.vim',
  },
  {
    'folke/snacks.nvim',
    keys = {
      {
        '<leader>e',
        function()
          Snacks.picker.explorer({
            hidden = true,
            ignored = false,
          })
        end,
        desc = 'Explorer',
      },
      {
        '<leader>ff',
        function()
          Snacks.picker.files({
            hidden = true,
            ignored = false,
          })
        end,
        desc = 'Format',
      },
      {
        'gp',
        function()
          Snacks.picker.projects({
            hidden = true,
            ignored = false,
          })
        end,
        desc = 'Projects',
      },
      {
        '<leader>*',
        function()
          Snacks.picker.grep_word({
            hidden = true,
            ignored = false,
          })
        end,
        desc = 'Grep Word',
      },
    },
  },
}
