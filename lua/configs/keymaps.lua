-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Better copy and paste in visual mode
vim.keymap.set('v', 'p', '"_dP', { noremap = true })

-- Don't yank newline when using $
vim.keymap.set('v', '$', 'g_', { noremap = true })

-- Escape insert mode with jk
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true })

-- Save current buffer
vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<ESC><cmd> w <CR>', { noremap = true, desc = 'Save Files' })

-- Save all buffers
vim.keymap.set({ 'n', 'v', 'i' }, '<C-S>', '<ESC><cmd> wa <CR>', { noremap = true, desc = 'Save Files' })

-- Save all buffers with leader
vim.keymap.set('n', '<leader>ww', '<ESC><cmd> wa <CR>', { noremap = true, desc = 'Save Files' })

-- Scroll Up & Center
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, desc = 'Scroll Up & Center' })

-- Scroll Down & Center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, desc = 'Scroll Down & Center' })

-- Move higlighted line down one line
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, desc = 'Move line down' })

-- Move higlighted line up one line
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, desc = 'Move line up' })

-- Cycle tabs
vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, desc = 'Prev Buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { noremap = true, desc = 'Next Buffer' })

-- [[ Telescope Builtins ]]
local telescope_builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader><leader>', telescope_builtin.buffers, { desc = 'Find Existing Buffers' })
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fr', telescope_builtin.oldfiles, { desc = 'Find Recently Opened Files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.git_files, { desc = 'Find Git Files' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>fa', telescope_builtin.live_grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>fw', telescope_builtin.grep_string, { desc = 'Search Current Word' })
vim.keymap.set('n', '<leader>fd', telescope_builtin.diagnostics, { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, { desc = 'Search Keymaps' })
vim.keymap.set('n', '<leader>ft', telescope_builtin.builtin, { desc = 'Search Select Telescope' })

vim.keymap.set('n', '<leader>f/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Find in Current Buffer' })

vim.keymap.set('n', '<leader>fn', function()
  telescope_builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Find in Neovim Files' })

vim.keymap.set('n', '<leader>f.', function()
  telescope_builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = 'Find in Neovim Files' })
