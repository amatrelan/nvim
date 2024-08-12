return {
  {
    'jay-babu/mason-nvim-dap.nvim',
    enabled = function()
      local obj = vim.system({ 'rg', '-i', 'nixos', '/etc/os-release' }, { text = true }):wait()
      return obj.code ~= 0
    end,
  },
  {
    'williamboman/mason.nvim',
    enabled = function()
      local obj = vim.system({ 'rg', '-i', 'nixos', '/etc/os-release' }, { text = true }):wait()
      return obj.code ~= 0
    end,
  },
}
