local options = {
  signs = {
    add = { text = '│' },
    change = { text = '│' },
    delete = { text = '󰍵' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '│' },
  },
}

-- local options = {
--   -- See `:help gitsigns.txt`
--   signs = {
--     add = { text = '+' },
--     change = { text = '~' },
--     delete = { text = '_' },
--     topdelete = { text = '‾' },
--     changedelete = { text = '~' },
--   },
-- }

return {
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = options,
}
