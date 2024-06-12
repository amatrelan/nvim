vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      replace_builtin_hover = false,
    },
  },
}

--- @type LazySpec
return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    -- enabled = false,
    lazy = false, -- This plugin is already lazy
  },
  {
    'Saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {},
  },
}
