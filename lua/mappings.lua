require("nvchad.mappings")

local map = vim.keymap.set

-- Escape insert mode with jk
map("i", "jk", "<ESC>")

-- CMD enter command mode
map("n", ";", ":", { desc = "Enter command mode" })

-- Save file
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Save buffer" })

-- Lazygit
map("n", "<leader>gg", "<cmd> LazyGit <cr>", { desc = "Open Lazy Git" })

-- Close current pane
map("n", "<C-q>", "<C-w>q", { noremap = true, desc = "Close pane" })

-- LSP Keymaps
map("n", "<leader>..", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>.rr", vim.lsp.buf.rename, { desc = "Code Rename" })
