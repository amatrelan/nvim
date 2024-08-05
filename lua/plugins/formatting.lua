-- @type LazySpec
return { -- Autoformat
  'stevearc/conform.nvim',
  cmd = 'ConformInfo',
  keys = {
    {
      '<localleader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = { 'n', 'v' },
      desc = 'Format buffer',
    },
  },
  ---@type conform.setupOpts
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 3000,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      nix = { 'alejandra' },
      javascript = { 'eslintd', 'prettier' },
      typescript = { 'eslintd', 'prettier' },
    },
  },
}
