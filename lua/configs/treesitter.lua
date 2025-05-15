local options = {
  auto_install = true,
  highlight = { enable = true, use_languagetree = true },
  indent = { enable = true },
  ensure_installed = {
    "c",
    "tsx",
    "lua",
    "vim",
    "bash",
    "html",
    "yaml",
    "toml",
    "vimdoc",
    "markdown",
    "typescript",
    "javascript",
  },
}

require("nvim-treesitter.configs").setup(options)
