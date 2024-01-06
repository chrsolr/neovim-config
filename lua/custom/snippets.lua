local luasnip = require 'luasnip'
local random = math.random

luasnip.filetype_extend('javascript', { 'javascriptreact', 'typescript', 'typescriptreact' })
luasnip.filetype_extend('typescript', { 'typescriptreact', 'javascript', 'javascriptreact' })

local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node
local function_node = luasnip.function_node

vim.keymap.set({ 'i', 's' }, '<C-m>', function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

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

-- [[ JavaScript ]]
--
local logjson = snippet('logjson', {
  text_node 'console.log(JSON.stringify(',
  insert_node(1),
  text_node ', ',
  insert_node(2, 'null'),
  text_node ', ',
  insert_node(3, '2'),
  text_node '))',
  insert_node(0),
})

luasnip.add_snippets('javascript', { logjson })
luasnip.add_snippets('all', { uuid })
