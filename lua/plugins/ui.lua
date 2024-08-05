---@type LazySpec
return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    lazy = false,
    keys = {
      {
        '<TAB>',
        '<cmd>BufferNext<cr>',
        desc = 'Next Buffer',
        mode = 'n',
      },
      {
        '<leader>bn',
        '<cmd>BufferNext<cr>',
        desc = 'Next Buffer',
        mode = 'n',
      },
      {
        '<S-TAB>',
        '<cmd>BufferPrevious<cr>',
        desc = 'Previous Buffer',
        mode = 'n',
      },
      {
        '<leader>bp',
        '<cmd>BufferPrevious<cr>',
        desc = 'Previous Buffer',
        mode = 'n',
      },
      {
        '<leader>bd',
        '<cmd>BufferClose<cr>',
        desc = 'Buffer Close',
      },
      {
        '<leader>bsn',
        '<cmd>BufferOrderByName<cr>',
        desc = 'Buffer order by Name',
      },
      {
        '<leader>bsd',
        '<cmd>BufferOrderByDirectory<cr>',
        desc = 'Buffer order by Directory',
      },
      {
        '<leader>bsl',
        '<cmd>BufferOrderByLanguage<cr>',
        desc = 'Buffer order by Language',
      },
      {
        '<leader>bsw',
        '<cmd>BufferOrderByWindowNumber<cr>',
        desc = 'Buffer order by Window Number',
      },
      {
        '<leader>bsb',
        '<cmd>BufferOrderByBufferNumber<cr>',
        desc = 'Buffer order by Buffer Number',
      },
    },
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },

      routes = {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
          },
        },
      },

      presets = {
        lsp_doc_border = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
  {
    'echasnovski/mini.icons',
    lazy = true,
    opts = {
      file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      },
      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
      },
    },
    init = function()
      package.preload['nvim-web-devicons'] = function()
        require('mini.icons').mock_nvim_web_devicons()
        return package.loaded['nvim-web-devicons']
      end
    end,
  },
  {
    'MunifTanjim/nui.nvim',
  },

  {
    'nvimdev/dashboard-nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VimEnter',
    opts = {
      theme = 'doom',

      config = {
        week_header = {
          enable = true,
        },
        header = {},
        center = {
          {
            icon = '󰇚 ',
            desc = 'Load last',
            action = 'lua require("persistence").load()',
            key_format = ' %s',
            key = 'l',
          },
          {
            icon = ' ',
            desc = 'projects',
            action = 'Telescope projects',
            key_format = ' %s',
            key = 'p',
            keymap = 'SPC f p',
          },
          {
            icon = ' ',
            desc = 'dotfiles',
            group = 'Number',
            action = 'Telescope find_files cwd=~/nixos-config',
            key_format = ' %s',
            key = 'd',
          },
          {
            icon = ' ',
            desc = 'config',
            group = 'variable',
            action = 'Telescope find_files cwd=~/.config/nvim',
            key_format = ' %s',
            key = 'c',
          },
          {
            icon = '󰒲 ',
            desc = 'lazy',
            action = 'Lazy',
            key_format = ' %s',
            key = 'L',
          },
          {
            icon = ' ',
            desc = 'quit',
            action = function()
              vim.api.nvim_input('<cmd>qa<cr>')
            end,
            key_format = ' %s',
            key = 'q',
          },
        },
        footer = {},
      },
    },
  },
}
