require("telescope").setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      height = 0.95,
      prompt_position = "top",
    },
    mappings = {
      n = {
        ["<C-x>"] = require("telescope.actions").delete_buffer,
      },
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<C-x>"] = require("telescope.actions").delete_buffer,
      },
    },
  },
  pickers = {
    -- find_files = {
    --   theme = 'ivy',
    -- },
    oldfiles = {
      cwd_only = true,
    },
  },
  extensions = {
    fzf = {},
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
