return {
	'ojroques/nvim-bufdel',
	enabled = true,
	config = function()
		require('bufdel').setup {
			quit = false
		}
	end
}
