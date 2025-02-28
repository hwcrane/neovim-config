return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>b', ":Telescope file_browser<CR>", { noremap = true })

      require("telescope").setup {
        extensions = {
          file_browser = {
            hijack_netrw = true,
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      }

      require("telescope").load_extension "file_browser"
      require("telescope").load_extension "ui-select"
    end

  },
}
