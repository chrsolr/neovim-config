require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local servers = {
  "tsserver",
  "cssls",
  "html",
  "tailwindcss",
  "emmet_language_server",
  "csharp_ls",
  "dockerls",
  "lua_ls",
  "yamlls",
}

local nvlsp = require("nvchad.configs.lspconfig")

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
