return {
  "mfussenegger/nvim-lint",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("configs.lint")
  end,
}
