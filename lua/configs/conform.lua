local options = {
	notify_on_error = false,
	formatters_by_ft = {
		javascript = { { "prettierd" } },
		typescript = { { "prettierd" } },
		javascriptreact = { { "prettierd" } },
		typescriptreact = { { "prettierd" } },
		css = { { "prettierd" } },
		tailwindcss = { { "prettierd" } },
		html = { { "prettierd" } },
		json = { { "prettierd" } },
		yaml = { { "prettierd" } },
		markdown = { { "prettierd" } },
		lua = { { "stylua" } },
		toml = { "taplo" },
		cs = { "csharpier" },
		sql = { "sql_formatter" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
}

require("conform").setup(options)
