-- [[ Enable telescope fzf native, if installed ]]
pcall(require('telescope').load_extension, 'fzf')

-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- [[ Remap for dealing with word wrap ]]
--
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- [[ Terminal Commands ]]
--
vim.keymap.set('n', '<leader>-vc', '<cmd> ConformInfo <CR>', { noremap = true, desc = 'Conform Info' })
vim.keymap.set('n', '<leader>-vm', '<cmd> Mason <CR>', { noremap = true, desc = 'Open Mason' })
vim.keymap.set('n', '<leader>-vl', '<cmd> Lazy <CR>', { noremap = true, desc = 'Open Lazy' })


-- [[ Save File ]]
--
vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<ESC><cmd> w <CR>', { noremap = true, desc = 'Save Files' })
vim.keymap.set({ 'n', 'v', 'i' }, '<C-S>', '<ESC><cmd> wa <CR>', { noremap = true, desc = 'Save Files' })
vim.keymap.set({ 'n' }, '<leader>ww', '<ESC><cmd> wa <CR>', { noremap = true, desc = 'Save Files' })


-- [[ Telescope ]]
-- :help telescope.builtin
--
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Find git files' })

-- [[ Lazygit ]]
--
vim.keymap.set('n', '<leader>gg', '<cmd> LazyGit <CR>', { noremap = true, desc = 'Open LazyGit' })
