-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for
---@type Base46Table
local M = {}

-- Convert HSL to RGB
local function hsl(h, s, l)
  s = s / 100
  l = l / 100

  local r, g, b

  if s == 0 then
    r, g, b = l, l, l -- achromatic
  else
    local function hueToRgb(p, q, t)
      if t < 0 then
        t = t + 1
      end

      if t > 1 then
        t = t - 1
      end

      if t < 1 / 6 then
        return p + (q - p) * 6 * t
      elseif t < 1 / 2 then
        return q
      elseif t < 2 / 3 then
        return p + (q - p) * (2 / 3 - t) * 6
      else
        return p
      end
    end

    local q = (l < 0.5) and (l * (1 + s)) or (l + s - l * s)
    local p = 2 * l - q

    r = hueToRgb(p, q, h / 360 + 1 / 3)
    g = hueToRgb(p, q, h / 360)
    b = hueToRgb(p, q, h / 360 - 1 / 3)
  end

  return string.format("#%02x%02x%02x", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))
end

local colors = {
  bg = hsl(216, 5, 21),
  bg_dark = hsl(216, 5, 18),

  fg = hsl(55, 12, 80),
  fg_dark = hsl(216, 2, 40),

  -- Soft colors
  accent = hsl(47, 84, 48),
  pink = hsl(2, 70, 80),
  purple = hsl(270, 70, 80),
  blue = hsl(200, 70, 80),
  green = hsl(140, 70, 80),
  red = hsl(0, 70, 80),
  error = hsl(0, 70, 60),
  info = hsl(200, 70, 60),
  warn = hsl(35, 70, 60),
}

-- UI
M.base_30 = {
  white = colors.fg,
  black = colors.bg, -- usually your theme bg
  darker_black = colors.bg_dark, -- 6% darker than black
  black2 = colors.bg_dark, -- 6% lighter than black
  one_bg = colors.fg_dark, -- 10% lighter than black
  one_bg2 = colors.fg_dark, -- 6% lighter than one_bg
  one_bg3 = colors.fg_dark, -- 6% lighter than one_bg2
  grey = colors.bg_dark, -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = colors.fg_dark, -- 10% lighter than grey
  grey_fg2 = colors.fg_dark, -- 5% lighter than grey
  light_grey = colors.fg,
  red = colors.red,
  baby_pink = colors.pink,
  pink = colors.pink,
  line = colors.green, -- 15% lighter than black
  green = colors.green,
  vibrant_green = colors.green,
  nord_blue = colors.blue,
  blue = colors.blue,
  seablue = colors.blue,
  yellow = colors.warn, -- 8% lighter than yellow
  sun = colors.warn,
  purple = colors.purple,
  dark_purple = colors.purple,
  teal = colors.blue,
  orange = colors.info,
  cyan = colors.info,
  statusline_bg = colors.bg_dark,
  lightbg = colors.bg,
  pmenu_bg = colors.bg,
  folder_bg = colors.bg,
}

-- check https://github.com/chriskempson/base16/blob/master/styling.md for more info
--
--
--
-- base00 - Default Background
-- base01 - Lighter Background (Used for status bars, line number and folding marks)
-- base02 - Selection Background
-- base03 - Comments, Invisibles, Line Highlighting
-- base04 - Dark Foreground (Used for status bars)
-- base05 - Default Foreground, Caret, Delimiters, Operators
-- base06 - Light Foreground (Not often used)
-- base07 - Light Background (Not often used)
-- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
-- base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
-- base0A - Classes, Markup Bold, Search Text Background
-- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
-- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
-- base0D - Functions, Methods, Attribute IDs, Headings
-- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
-- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
M.base_16 = {
  base00 = colors.bg,
  base01 = colors.bg_dark,
  base02 = colors.accent,
  base03 = colors.accent,
  base04 = colors.fg_dark,
  base05 = colors.fg,
  base06 = colors.fg,
  base07 = colors.bg,
  base08 = colors.fg_dark,
  base09 = colors.accent,
  base0A = colors.pink,
  base0B = colors.blue,
  base0C = colors.fg_dark,
  base0D = colors.purple,
  base0E = colors.fg_dark,
  base0F = colors.fg_dark,
}

-- OPTIONAL
-- overriding or adding highlights for this specific theme only
-- defaults/treesitter is the filename i.e integration there,

M.polish_hl = {
  defaults = {
    Comment = {
      bg = colors.bg, -- or M.base_30.cyan
      italic = true,
    },
  },

  treesitter = {
    ["@variable"] = { fg = colors.accent },
  },
}

-- set the theme type whether is dark or light
M.type = "dark" -- "or light"

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "abc")

return M
