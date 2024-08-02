return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvchad.configs.lspconfig").defaults()
    require("configs.lspconfig")
  end,
}
