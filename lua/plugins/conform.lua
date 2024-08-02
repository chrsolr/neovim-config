-- return {
-- 	{
-- 		"stevearc/conform.nvim",
-- 		event = {
-- 			"BufReadPre",
-- 			"BufNewFile",
-- 		},
-- 		lazy = false,
-- 		config = function()
-- 			require("configs.conform")
-- 		end,
-- 	},
-- }

return {
	"stevearc/conform.nvim",
	lazy = false,
	event = {
		"BufWritePre",
	},
	cmd = { "ConformInfo" },
	-- opts = options,
	config = function()
		require("configs.conform")
	end,
}
