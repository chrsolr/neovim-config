local luasnip = require 'luasnip'
local random = math.random

luasnip.filetype_extend('javascript', { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' })
luasnip.filetype_extend('typescript', { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' })

local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node
local function_node = luasnip.function_node

-- [[ all ]]
--
local uuid = snippet('uuid', {
  function_node(function()
    local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function(c)
      local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
      return string.format('%x', v):gsub('\n', '')
    end)
  end),
})

luasnip.add_snippets('all', { uuid })
