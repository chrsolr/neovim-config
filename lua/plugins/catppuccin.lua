return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      -- flavour = 'latte',
      flavour = "frappe",
      -- flavour = 'macchiato',
      -- flavour = 'mocha',
    })
    vim.cmd.colorscheme("catppuccin")
    vim.cmd.hi("Comment gui=none")
  end,
}
