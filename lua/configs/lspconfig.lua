-- require("nvchad.configs.lspconfig").defaults()
--
-- local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = {
  "ts_ls",
  "cssls",
  "html",
  "tailwindcss",
  "emmet_language_server",
  "csharp_ls",
  "dockerls",
  "lua_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local function lsp_organize_imports()
      local params =
        { command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) }, title = "" }
      vim.lsp.buf.execute_command(params)
    end

    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    local telescope_builtin = require("telescope.builtin")
    map("gd", telescope_builtin.lsp_definitions, "Go to Definition")
    map("gr", telescope_builtin.lsp_references, "Go to References")
    map("gi", telescope_builtin.lsp_implementations, "Go to Implementation")
    map("gt", telescope_builtin.lsp_type_definitions, "Type Definition")
    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
    map("<leader>..", vim.lsp.buf.code_action, "Code Actions")
    map("<leader>.rr", vim.lsp.buf.rename, "Code Rename")
    map("<leader>.ro", lsp_organize_imports, "Organize TS Imports")

    -- local client = vim.lsp.get_client_by_id(event.data.client_id)
    -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    --   local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
    --   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    --     buffer = event.buf,
    --     group = highlight_augroup,
    --     callback = vim.lsp.buf.document_highlight,
    --   })
    --
    --   vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    --     buffer = event.buf,
    --     group = highlight_augroup,
    --     callback = vim.lsp.buf.clear_references,
    --   })
    --
    --   vim.api.nvim_create_autocmd("LspDetach", {
    --     group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
    --     callback = function(event2)
    --       vim.lsp.buf.clear_references()
    --       vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
    --     end,
    --   })
    -- end
    --
    -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    --   map("<leader>.ti", function()
    --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
    --   end, "Toggle Inlay Hints")
    -- end
  end,
})
