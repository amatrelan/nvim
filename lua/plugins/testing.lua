--- @type LazySpec
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    'nvim-neotest/neotest-go',
    'nvim-neotest/neotest-jest',
    'nvim-neotest/neotest-python',
  },

  keys = {
    {
      '<localleader>tr',
      function()
        require('neotest').run.run()
        require('neotest').summary.open()
      end,
      desc = 'Run',
    },
    {
      '<localleader>tR',
      function()
        require('neotest').run.run(vim.fn.expand('%'))
      end,
      desc = 'Run current file',
    },
    {
      '<localleader>td',
      function()
        require('neotest').run.run({ strategy = 'dap' })
      end,
      desc = 'Run /w dap',
    },
    {
      '<localleader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Summary',
    },
    {
      '<localleader>tw',
      function()
        require('neotest').watch.toggle()
      end,
      desc = 'Watch',
    },
  },

  config = function()
    local neotest_ns = vim.api.nvim_create_namespace('neotest')
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)

    require('neotest').setup({
      adapters = {
        require('rustaceanvim.neotest'),
        require('neotest-python'),
        require('neotest-go'),
        require('neotest-jest'),
      },
    })
  end,
}
