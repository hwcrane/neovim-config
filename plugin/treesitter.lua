vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter'
})

require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
})

require('nvim-treesitter').install { 'rust', 'python', "lua", "markdown"}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
