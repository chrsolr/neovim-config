require("nvchad.mappings")

local map = vim.keymap.set

-- Better copy and paste in visual mode
map("v", "p", '"_dP', { noremap = true })

-- Don't yank newline when using $
map("v", "$", "g_", { noremap = true })

-- Escape insert mode with jk
map("i", "jk", "<ESC>")

-- CMD enter command mode
map("n", ";", ":", { desc = "Enter command mode" })

-- Save all buffers
map({ "n", "v", "i" }, "<C-s>", "<ESC><cmd> wa <CR>", { noremap = true, desc = "Save Files" })

-- Lazygit
map("n", "<leader>gg", "<cmd> LazyGit <cr>", { desc = "Open Lazy Git" })

-- Close current pane
map("n", "<C-q>", "<C-w>q", { noremap = true, desc = "Close pane" })

-- LSP Keymaps
map("n", "<leader>..", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>.rr", vim.lsp.buf.rename, { desc = "Code Rename" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "gr", require("telescope.builtin").lsp_references, { desc = "Go to References" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })

-- Format current buffer with Conform or LSP
map({ "n", "v" }, "<leader>fm", function()
  local conform = require("conform")
  conform.format({
    async = true,
    lsp_fallback = true,
    timeout_ms = 500,
  })
end, { desc = "Format current buffer with Conform or LSP" })

-- Scroll Up/Down & Center
map("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Scroll Up & Center" })
map("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Scroll Down & Center" })

-- Move higlighted line up/down one line
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move line up" })

-- Split window vertically/horizontal
map("n", "<leader>v", "<cmd> vsp <CR>", { noremap = true, desc = "Split Vertical" })
map("n", "<leader>s", "<cmd> sp <CR>", { noremap = true, desc = "Split Horizontal" })

-- Open terminal in a new buffer
map("n", "<leader>tm", "<cmd> term <CR> i", { noremap = true, desc = "Open terminal in a new buffer" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

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

-- [[ Telescope Builtins ]]
local telescope_builtin = require("telescope.builtin")

map("n", "<leader><leader>", telescope_builtin.buffers, { desc = "Find Existing Buffers" })
map("n", "<leader>ff", telescope_builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fr", telescope_builtin.oldfiles, { desc = "Find Recently Opened Files" })
map("n", "<leader>fg", telescope_builtin.git_files, { desc = "Find Git Files" })
map("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Search Help" })
map("n", "<leader>fa", telescope_builtin.live_grep, { desc = "Search by Grep" })
map("n", "<leader>fw", telescope_builtin.grep_string, { desc = "Search Current Word" })
map("n", "<leader>fd", telescope_builtin.diagnostics, { desc = "Search Diagnostics" })
map("n", "<leader>fk", telescope_builtin.keymaps, { desc = "Search Keymaps" })
map("n", "<leader>ft", telescope_builtin.builtin, { desc = "Search Select Telescope" })

-- Copilot Chat Toggle
map(
  { "n", "v" },
  "<leader>cc",
  "<cmd> CopilotChatToggle <CR>",
  { silent = true, replace_keycodes = false, desc = "Copilot Chat Toggle" }
)

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
