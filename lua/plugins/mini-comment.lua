return {
	"echasnovski/mini.comment",
	version = "*",
	lazy = false,
	config = function()
		require("mini.comment").setup({
			mappings = {
				-- Normal and Visual modes
				comment = "<leader>/",

				-- Toggle comment on current line
				comment_line = "<leader>/",

				-- Toggle comment on visual selection
				comment_visual = "<leader>/",

				-- Define 'comment' textobject (like `dgc` - delete whole comment block)
				-- Works also in Visual mode if mapping differs from `comment_visual`
				textobject = "<leader>/",
			},
		})
	end,
}
