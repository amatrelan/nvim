--- @type LazySpec
return {
  {
    'nvim-neorg/neorg',
    dependencies = {
      'vhyrro/luarocks.nvim',
      {
        'vhyrro/luarocks.nvim',
        priority = 1000,
        config = true,
      },
    },
    -- build = ":Neorg sync-parsers",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = true,
  },
}