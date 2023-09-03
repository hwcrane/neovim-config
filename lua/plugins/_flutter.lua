return {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function ()
        require("flutter-tools").setup {}
        local bind = vim.keymap.set
        bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>')
        bind('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>')
        bind('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bind('x', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    end,
}
