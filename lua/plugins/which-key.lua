--- @type LazySpec
return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add({
      { '<leader>c', group = 'Code' },
      { '<leader>d', group = 'Document' },
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Git' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>w', group = 'Workspace' },
      { '<leader>o', group = 'Org' },
      { '<leader>ox', group = 'Time / Effort' },
      { '<leader>on', group = 'Note' },
      { '<leader>ol', group = 'Link' },
      { '<leader>oi', group = 'Insert' },
      { '<leader>ob', group = 'Tangle' },
      { '<leader>n', group = 'Notes (org-roam)' },
      { '<leader>nr', group = 'Roaming' },
      { '<leader>na', group = 'Alias' },
      { '<leader>no', group = 'Origin' },
      { '<leader>nd', group = 'Daily' },
      { '<localleader>d', group = 'Debug' },
      { '<localleader>t', group = 'Test' },

      -- visual mode
      { '<leader>h', desc = 'Git Hunk', mode = 'v' },
    })
  end,
}
