return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
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

			-- MASON CONFIG --
			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer@2024-09-30" },
				handlers = {
					lsp_zero.default_setup,
				},
			})

			require("lspconfig").typst_lsp.setup({
				settings = {
					exportPdf = "onType", -- Choose onType, onSave or never.
					-- serverPath = "" -- Normally, there is no need to uncomment it.
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

			-- CMP CONFIG --
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()
			local luasnip = require("luasnip")
			luasnip.setup()

			require("luasnip.loaders.from_vscode").load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}),
				mapping = cmp.mapping.preset.insert({
					-- `Enter` key to confirm completion
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					["<Tab>"] = cmp_action.luasnip_supertab(),
					["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),

					-- Scroll up and down in the completion documentation
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
			})
		end,
	},
}
