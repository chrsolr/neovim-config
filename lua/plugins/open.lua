return {
  -- "chrsolr/open.nvim",
  dir = "~/dev/open.nvim",
  lazy = false,
  enabled = true,
  config = function()
    require("open").setup()
  end,
}
