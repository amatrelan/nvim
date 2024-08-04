---@module 
---@author 
---@license 

--- @type LazySpec
return {
  'danymat/neogen',
  cmd = 'Neogen',
  keys = {
    {
      '<leader>cn',
      function()
        require('neogen').generate({})
      end,
      desc = 'Gen Annonations',
    },
  },
  opts = function(_, _opts)
    require('neogen').setup({ snippet_engine = 'nvim' })
  end,
}
