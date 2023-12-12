-- [[ Enable telescope fzf native, if installed ]]
pcall(require('telescope').load_extension, 'fzf')

-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`


-- [[ Code ]]
--
vim.keymap.set({ 'n', 'v' }, '<leader>fm', '<cmd> Format <CR>', { noremap = true })


-- [[ Terminal Commands ]]
--
vim.keymap.set('n', '<leader>-vc', '<cmd> ConformInfo <CR>', { noremap = true, desc = 'Conform Info' })
vim.keymap.set('n', '<leader>-vm', '<cmd> Mason <CR>', { noremap = true, desc = 'Open Mason' })
vim.keymap.set('n', '<leader>-vl', '<cmd> Lazy <CR>', { noremap = true, desc = 'Open Lazy' })
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<C-c>', '<cmd>:qa<CR>', { desc = 'Exit Neovim' })


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
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>fa', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>fi', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Find in current buffer' })


-- [[ Lazygit ]]
--
vim.keymap.set('n', '<leader>gg', '<cmd> LazyGit <CR>', { noremap = true, desc = 'Open LazyGit' })


-- [[ Windows ]]
--
vim.keymap.set('n', '<S-tab>', '<cmd> bprevious <CR>', { noremap = true, desc = 'Previous buffer' })
vim.keymap.set('n', '<tab>', '<cmd> bnext <CR>', { noremap = true, desc = 'Next buffer' })
vim.keymap.set('n', '<leader>v', '<cmd> vsp <CR>', { noremap = true, desc = 'Split Vertical' })
vim.keymap.set('n', '<leader>s', '<cmd> sp <CR>', { noremap = true, desc = 'Split Horizontal' })
vim.keymap.set('n', '<leader>x', '<cmd> BufDel <CR>', { noremap = true, desc = 'Close buffer' })
vim.keymap.set('n', '<leader>X', '<cmd> BufDelOthers <CR>', { noremap = true, desc = 'Close other buffer' })
vim.keymap.set('n', '<C-Right>', '<cmd> vertical resize +5 <CR>', { noremap = true, desc = 'Increase vertical split' })
vim.keymap.set('n', '<C-Left>', '<cmd> vertical resize -5 <CR>', { noremap = true, desc = 'Decrease vertical split' })
vim.keymap.set('n', '<C-Up>', '<cmd> horizontal resize -5 <CR>', { noremap = true, desc = 'Decrease horizontal split' })
vim.keymap.set('n', '<C-Down>', '<cmd> horizontal resize +5 <CR>', { noremap = true, desc = 'Increase horizontal split' })


-- [[ Panes ]]
--
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, desc = 'Move to left pane' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, desc = 'Move to below pane' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, desc = 'Move to top pane' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, desc = 'Move to right pane' })
vim.keymap.set('n', '<C-q>', '<C-w>q', { noremap = true, desc = 'Close pane' })


-- [[ Misc ]]
--
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
