local lspconfig = package.loaded["lspconfig"]

local all_servers = {
  "ts_ls",
  "cssls",
  "html",
  "tailwindcss",
  "emmet_language_server",
  "csharp_ls",
  "dockerls",
  "lua_ls",
  "yamlls",
}

require("mason-lspconfig").setup({
  ensure_installed = all_servers,
  automatic_installation = false,
})
