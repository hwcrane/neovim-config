vim.pack.add({
  "https://github.com/coder/claudecode.nvim"
})

require("claudecode").setup({
  auto_start = true,

  terminal = {
    -- Claude runs in Zellij rather than a Neovim terminal.
    provider = "none",
  },

  diff_opts = {
    layout = "vertical",
    open_in_new_tab = true,
  },
})

local function focus_zellij_tab(name)
  if vim.env.ZELLIJ then
    vim.fn.jobstart({
      "zellij",
      "action",
      "go-to-tab-name",
      name,
    }, { detach = true })
  end
end

-- Return to Neovim when Claude proposes an edit.
vim.api.nvim_create_autocmd("User", {
  pattern = "ClaudeCodeDiffOpened",
  callback = function()
    focus_zellij_tab("")
  end,
})

-- Switch to Claude after sending it context.
vim.api.nvim_create_autocmd("User", {
  pattern = "ClaudeCodeDiffClosed",
  callback = function()
    focus_zellij_tab("")
  end,
})

-- vim.keymap.set("n", "<leader>a", nil, { desc = "AI/Claude Code" })
vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", {desc = "Accept diff" })
vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", {desc = "Deny diff" })
