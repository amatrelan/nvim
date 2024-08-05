--- @type LazySpec
return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add({
      { '<leader>b', group = 'Buffer' },
      { '<leader>bs', group = 'Sort' },
      { '<leader>c', group = 'Code' },
      { '<leader>d', group = 'Document' },
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Git' },
      { '<leader>n', group = 'Notes (org-roam)' },
      { '<leader>na', group = 'Alias' },
      { '<leader>nd', group = 'Daily' },
      { '<leader>no', group = 'Origin' },
      { '<leader>nr', group = 'Roaming' },
      { '<leader>o', group = 'Org' },
      { '<leader>ob', group = 'Tangle' },
      { '<leader>oi', group = 'Insert' },
      { '<leader>ol', group = 'Link' },
      { '<leader>on', group = 'Note' },
      { '<leader>ox', group = 'Time / Effort' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>w', group = 'Workspace' },
      { '<localleader>d', group = 'Debug' },
      { '<localleader>t', group = 'Test' },

      -- visual mode
      { '<leader>h', desc = 'Git Hunk', mode = 'v' },
    })
  end,
}
