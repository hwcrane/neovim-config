vim.pack.add({
  "https://github.com/folke/snacks.nvim",
  "https://github.com/coder/claudecode.nvim"
})

require("claudecode").setup()

-- vim.keymap.set("n", "<leader>a", nil, { desc = "AI/Claude Code" })
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", {desc = "Accept diff" })
vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", {desc = "Deny diff" })
