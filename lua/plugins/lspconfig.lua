return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require("configs.lspconfig")
  end,
}
