-- [[ Set leader to <space> ]]
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install Package Manager ]]
-- `:help lazy.nvim.text` for more information
--
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
--
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Install and Config Plugins ]]
--
require('lazy').setup({
  -- [[ Install plugins from the custom folder ]]
  --
  { import = 'custom.plugins' },
}, {})

-- [[ Options and Keymaps ]]
--
require 'custom.options'
require 'custom.keymaps'
require 'custom.snippets'

-- [[ Setup neovim lua configuration ]]
--
require('neodev').setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
