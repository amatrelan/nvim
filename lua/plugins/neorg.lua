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
    lazy = false,
    version = '*',
    config = true,
  },
}
