return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
	   vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		require("oil").setup({
			delete_to_trash = false,
      view_options = {
        show_hidden = true
      }
		})
	end,
}
