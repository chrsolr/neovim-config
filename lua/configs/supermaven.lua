local options = {
  keymaps = {
    accept_suggestion = '<C-a>',
  },
  ignore_filetypes = {},
  disable_inline_completion = false,
}

require('supermaven-nvim').setup(options)
