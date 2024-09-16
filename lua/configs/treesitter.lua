local options = {
  auto_install = true,
  highlight = { enable = true, use_languagetree = true },
  indent = { enable = true },
  ensure_installed = {
    'c',
    'tsx',
    'lua',
    'vim',
    'bash',
    'html',
    'yaml',
    'toml',
    'luadoc',
    'vimdoc',
    'markdown',
    'typescript',
    'javascript',
    'markdown_inline',
  },
}

require('nvim-treesitter.configs').setup(options)
