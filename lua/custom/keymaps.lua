-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Better copy and paste in visual mode
vim.keymap.set('v', 'p', '"_dP', { noremap = true })

-- Don't yank newline when using $
vim.keymap.set('v', '$', 'g_', { noremap = true })

-- Escape insert mode with jk
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true })

-- Show Signature Help
vim.keymap.set('n', '<leader>.sh', vim.lsp.buf.signature_help, { noremap = true, desc = 'LSP: Signature Help' })

-- Show diagnostics (errors and warnings)
vim.keymap.set('n', '<leader>.e', vim.diagnostic.open_float, { desc = 'LSP: Floating Diagnostic' })

-- Show a list of diagnostics
vim.keymap.set('n', '<leader>.q', vim.diagnostic.setloclist, { desc = 'LSP: Quickfix list' })

-- Displays hover information about the symbol under the cursor in a floating
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, desc = 'LSP: Hover' })

-- Format current buffer with Conform or LSP
vim.keymap.set({ 'n', 'v' }, '<leader>fm', function(_)
  local conform = require 'conform'
  conform.format {
    async = true,
    lsp_fallback = true,
    timeout_ms = 500,
  }
end, { desc = 'Format current buffer with Conform or LSP' })

-- Open directories
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open directories' })

-- Open terminal in a new buffer
vim.keymap.set('n', '<leader>tm', '<cmd> term <CR> i', { noremap = true, desc = 'Open terminal in a new buffer' })

-- LazyGit
vim.keymap.set('n', '<leader>gg', '<cmd> LazyGit <CR>', { noremap = true, desc = 'Open LazyGit' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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

-- [[ Telescope Builtins ]]
local telescope_builtin = require 'telescope.builtin'

-- Open list of buffers
vim.keymap.set('n', '<leader><leader>', telescope_builtin.buffers, { desc = 'Find Existing Buffers' })

-- Search for files
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Find Files' })

-- Search for recently opened files
vim.keymap.set('n', '<leader>fr', telescope_builtin.oldfiles, { desc = 'Find Recently Opened Files' })

-- Search for git files
vim.keymap.set('n', '<leader>fg', telescope_builtin.git_files, { desc = 'Find Git Files' })

-- Search for documentations
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Search Help' })

-- Search for for text in files
vim.keymap.set('n', '<leader>fa', telescope_builtin.live_grep, { desc = 'Search by Grep' })

-- Search for word in files
vim.keymap.set('n', '<leader>fw', telescope_builtin.grep_string, { desc = 'Search Current Word' })

-- Search diagnostics list
vim.keymap.set('n', '<leader>fd', telescope_builtin.diagnostics, { desc = 'Search Diagnostics' })

-- Search keymaps
vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, { desc = 'Search Keymaps' })

-- Search Telescope
vim.keymap.set('n', '<leader>ft', telescope_builtin.builtin, { desc = 'Search Select Telescope' })

-- Search current buffer
vim.keymap.set('n', '<leader>f/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescope_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Find in Current Buffer' })

-- Search Neovim Configuration
vim.keymap.set('n', '<leader>fn', function()
  telescope_builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Find in Neovim Files' })

-- Search Neovim Configuration
vim.keymap.set('n', '<leader>f.', function()
  telescope_builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = 'Find in Neovim Files' })

-- Move to previous buffer
vim.keymap.set('n', '<S-tab>', '<cmd> bprevious <CR>', { noremap = true, desc = 'Previous buffer' })

-- Move to next buffer
vim.keymap.set('n', '<tab>', '<cmd> bnext <CR>', { noremap = true, desc = 'Next buffer' })

-- Split window vertically
vim.keymap.set('n', '<leader>v', '<cmd> vsp <CR>', { noremap = true, desc = 'Split Vertical' })

-- Split window horizontally
vim.keymap.set('n', '<leader>s', '<cmd> sp <CR>', { noremap = true, desc = 'Split Horizontal' })

-- Close buffer
vim.keymap.set('n', '<leader>x', '<cmd> BufDel <CR>', { noremap = true, desc = 'Close Buffer' })

-- Close other buffers
vim.keymap.set('n', '<leader>X', '<cmd> BufDelOthers <CR>', { noremap = true, desc = 'Close Other Buffer' })

-- Increase vertical split
vim.keymap.set('n', '<leader>l', '<cmd> vertical resize +5 <CR>', { noremap = true, desc = 'Increase vertical split' })

-- Decrease vertical split
vim.keymap.set('n', '<leader>h', '<cmd> vertical resize -5 <CR>', { noremap = true, desc = 'Decrease vertical split' })

-- Increase horizontal split
vim.keymap.set('n', '<leader>k', '<cmd> horizontal resize -5 <CR>', { noremap = true, desc = 'Decrease horizontal split' })

-- Decrease horizontal split
vim.keymap.set('n', '<leader>j', '<cmd> horizontal resize +5 <CR>', { noremap = true, desc = 'Increase horizontal split' })

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

-- Open/Close LSP Diagnostics with trouble plugin
vim.keymap.set('n', '<leader>tt', '<cmd> TroubleToggle <CR>', { noremap = true, desc = 'Toggle trouble' })

-- Accept the current suggestion
vim.keymap.set('i', '<C-a>', 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false })

-- Move to next suggestion
vim.keymap.set('i', '<C-k>', 'copilot#Previous()', { silent = true, expr = true })

-- Move to previous suggestion
vim.keymap.set('i', '<C-j>', 'copilot#Next()', { silent = true, expr = true })

-- Do nothing when space is pressed in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move line up with wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move line down with wrap
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Open spell suggestions
vim.keymap.set('n', '<leader>-z=', 'z=', { noremap = true, desc = 'Spell: Show Suggestions' })

-- Add word to spell dictionary
vim.keymap.set('n', '<leader>-za', 'zg', { noremap = true, desc = 'Spell: Add to Dictionary' })

-- Toggle spell check to local buffer
vim.keymap.set('n', '<leader>-zT', function()
  ---@diagnostic disable-next-line: param-type-mismatch
  vim.opt_local.spell = not (vim.opt_local.spell:get())
  print('spell local: ' .. tostring(vim.o.spell))
end, { noremap = true, desc = 'Toggle spell check (Local)' })

-- Toggle spell check to global
vim.keymap.set('n', '<leader>-zt', function()
  ---@diagnostic disable-next-line: param-type-mismatch
  vim.opt.spell = not (vim.opt.spell:get())
  print('spell global: ' .. tostring(vim.o.spell))
end, { noremap = true, desc = 'Toggle spell check (Global)' })

-- Go to next diagnostic message
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })

-- Go to previous diagnostic message
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- -- Codeium Accept
-- vim.keymap.set('i', '<C-;>', function()
--   return vim.fn['codeium#Accept']()
-- end, { noremap = true, silent = true, desc = 'Codeium: Accept' })
--
-- -- Codeium Clear
-- vim.keymap.set('i', '<C-x>', function()
--   return vim.fn['codeium#Clear']()
-- end, { noremap = true, silent = true, desc = 'Codeium: Clear' })
--
-- -- Codeium Clear
-- vim.keymap.set('i', '<C-[>', function()
--   return vim.fn['codeium#CycleCompletions'](-1)
-- end, { noremap = true, silent = true, desc = 'Codeium: Previous' })
--
-- -- Codeium Clear
-- vim.keymap.set('i', '<C-]>', function()
--   return vim.fn['codeium#CycleCompletions'](1)
-- end, { noremap = true, silent = true, desc = 'Codeium: Next' })
