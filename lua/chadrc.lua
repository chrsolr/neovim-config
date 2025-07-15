-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
}

M.ui = {
  statusline = {
    -- default/vscode/vscode_colored/minimal
    theme = "vscode_colored",
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    -- order = nil,
    -- modules = nil,
  },
}

return M
