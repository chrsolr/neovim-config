-- [[ Basic Keymaps ]]
-- See `:help map()`

require("nvchad.mappings")

local map = vim.keymap.set

-- Better copy and paste in visual mode
map("v", "p", '"_dP', { noremap = true })

-- Don't yank newline when using $
map("v", "$", "g_", { noremap = true })

-- Escape insert mode with jk
map("i", "jk", "<ESC>", { noremap = true })

-- Show Signature Help
map("n", "<leader>.sh", vim.lsp.buf.signature_help, { noremap = true, desc = "LSP: Signature Help" })

-- Show diagnostics (errors and warnings)
map("n", "<leader>.e", vim.diagnostic.open_float, { desc = "LSP: Floating Diagnostic" })

-- Show a list of diagnostics
map("n", "<leader>.q", vim.diagnostic.setloclist, { desc = "LSP: Quickfix list" })

-- Displays hover information about the symbol under the cursor in a floating
map("n", "K", vim.lsp.buf.hover, { noremap = true, desc = "LSP: Hover" })

-- Format current buffer with Conform or LSP
map({ "n", "v" }, "<leader>fm", function()
	local conform = require("conform")
	conform.format({
		async = true,
		lsp_fallback = true,
		timeout_ms = 500,
	})
end, { desc = "Format current buffer with Conform or LSP" })

-- Open directories
map("n", "-", "<cmd>Oil<CR>", { desc = "Open directories" })

-- Open terminal in a new buffer
map("n", "<leader>tm", "<cmd> term <CR> i", { noremap = true, desc = "Open terminal in a new buffer" })

-- Terminal New horizontal term
-- map("n", "<leader>th", function()
-- 	require("nvchad.term").new({ pos = "sp", size = 0.3 })
-- end, { desc = "Terminal New horizontal term" })

-- Terminal New vertical window
-- map("n", "<leader>tv", function()
-- 	require("nvchad.term").new({ pos = "vsp", size = 0.3 })
-- end, { desc = "Terminal New vertical window" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>.
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- LazyGit
map("n", "<leader>gg", "<cmd> LazyGit <CR>", { noremap = true, desc = "Open LazyGit" })

-- Save current buffer
map({ "n", "v", "i" }, "<C-s>", "<ESC><cmd> w <CR>", { noremap = true, desc = "Save Files" })

-- Save all buffers
map({ "n", "v", "i" }, "<C-S>", "<ESC><cmd> wa <CR>", { noremap = true, desc = "Save Files" })

-- Save all buffers with leader
map("n", "<leader>ww", "<ESC><cmd> wa <CR>", { noremap = true, desc = "Save Files" })

-- Scroll Up & Center
map("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Scroll Up & Center" })

-- Scroll Down & Center
map("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Scroll Down & Center" })

-- Move higlighted line down one line
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move line down" })

-- Move higlighted line up one line
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move line up" })

-- [[ Telescope Builtins ]]
local telescope_builtin = require("telescope.builtin")

-- Open list of buffers
map("n", "<leader><leader>", telescope_builtin.buffers, { desc = "Find Existing Buffers" })

-- Search for files
map("n", "<leader>ff", telescope_builtin.find_files, { desc = "Find Files" })

-- Search for recently opened files
map("n", "<leader>fr", telescope_builtin.oldfiles, { desc = "Find Recently Opened Files" })

-- Search for git files
map("n", "<leader>fg", telescope_builtin.git_files, { desc = "Find Git Files" })

-- Search for documentations
map("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Search Help" })

-- Search for for text in files
map("n", "<leader>fa", telescope_builtin.live_grep, { desc = "Search by Grep" })

-- Search for word in files
map("n", "<leader>fw", telescope_builtin.grep_string, { desc = "Search Current Word" })

-- Search diagnostics list
map("n", "<leader>fd", telescope_builtin.diagnostics, { desc = "Search Diagnostics" })

-- Search keymaps
map("n", "<leader>fk", telescope_builtin.keymaps, { desc = "Search Keymaps" })

-- Search Telescope
map("n", "<leader>ft", telescope_builtin.builtin, { desc = "Search Select Telescope" })

-- -- Search current buffer
-- map('n', '<leader>f/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = 'Find in Current Buffer' })
--
-- -- Search Neovim Configuration
-- map('n', '<leader>fn', function()
--   telescope_builtin.find_files { cwd = vim.fn.stdpath 'config' }
-- end, { desc = 'Find in Neovim Files' })
--
-- -- Search Neovim Configuration
-- map('n', '<leader>f.', function()
--   telescope_builtin.live_grep {
--     grep_open_files = true,
--     prompt_title = 'Live Grep in Open Files',
--   }
-- end, { desc = 'Find in Neovim Files' })

-- Split window vertically
map("n", "<leader>v", "<cmd> vsp <CR>", { noremap = true, desc = "Split Vertical" })

-- Split window horizontally
map("n", "<leader>s", "<cmd> sp <CR>", { noremap = true, desc = "Split Horizontal" })

-- Increase vertical split
map("n", "<leader>h", "<cmd> vertical resize +5 <CR>", { noremap = true, desc = "Increase vertical split" })

-- Decrease vertical split
map("n", "<leader>l", "<cmd> vertical resize -5 <CR>", { noremap = true, desc = "Decrease vertical split" })

-- Increase horizontal split
map("n", "<leader>k", "<cmd> horizontal resize -5 <CR>", { noremap = true, desc = "Decrease horizontal split" })

-- Decrease horizontal split
map("n", "<leader>j", "<cmd> horizontal resize +5 <CR>", { noremap = true, desc = "Increase horizontal split" })

-- Close current pane
map("n", "<C-q>", "<C-w>q", { noremap = true, desc = "Close pane" })

-- Open/Close LSP Diagnostics with trouble plugin
map(
	"n",
	"<leader>tt",
	"<cmd> Trouble diagnostics toggle filter.buf=0 <CR>",
	{ noremap = true, desc = "Toggle trouble diagnostics" }
)
map(
	"n",
	"<leader>tT",
	"<cmd> Trouble diagnostics toggle <CR>",
	{ noremap = true, desc = "Toggle trouble diagnostics (Global)" }
)
map(
	"n",
	"<leader>tl",
	"<cmd> Trouble lsp toggle focus=false win.position=right <CR>",
	{ noremap = true, desc = "Toggle trouble LSP" }
)
map(
	"n",
	"<leader>ts",
	"<cmd> Trouble symbols toggle focus=false <CR>",
	{ noremap = true, desc = "Toggle trouble symbols" }
)
map("n", "<leader>tc", "<cmd> Trouble loclist toggle <CR>", { noremap = true, desc = "Toggle trouble loclist" })
map("n", "<leader>tq", "<cmd> Trouble qflist toggle <CR>", { noremap = true, desc = "Toggle trouble qflist" })

-- Accept the current suggestion
-- map("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false })
-- map("i", "<C-a>", "codeium#Accept()", { silent = true, expr = true, replace_keycodes = false })

-- Copilot Chat Toggle
map(
	{ "n", "v" },
	"<leader>cc",
	"<cmd> CopilotChatToggle <CR>",
	{ silent = true, replace_keycodes = false, desc = "Copilot Chat Toggle" }
)
-- map(
-- 	{ "n", "v" },
-- 	"<leader>cc",
-- 	"<cmd> codeium#Chat() <CR>",
-- 	{ silent = true, replace_keycodes = false, desc = "Copilot Chat Toggle" }
-- )

--
map({ "n", "v" }, "<leader>fc", function()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "Copilot Chat Actions" })

-- -- Move to next suggestion
-- map('i', '<C-k>', 'copilot#Previous()', { silent = true, expr = true })
--
-- -- Move to previous suggestion
-- map('i', '<C-j>', 'copilot#Next()', { silent = true, expr = true })
--
-- Do nothing when space is pressed in normal and visual mode
-- map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- LSP Keymaps
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "gr", require("telescope.builtin").lsp_references, { desc = "Go to References" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "<leader>..", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>.rr", vim.lsp.buf.rename, { desc = "Code Rename" })

-- Move line up with wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move line down with wrap
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Open spell suggestions
map("n", "<leader>-z=", "z=", { noremap = true, desc = "Spell: Show Suggestions" })

-- Add word to spell dictionary
map("n", "<leader>-za", "zg", { noremap = true, desc = "Spell: Add to Dictionary" })

-- Toggle spell check to local buffer
map("n", "<leader>-zT", function()
	---@diagnostic disable-next-line: param-type-mismatch
	vim.opt_local.spell = not (vim.opt_local.spell:get())
	print("spell local: " .. tostring(vim.o.spell))
end, { noremap = true, desc = "Toggle spell check (Local)" })

-- Toggle spell check to global
map("n", "<leader>-zt", function()
	---@diagnostic disable-next-line: param-type-mismatch
	vim.opt.spell = not (vim.opt.spell:get())
	print("spell global: " .. tostring(vim.o.spell))
end, { noremap = true, desc = "Toggle spell check (Global)" })

-- Go to next diagnostic message
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })

-- Go to previous diagnostic message
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
