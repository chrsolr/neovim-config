return {
  dir = "~/dev/open.nvim",
  lazy = false,
  enabled = true,
  config = function()
    require("open").setup()
  end,
}
