return {
  "mfussenegger/nvim-lint",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    linters = {
      eslint_d = {
        args = { "--no-warn-ignored", "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
      },
    },
  },
  config = function()
    require("configs.lint")
  end,
}
