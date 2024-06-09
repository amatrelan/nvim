--- @type LazySpec
return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'jbyuki/one-small-step-for-vimkind',
  },
  keys = {
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'DAP: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'DAP: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'DAP: Step Out',
    },
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'DAP: Continue',
    },
    {
      '<localleader>dc',
      function()
        require('dap').continue()
      end,
      desc = 'DAP: Continue',
    },
    {
      '<F7>',
      function()
        require('dapui').toggle()
      end,
      desc = 'DAPui: Toggle',
    },
    {
      '<localleader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'DAP: Toggle Brekpoint',
    },
    {
      '<localleader>dB',
      function()
        require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      desc = 'DAP: Set Conditional Breakpoint',
    },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup()
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    dap.configurations.lua = {
      {
        type = 'nlua',
        request = 'attach',
        name = 'Attach to running Neovim instance',
      },
    }

    dap.adapters.nlua = function(callback, config)
      callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 })
    end

    -- Install golang specific config
    require('dap-go').setup()
  end,
}
