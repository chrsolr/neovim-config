return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
    },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'j-hui/fidget.nvim',
      opts = {},
    },
    'folke/neodev.nvim',
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', vim.lsp.buf.definition, 'Go to Definition')
        map('gr', require('telescope.builtin').lsp_references, 'Go to References')
        map('gi', vim.lsp.buf.implementation, 'Go to Implementation')
        map('gt', vim.lsp.buf.type_definition, 'Type Definition')
        map('gD', vim.lsp.buf.declaration, 'Go to Declaration')
        map('<leader>..', vim.lsp.buf.code_action, 'Code Actions')
        map('<leader>rn', vim.lsp.buf.rename, 'Code Rename')

        -- [[ LSP Unmapped ]]
        -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
        -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
        -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
        -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
        -- nmap('<leader>wl', function()
        -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, 'Workspace List Folders')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      html = {},
      cssls = {},
      tsserver = {},
      tailwindcss = {},
      emmet_language_server = {},
      csharp_ls = {},
      eslint_d = {},
      taplo = {},
      dockerls = {
        autostart = false,
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            runtime = { version = 'LuaJIT' },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })

    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
    }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          require('lspconfig')[server_name].setup {
            cmd = server.cmd,
            settings = server.settings,
            filetypes = server.filetypes,
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
          }
        end,
      },
    }
  end,
}
