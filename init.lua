--[[
=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================
--]]

-- Set leader to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install Package Manager
-- `:help lazy.nvim.text` for more information
--
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
--
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = vim.api.nvim_create_augroup('TextkHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = '*',
})

-- Map the command to a key combination
vim.api.nvim_set_keymap('n', '<Leader>bc', ':BufCurOnly<CR>', { noremap = true, silent = true })

-- Install and config plugins
--
require('lazy').setup {
  { import = 'custom.plugins' },
}

-- Custom options
--
require 'custom.options'

-- Custom keymaps
--
require 'custom.keymaps'

-- Custom Snippets
--
require 'custom.snippets'

-- Setup neovim lua configuration
--
require('neodev').setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
