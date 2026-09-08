vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = {
      "isort",
      "blue"
    },
    rust = { "rustfmt", lsp_format = "fallback" }
  }
})

vim.keymap.set("", "<leader>f", function ()
  require("conform").format({
    async = true,
    lsp_fallback = true
  })
end)
