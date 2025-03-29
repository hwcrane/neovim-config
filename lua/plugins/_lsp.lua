return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      -- LSP ZERO CONFIG --
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", { buffer = bufnr })
      end)

      lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      })

      -- Add blink.cmp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('blink.cmp').get_lsp_capabilities()
      )

      -- MASON CONFIG --
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer@2024-09-30" },
        handlers = {
          lsp_zero.default_setup,
        },
      })

      require("lspconfig").tinymist.setup({
        settings = {
          exportPdf = "onType", -- Choose onType, onSave or never.
          formatterMode = "typstyle",
        },
      })
      require("lspconfig").rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      })
    end,
  },
}
