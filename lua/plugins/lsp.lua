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
        local lsp = require('lsp-zero').preset({
            manage_nvim_cmp = {
                set_sources = 'recommended'
            }
        })

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({
                buffer = bufnr,
                preserve_mappings = false
            })
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

        require('lspconfig').hls.setup({
            cmd = {"haskell-language-server-wrapper", "--lsp", "--logfile", "~/log.txt"},
            root_dir = vim.loop.cwd,
            settings = {
              rootMarkers = {"./git/"},
              manageHLS = "GHCup"
            }

        })

        require('lspconfig').texlab.setup({
            cmd = { "texlab" },
            filetypes = { "plaintex", "tex", "bib" },
            settings = {
                texlab = {
                    auxDirectory = "./buildfiles",
                    bibtexFormatter = "texlab",
                    build = {
                        args = {
                            "-shell-escape",
                            "-synctex=1",
                            "-interaction=nonstopmode",
                            "-file-line-error",
                            "-lualatex",
                            "-outdir=output",
                            "%f",
                        },
                        executable = "latexmk",
                        forwardSearchAfter = false,
                        onSave = true,
                    },
                    chktex = {
                        onEdit = true,
                        onOpenAndSave = true,
                    },
                    latexFormatter = "latexindent",
                },
            },
            on_init = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end,
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
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })
    end
}
