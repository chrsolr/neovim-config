vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = vim.api.nvim_create_augroup("TextkHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = "*",
})

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require("options")
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

-- vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
--   pattern = { "*.*" },
--   desc = "save view (folds), when closing file",
--   command = "mkview",
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   pattern = { "*.*" },
--   desc = "load view (folds), when opening file",
--   command = "silent! loadview",
-- })

vim.schedule(function()
  require("mappings")
end)
