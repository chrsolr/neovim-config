-- [[ LSP Config ]]
--
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      'williamboman/mason.nvim',
      config = true,
    },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      opts = {},
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },

  config = function()
    local on_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>..', vim.lsp.buf.code_action, 'Code Actions')
      nmap('<leader>.rn', vim.lsp.buf.rename, 'Code Rename')
      nmap('<leader>.df', vim.lsp.buf.definition, 'Go to Definition')
      nmap('gd', vim.lsp.buf.definition, 'Go to Definition')
      nmap('<leader>.rf', require('telescope.builtin').lsp_references, 'Go to References')
      nmap('<leader>.td', vim.lsp.buf.type_definition, 'Type Definition')
      nmap('<leader>.ip', vim.lsp.buf.implementation, 'Go to Implementation')
      nmap('<leader>.dc', vim.lsp.buf.declaration, 'Go to Declaration')

      -- [[ Remapped ]]
      -- nmap('gd', vim.lsp.buf.definition, 'Go to Definition')
      -- nmap('gr', require('telescope.builtin').lsp_references, 'Go to References')
      -- nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
      -- nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
      -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
      --
      -- [[ LSP Unmapped ]]
      -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
      -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
      -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
      -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
      -- nmap('<leader>wl', function()
      -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, 'Workspace List Folders')

      -- [[ Create a :Format Command ]]
      --
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        local conform = require 'conform'
        conform.format {
          lsp_fallback = true,
          async = true,
          timeout_ms = 500,
        }

        -- vim.lsp.buf.format()
      end, { desc = 'Format current buffer with Conform or LSP' })
    end

    local servers = {
      html = {},
      cssls = {},
      tsserver = {},
      eslint = {},
      tailwindcss = {},
      emmet_language_server = {},
      csharp_ls = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    local mason_lspconfig = require 'mason-lspconfig'

    -- nvim-cmp supports additional completion capabilities,
    -- so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }
  end,
}
