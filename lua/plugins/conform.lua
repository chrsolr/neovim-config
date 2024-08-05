return {
  "stevearc/conform.nvim",
  lazy = false,
  event = "BufWritePre",
  enabled = true,
  opts = require("configs.conform"),
}
