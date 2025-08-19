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
        graphql = { 'biome' },
        javascript = { 'biome' },
        typescript = { 'biome' },

        nix = { 'alejandra' },
        rust = { 'rustfmt' },
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
        '<leader>*',
        function()
          Snacks.picker.grep_word({
            hidden = true,
            ignored = false,
          })
        end,
        desc = 'Grep Word',
      },
      {
        '<leader>un',
        function()
          Snacks.notifier.hide()
        end,
        desc = 'Dismiss All Notifications',
      },
    },
    -- {
    --   '<leader>gd',
    --   false,
    -- },
  },
  {
    'mason-org/mason.nvim',
    opts = {
      ensure_installed = {
        'staticcheck',
        'golangci-lint',
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
}
