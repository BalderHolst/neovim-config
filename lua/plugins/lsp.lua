return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'simrat39/inlay-hints.nvim' },
        config = function()
            local lspconfig = require("lspconfig")

            -- NOTE: Rust is configured by rust-tools.nvim

            ---------- Lua ----------
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' } -- Fix Undefined global 'vim'
                        }
                    }
                }
            })

            ---------- Python ----------
            lspconfig.pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off"
                        }
                    }
                },
            })

            ---------- Nix ----------
            require'lspconfig'.nixd.setup{}

            ---------- VHDL ----------
            lspconfig.vhdl_ls.setup({
                cmd = { "/home/balder/projects/rust_hdl/target/release/vhdl_ls" },
                filetypes = { "vhd", "vhdl" },
                single_file_support = true,
            })

            ---------- Matlab ----------
            require("lspconfig")["matlab_ls"].setup {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                settings = {
                    MATLAB = {
                        indexWorkspace = true,
                        installPath = "/home/balder/.matlab/R2023b",
                        matlabConnectionTiming = "onStart",
                        telemetry = true,
                    },
                },
            }

            ------- JavaScript ------
            require'lspconfig'.biome.setup{}


            lspconfig.clangd.setup({})

            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    local lsp_id = ev.data.client_id
                    local lsp = vim.lsp.get_client_by_id(lsp_id)


                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<space>a', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<space>F', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)

                    if lsp.name == "rust-analyzer" then
                        print("Setting up rust")
                        vim.keymap.set("n", "<leader>a", function() vim.cmd.RustLsp('codeAction') end, opts)
                    end
                end,
            })

            vim.diagnostic.config({
                virtual_text = true,
            })

        end,
    },
}
