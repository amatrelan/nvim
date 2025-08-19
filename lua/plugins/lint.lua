return {
  {
    'mfussenegger/nvim-lint',
    event = 'LazyFile',
    opts = {
      -- Event to trigger linters
      events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
      linters_by_ft = {
        ['*'] = { 'typos' },
        ['.*/.github/workflows/.*%.yml'] = 'yaml.ghaction',
        bash = { 'bash' },
        fish = { 'fish' },
        go = { 'golangcilint' },
        yaml = { 'actionlint' },
      },
      ---@type table<string,table>
      linters = {},
    },
  },
  {
    'mason-org/mason.nvim',
    opts = {
      ensure_installed = {
        'actionlint',
        'shellcheck',
        'golangci-lint',
        'staticcheck',
        'typos',
      },
    },
  },
}
