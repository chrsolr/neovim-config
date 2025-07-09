-- ~/.config/nvim/lua/custom/themes/opencode_dark.lua

local M = {}

M.base_30 = {
  white = "#eeeeee",
  darker_black = "#0a0a0a",
  black = "#141414", -- nvim bg
  black2 = "#1e1e1e",
  one_bg = "#282828", -- real bg of onedark
  one_bg2 = "#323232",
  one_bg3 = "#3c3c3c",
  grey = "#484848",
  grey_fg = "#606060",
  grey_fg2 = "#808080",
  light_grey = "#a0a0a0",
  red = "#e06c75",
  baby_pink = "#ffc09f",
  pink = "#fab283",
  line = "#1e1e1e", -- for lines like vertsplit
  green = "#7fd88f",
  vibrant_green = "#b8db87",
  blue = "#5c9cf5",
  nord_blue = "#828bb8",
  yellow = "#e5c07b",
  sun = "#f5a742",
  purple = "#9d7cd8",
  dark_purple = "#7b5bb6",
  teal = "#56b6c2",
  orange = "#f5a742",
  cyan = "#56b6c2",
  statusline_bg = "#1e1e1e",
  lightbg = "#323232",
  pmenu_bg = "#5c9cf5",
  folder_bg = "#5c9cf5",
}

M.base_16 = {
  base00 = "#0a0a0a",
  base01 = "#141414",
  base02 = "#1e1e1e",
  base03 = "#282828",
  base04 = "#323232",
  base05 = "#eeeeee",
  base06 = "#eeeeee",
  base07 = "#ffffff",
  base08 = "#e06c75",
  base09 = "#f5a742",
  base0A = "#e5c07b",
  base0B = "#7fd88f",
  base0C = "#56b6c2",
  base0D = "#5c9cf5",
  base0E = "#9d7cd8",
  base0F = "#fab283",
}

M.type = "dark"

M.polish_hl = {
  -- Additional polish if you want to override
  ["@keyword"] = { fg = M.base_30.purple },
  ["@variable"] = { fg = M.base_30.red },
  ["@function"] = { fg = M.base_30.pink },
  ["@string"] = { fg = M.base_30.green },
  ["@number"] = { fg = M.base_30.orange },
  ["@type"] = { fg = M.base_30.yellow },
  ["@operator"] = { fg = M.base_30.cyan },
  ["@comment"] = { fg = M.base_30.grey_fg2, italic = true },
}

return M
