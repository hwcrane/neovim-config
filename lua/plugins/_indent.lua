return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			indent = {
				char = "▏",
				smart_indent_cap = true,
				repeat_linebreak = false,
			},
			scope = { enabled = true, show_start = false, show_end = false, highlight = {'@property'} },
		})
	end,
}
