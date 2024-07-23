return {
  'mfussenegger/nvim-lint',
  enabled = true,
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      javascript = { 'biomejs', 'eslint_d' },
      typescript = { 'biomejs', 'eslint_d' },
      javascriptreact = { 'biomejs', 'eslint_d' },
      typescriptreact = { 'biomejs', 'eslint_d' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', {
      clear = true,
    })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set({ 'n' }, '<leader>fl', function()
      lint.try_lint()
    end, { noremap = true, desc = 'Trigger linting for current file' })
  end,
}
