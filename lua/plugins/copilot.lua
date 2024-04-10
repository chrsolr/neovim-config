return {
	"zbirenbaum/copilot.lua",
	enabled = true,
	event = "VeryLazy",
	cmd = "Copilot",
	config = function()
		require("configs.copilot")
	end,
}
