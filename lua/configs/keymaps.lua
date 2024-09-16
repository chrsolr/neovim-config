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

-- Toggle NvimTree
vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<CR>', { desc = 'Open directories' })

-- LazyGit
vim.keymap.set('n', '<leader>gg', '<cmd> LazyGit <CR>', { noremap = true, desc = 'Open LazyGit' })

-- Open terminal in a new buffer
vim.keymap.set('n', '<leader>tm', '<cmd> term <CR> i', { noremap = true, desc = 'Open terminal in a new buffer' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Split window vertically
vim.keymap.set('n', '<leader>v', '<cmd> vsp <CR>', { noremap = true, desc = 'Split Vertical' })

-- Split window horizontally
vim.keymap.set('n', '<leader>s', '<cmd> sp <CR>', { noremap = true, desc = 'Split Horizontal' })

-- Close buffer
vim.keymap.set('n', '<leader>x', '<cmd> BufDel <CR>', { noremap = true, desc = 'Close Buffer' })

-- Close other buffers
vim.keymap.set('n', '<leader>X', '<cmd> BufDelOthers <CR>', { noremap = true, desc = 'Close Other Buffer' })

-- Close current pane
vim.keymap.set('n', '<C-q>', '<C-w>q', { noremap = true, desc = 'Close pane' })

-- Move to left pane
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, desc = 'Move to left pane' })

-- Move to below pane
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, desc = 'Move to below pane' })

-- Move to top pane
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, desc = 'Move to top pane' })

-- Move to right pane
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, desc = 'Move to right pane' })

-- Do nothing when space is pressed in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move line up with wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move line down with wrap
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Open/Close LSP Diagnostics with trouble plugin
-- vim.keymap.set('n', '<leader>tt', '<cmd> TroubleToggle <CR>', { noremap = true, desc = 'Toggle trouble', silent = true })
vim.keymap.set('n', '<leader>tt', '<cmd> Trouble diagnostics toggle focus=true filter.buf=0 <CR>', { noremap = true, desc = 'Toggle trouble diagnostics' })
vim.keymap.set('n', '<leader>tT', '<cmd> Trouble diagnostics toggle <CR>', { noremap = true, desc = 'Toggle trouble diagnostics (Global)' })
vim.keymap.set('n', '<leader>tl', '<cmd> Trouble lsp toggle focus=false win.position=right <CR>', { noremap = true, desc = 'Toggle trouble LSP' })
vim.keymap.set('n', '<leader>ts', '<cmd> Trouble symbols toggle focus=false <CR>', { noremap = true, desc = 'Toggle trouble symbols' })
vim.keymap.set('n', '<leader>tc', '<cmd> Trouble loclist toggle <CR>', { noremap = true, desc = 'Toggle trouble loclist' })
vim.keymap.set('n', '<leader>tq', '<cmd> Trouble qflist toggle <CR>', { noremap = true, desc = 'Toggle trouble qflist' })

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
