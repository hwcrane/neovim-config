vim.pack.add({
  "https://github.com/danymat/neogen"
})

require("neogen").setup({
  snippet_engine = "nvim",
})

vim.keymap.set("n", "<leader>ng", "<cmd>Neogen<CR>")
