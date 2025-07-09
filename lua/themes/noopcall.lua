-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for
---@type Base46Table
local M = {}

-- Convert HSL to RGB
local function hsl(h, s, l, p)
  p = p or 0
  if p > 0 then
    l = l + (100 - l) * (p / 100)
  else
    l = l * (1 + p / 100)
  end

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

local foreground = hsl(55, 11.54, 79.61)
local background = hsl(216, 4.76, 20.59)
local darker_black = hsl(216, 4.76, 20.59, -6)
local lighter_black = hsl(216, 4.76, 20.59, 6)
local one_bg = hsl(216, 4.76, 20.59, 10)
local one_bg2 = hsl(216, 4.76, 20.59, 16)
local one_bg3 = hsl(216, 4.76, 20.59, 22)
local grey = hsl(216, 4.76, 20.59, 40)
local grey_fg = hsl(216, 4.76, 20.59, 50)
local grey_fg2 = hsl(216, 4.76, 20.59, 55)
local light_grey = hsl(55, 11.54, 79.61, 10)

local accent = hsl(36, 71, 80)
local pink = hsl(2, 70, 80)
local purple = hsl(270, 70, 80)
local blue = hsl(200, 70, 80)
local green = hsl(140, 70, 80)
local red = hsl(0, 70, 80)

local error = hsl(1, 70, 60)
local info = hsl(200, 70, 60)
local warn = hsl(35, 70, 60)

-- UI
M.base_30 = {
  -- Base Grayscale
  white = foreground,
  black = background, -- usually your theme bg
  darker_black = darker_black, -- 6% darker than black
  black2 = lighter_black, -- 6% lighter than black
  one_bg = one_bg, -- 10% lighter than black
  one_bg2 = one_bg2, -- 6% lighter than one_bg
  one_bg3 = one_bg3, -- 6% lighter than one_bg2
  grey = grey, -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = grey_fg, -- 10% lighter than grey
  grey_fg2 = grey_fg2, -- 5% lighter than grey
  light_grey = light_grey,

  -- Colors
  red = red,
  baby_pink = pink,
  pink = pink,
  line = one_bg2, -- 15% lighter than black
  green = green,
  vibrant_green = green,
  nord_blue = blue,
  blue = blue,
  seablue = blue,
  yellow = warn, -- 8% lighter than yellow
  sun = warn,
  purple = purple,
  dark_purple = purple,
  teal = blue,
  orange = info,
  cyan = info,
  statusline_bg = background,
  lightbg = lighter_black,
  pmenu_bg = pink,
  folder_bg = accent,
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
  base00 = background,
  base01 = lighter_black,
  base02 = grey_fg,
  base03 = one_bg3,
  base04 = darker_black,
  base05 = foreground,
  base06 = light_grey,
  base07 = lighter_black,
  base08 = foreground,
  base09 = pink,
  base0A = pink,
  base0B = green,
  base0C = one_bg3,
  base0D = accent,
  base0E = one_bg3,
  base0F = one_bg3,
}

-- OPTIONAL
-- overriding or adding highlights for this specific theme only
-- defaults/treesitter is the filename i.e integration there,

M.polish_hl = {
  defaults = {
    Comment = {
      bg = background, -- or M.base_30.cyan
      italic = true,
    },
  },

  treesitter = {
    ["@variable"] = { fg = foreground },
  },
}

-- set the theme type whether is dark or light
M.type = "dark" -- "or light"

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "abc")

return M
