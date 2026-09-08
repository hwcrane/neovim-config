vim.pack.add({
  "https://github.com/folke/snacks.nvim"
})

require("snacks").setup({
  lazygit = { enabled = true },
  indent = { enabled = true, animate = { enabled = false } },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = { enabled = true },
  zen = { enabled = true, minimal = true },
  gitbrowse = { enabled = true }
})

vim.keymap.set("n", "<leader>uZ", function () Snacks.zen() end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>uz", function () Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
vim.keymap.set("n", "*", function () Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
vim.keymap.set("n", "#", function () Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
vim.keymap.set("n", "<leader>pg", function () Snacks.picker.grep() end, { desc = "Strings" })
vim.keymap.set("n", "<leader>ph", function () Snacks.picker.help() end, { desc = "Help" })
vim.keymap.set("n", "<leader>pf", function () Snacks.picker.smart({ filter = { cwd = true } }) end, {
  desc = "Smart find"
})
vim.keymap.set("n", "<leader>sl", function () Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>si", function () Snacks.picker.icons() end, { desc = "Icons" })
vim.keymap.set("n", "<leader>ls", function () Snacks.picker.lsp_symbols() end, { desc = "Documents Symbols" })
vim.keymap.set("n", "<leader>lS", function () Snacks.picker.lsp_workspace_symbols() end, { desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>sw", function () Snacks.picker.grep_word() end, {
  desc = "Visual selection or word"
})
vim.keymap.set("n", "<leader>gl", function () Snacks.lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>gf", function () Snacks.picker.git_log_file() end, { desc = "Git Log File" })
vim.keymap.set("n", "<leader>gL", function () Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>sd", function () Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sk", function () Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>ld", function () Snacks.picker.lsp_definitions() end, { desc = "Definition" })
vim.keymap.set("n", "<leader>sh", function () Snacks.notifier.show_history() end, { desc = "Notif History" })
-- { "<leader>lr", function() Snacks.picker.lsp_references() end,                   nowait = true,                     desc = "References" },
-- { "<leader>td", function() Snacks.toggle.dim() end,                              nowait = true,                     desc = "Toggle Dim" },
