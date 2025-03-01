return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true, animate = { enabled = false } },
    input = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    image = { enabled = true },
    zen = { enabled = true, minimal = true },

    styles = {
      zen = {
        backdrop = {
          transparent = false
        },
      }
    }
  },
  keys = {
    -- stylua: ignore start
    { "<leader>uZ", function() Snacks.zen() end,                                     desc = "Toggle Zen Mode" },
    { "<leader>uz", function() Snacks.zen.zoom() end,                                desc = "Toggle Zoom" },
    { "<leader>gb", function() Snacks.gitbrowse() end,                               desc = "Git Browse" },
    { "*",          function() Snacks.words.jump(vim.v.count1) end,                  desc = "Next Reference" },
    { "#",          function() Snacks.words.jump(-vim.v.count1) end,                 desc = "Prev Reference" },
    { "<leader>pg", function() Snacks.picker.grep() end,                             desc = "Strings" },
    { "<leader>ph", function() Snacks.picker.help() end,                             desc = "Help" },
    { "<leader>pf", function() Snacks.picker.smart({ filter = { cwd = true } }) end, desc = "Smart find" },
    { "<leader>sl", function() Snacks.picker.lines() end,                            desc = "Buffer Lines" },
    { "<leader>si", function() Snacks.picker.icons() end,                            desc = "Icons" },
    { "<leader>ls", function() Snacks.picker.lsp_symbols() end,                      desc = "Documents Symbols" },
    { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end,            desc = "Workspace Symbols" },
    { "<leader>sw", function() Snacks.picker.grep_word() end,                        desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>gl", function() Snacks.lazygit() end,                                 desc = "Lazygit" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,                     desc = "Git Log File" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,                     desc = "Git Log Line" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end,                      desc = "Diagnostics" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,                          desc = "Keymaps" },
    { "<leader>ld", function() Snacks.picker.lsp_definitions() end,                  desc = "Definition" },
    { "<leader>lr", function() Snacks.picker.lsp_references() end,                   nowait = true,                     desc = "References" },
  },


}

-- Need to add keybindings for:
--  - Explorer
--  - Git browse
--  - Lazygit
--  - Picker
--  - Zen
