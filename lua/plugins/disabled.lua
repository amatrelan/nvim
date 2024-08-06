return {
  {
    'williamboman/mason.nvim',
    enabled = function()
      local exit_code = 0
      local on_exit = function(obj)
        exit_code = obj.code
      end
      vim.system({ 'rg', '-i', 'nixos', '/etc/os-release' }, { text = true }, on_exit)

      return exit_code == 1
    end,
    opts = {
      ensure_installed = {},
    },
  },
}
