return {
	{
		"stevearc/conform.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		lazy = false,
		config = function()
			require("configs.conform")
		end,
	},
}
