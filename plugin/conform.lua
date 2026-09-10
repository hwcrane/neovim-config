vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = {
      "isort",
      "black",
      "ruff format",
    },
    rust = { "rustfmt", lsp_format = "fallback" },
    markdown = { "prettier" }
  }
})

vim.keymap.set({ "v", "n" }, "<leader>f", function()
  require("conform").format({
    async = true,
    lsp_fallback = true
  })
end)
