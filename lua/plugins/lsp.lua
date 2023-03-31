return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'L3MON4D3/LuaSnip' },
    },
    config = function()
        -- Lsp zero setup
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
            local opts = { buffer = bufnr }
            local bind = vim.keymap.set

            bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            bind('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
        end)

        lsp.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })
        lsp.setup()

        -- cmp setup

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            mapping = {
                ['<Tab>'] = cmp_action.tab_complete(),
                ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                ['<Return>'] = cmp.mapping.confirm({ select = false }),
            }
        })
    end
}
