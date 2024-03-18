local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "clangd", "tsserver" }

-- local servers = {
-- 	html = {},
-- 	cssls = {},
-- 	tsserver = {},
-- 	tailwindcss = {},
-- 	emmet_language_server = {},
-- 	csharp_ls = {},
-- 	dockerls = {
-- 		autostart = false,
-- 	},
-- 	lua_ls = {
-- 		settings = {
-- 			Lua = {
-- 				workspace = { checkThirdParty = false },
-- 				telemetry = { enable = false },
-- 				runtime = { version = "LuaJIT" },
-- 				diagnostics = { disable = { "missing-fields" } },
-- 			},
-- 		},
-- 	},
-- }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
