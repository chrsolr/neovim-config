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
      tag = 'v1.3.0',
      opts = {
        notification = {
          window = { winblend = 0 },
        },
      },
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
      nmap('<leader>.rr', vim.lsp.buf.rename, 'Code Rename')
      nmap('<leader>.gd', vim.lsp.buf.definition, 'Go to Definition')
      nmap('<leader>.gr', require('telescope.builtin').lsp_references, 'Go to References')
      nmap('<leader>.gt', vim.lsp.buf.type_definition, 'Type Definition')
      nmap('<leader>.gi', vim.lsp.buf.implementation, 'Go to Implementation')
      nmap('<leader>.gdc', vim.lsp.buf.declaration, 'Go to Declaration')
      nmap('gd', vim.lsp.buf.definition, 'Go to Definition')

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
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with vim.lsp.buf.format()' })
    end

    local servers = {
      html = {},
      cssls = {},
      tsserver = {},
      tailwindcss = {},
      emmet_language_server = {},
      csharp_ls = {},
      dockerls = {
        autostart = false,
      },
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
