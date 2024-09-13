return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  opts = {
    enable_git_status = false,
  },
  keys = {
    {
      "<C-n>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<C-N>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<leader>ge",
      false,
    },
    {
      "<leader>be",
      false,
    },
  },
}
