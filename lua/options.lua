require("nvchad.options")

local opt = vim.opt
local g = vim.g

-- Make line numbers default
opt.relativenumber = true
opt.number = true

-- Enable mouse mode
opt.mouse = "a"

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- Sync clipboard between OS and Neo
-- See `:help 'clipboard'`
opt.clipboard = "unnamedplus"

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neowill display certain whitespace in the editor
--  See :help 'list'
--  and :help 'listchars'
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type
opt.inccommand = "split"

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Set highlight on search
opt.hlsearch = false

-- Tab settings
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Line wrap
opt.wrap = false
opt.linebreak = true

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true

-- Set end of buffer to empty
opt.fillchars = "eob: "

-- Fold Level
opt.foldlevelstart = 0

-- Copilot
g.copilot_enabled = 0
-- g.copilot_no_tab_map = true
-- g.copilot_assume_mapped = true
-- g.copilot_tab_fallback = ''

-- Codeium
-- g.codeium_no_tab_map = 1
-- g.codeium_disable_bindings = 0
-- g.codeium_enabled = false
