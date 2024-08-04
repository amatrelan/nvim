---@type LazySpec
return { -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    event = { 'BufNewFile', 'BufReadPre' },
    dependencies = {
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            'lazy.nvim',
          },
        },
      },
      { 'Bilal2453/luvit-meta', lazy = true },
      {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, {
            name = 'lazydev',
            group_index = 0,
          })
        end,
      },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
          map('gr', require('telescope.builtin').lsp_references, 'Goto References')
          map('gI', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
          map('gG', require('telescope.builtin').lsp_type_definitions, 'Type Definition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
          map('<localleader>r', vim.lsp.buf.rename, 'Rename')
          map('<localleader>a', vim.lsp.buf.code_action, 'Code Action')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- The following autocommand is used to enable inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            -- vim.lsp.inlay_hint.enable(true)
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, 'Toggle Inlay Hints')
          end
        end,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function()
          vim.lsp.buf.clear_references()
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        basedpyright = {},
        emmet_ls = {
          filetypes = {
            'css',
            'eruby',
            'html',
            'htmldjango',
            'javascriptreact',
            'less',
            'pug',
            'sass',
            'scss',
            'template',
            'typescriptreact',
          },
        },
        eslint = {},
        jsonls = {},
        gopls = {},
        golangci_lint_ls = {},
        html = {
          filetypes = {
            'html',
            'templ',
            'template',
          },
        },
        nixd = {},
        ruff_lsp = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },

        -- random non-programming
        taplo = {},
        marksman = {},
        -- ltex = {},
      }

      for k, v in pairs(servers) do
        local server = v or {}
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[k].setup(server)
      end
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    cmd = 'Trouble',
    opts = {},

    keys = {
      {
        '<leader>q',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics',
      },
      {
        '<leader>Q',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics',
      },
      {
        '<leader>ts',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols',
      },
      {
        '<leader>tl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP: Def / Ref / etc...',
      },
    },
  },
}
