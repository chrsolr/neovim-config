-- [[ Setting options ]]
-- See `:help vim.o`

-- [[ Indent ]]
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- [[ Line wrap ]]
vim.wo.wrap = false
vim.wo.linebreak = true
vim.wo.list = false

-- [[ Set highlight on search ]]
vim.o.hlsearch = false

-- [[ Make line numbers default ]]
vim.o.relativenumber = true
vim.wo.number = true

-- [[ Enable mouse mode ]]
vim.o.mouse = 'a'

-- [[ Sync clipboard between OS and Neovim. ]]
-- See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- [[ Enable break indent ]]
vim.o.breakindent = true

-- [[ Save undo history ]]
vim.o.undofile = true

-- [[ Case-insensitive searching UNLESS \C or capital in search ]]
vim.o.ignorecase = true
vim.o.smartcase = true

-- [[ Keep signcolumn on by default ]]
vim.wo.signcolumn = 'yes'

-- [[ Decrease update time ]]
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- [[ Set completeopt to have a better completion experience ]]
vim.o.completeopt = 'menuone,noselect'

-- [[ NOTE: You should make sure your terminal supports this ]]
vim.o.termguicolors = true

-- [[ Copilot ]]
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ''
