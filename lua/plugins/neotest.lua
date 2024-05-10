--- @type LazySpec
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    'nvim-neotest/neotest-python',
    'nvim-neotest/neotest-go',
  },

  keys = {
    {
      '<leader>tr',
      function()
        require('neotest').run.run()
        require('neotest').summary.open()
      end,
      desc = '[R]un',
    },
    {
      '<leader>tR',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = '[R]un current file',
    },
    {
      '<leader>td',
      function()
        require('neotest').run.run { strategy = 'dap' }
      end,
      desc = '[R]un /w dap',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = '[S]ummary',
    },
    {
      '<leader>tw',
      function()
        require('neotest').watch.toggle()
      end,
      desc = '[W]atch',
    },
  },

  config = function()
    local neotest_ns = vim.api.nvim_create_namespace 'neotest'
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)

    require('neotest').setup {
      adapters = {
        require 'rustaceanvim.neotest',
        require 'neotest-python',
        require 'neotest-go',
      },
    }
  end,
}
