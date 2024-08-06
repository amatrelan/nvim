return {
  {
    'williamboman/mason.nvim',
    enabled = function()
      -- I have no clue how I can do this correct way.
      -- Well this works and is enough for me.
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
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        javascript = { 'eslintd' },
        typesctript = { 'eslintd' },
      },
    },
  },
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
  },
  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      local keys = require('lazyvim.plugins.lsp.keymaps').get()
      keys[#keys + 1] = { '<localleader>a', vim.lsp.buf.code_action, desc = 'Code Action' }
      keys[#keys + 1] = { '<localleader>l', vim.lsp.codelens.run, desc = 'Code Lens' }

      opts.codelens.enabled = true
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      local cmp = require('cmp')

      opts.mapping = vim.tbl_extend('force', opts.mapping, {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<CR>'] = {},
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { 'i', 's' }),
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = {
      formatters_by_ft = {
        nix = { 'alejandra' },
      },
    },
  },
}
