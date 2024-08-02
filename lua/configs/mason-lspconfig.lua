local lspconfig = package.loaded["lspconfig"]

-- List of servers to ignore during install
local ignore_install = {}

-- Helper function to find if value is in table.
local function table_contains(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

-- Build a list of lsp servers to install minus the ignored list.
local all_servers = {
  "tsserver",
  "cssls",
  "html",
  "tailwindcss",
  "emmet_language_server",
  "csharp_ls",
  "lua_ls",
  "yamlls",
}

for _, s in ipairs(lspconfig.servers) do
  if not table_contains(ignore_install, s) then
    table.insert(all_servers, s)
  end
end

require("mason-lspconfig").setup({
  ensure_installed = all_servers,
  automatic_installation = false,
})
