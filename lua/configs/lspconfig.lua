vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    -- local function lsp_organize_imports()
    --   local params = { command = '_typescript.organizeImports', arguments = { vim.api.nvim_buf_get_name(0) }, title = '' }
    --   vim.lsp.buf.execute_command(params)
    -- end

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    local telescope_builtin = require 'telescope.builtin'
    map('gd', telescope_builtin.lsp_definitions, 'Go to Definition')
    map('gr', telescope_builtin.lsp_references, 'Go to References')
    map('gi', telescope_builtin.lsp_implementations, 'Go to Implementation')
    map('gt', telescope_builtin.lsp_type_definitions, 'Type Definition')
    map('gD', vim.lsp.buf.declaration, 'Go to Declaration')
    map('<leader>..', vim.lsp.buf.code_action, 'Code Actions')
    map('<leader>.rr', vim.lsp.buf.rename, 'Code Rename')
    -- map('<leader>.ro', lsp_organize_imports, 'Organize TS Imports')

    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      map('<leader>.ti', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, 'Toggle Inlay Hints')
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  tailwindcss = {},
  emmet_language_server = {},
  csharp_ls = {},
  eslint_d = {},
  taplo = {},
  helm_ls = {},
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
