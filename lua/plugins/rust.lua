return {
    -- {
    --     'saecki/crates.nvim',
    --     tag = 'stable',
    --     dependencies = { 'nvim-lua/plenary.nvim' },
    --     config = function()
    --         require('crates').setup()
    --     end,
    -- },
    {
        'simrat39/rust-tools.nvim',
        config = function()
            local rt = require('rust-tools')

            local opts = {
                tools = { -- rust-tools options

                    -- how to execute terminal commands
                    -- options right now: termopen / quickfix
                    executor = require("rust-tools.executors").termopen,

                    -- callback to execute once rust-analyzer is done initializing the workspace
                    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
                    on_initialized = nil,

                    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
                    reload_workspace_from_cargo_toml = true,

                    -- These apply to the default RustSetInlayHints command
                    inlay_hints = {
                        -- automatically set inlay hints (type hints)
                        -- default: true
                        auto = true,

                        -- Only show inlay hints for the current line
                        only_current_line = false,

                        -- whether to show parameter hints with the inlay hints or not
                        -- default: true
                        show_parameter_hints = true,

                        -- prefix for parameter hints
                        -- default: "<-"
                        parameter_hints_prefix = "<- ",

                        -- prefix for all the other hints (type, chaining)
                        -- default: "=>"
                        other_hints_prefix = "=> ",

                        -- whether to align to the length of the longest line in the file
                        max_len_align = false,

                        -- padding from the left if max_len_align is true
                        max_len_align_padding = 1,

                        -- whether to align to the extreme right or not
                        right_align = false,

                        -- padding from the right if right_align is true
                        right_align_padding = 7,

                        -- The color of the hints
                        highlight = "Comment",
                    },

                    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
                    hover_actions = {

                        -- the border that is used for the hover window
                        -- see vim.api.nvim_open_win()
                        border = {
                            { "╭", "FloatBorder" },
                            { "─", "FloatBorder" },
                            { "╮", "FloatBorder" },
                            { "│", "FloatBorder" },
                            { "╯", "FloatBorder" },
                            { "─", "FloatBorder" },
                            { "╰", "FloatBorder" },
                            { "│", "FloatBorder" },
                        },

                        -- Maximal width of the hover window. Nil means no max.
                        max_width = nil,

                        -- Maximal height of the hover window. Nil means no max.
                        max_height = nil,

                        -- whether the hover action window gets automatically focused
                        -- default: false
                        auto_focus = false,
                    },

                    -- settings for showing the crate graph based on graphviz and the dot
                    -- command
                    crate_graph = {
                        -- Backend used for displaying the graph
                        -- see: https://graphviz.org/docs/outputs/
                        -- default: x11
                        backend = "x11",
                        -- where to store the output, nil for no output stored (relative
                        -- path from pwd)
                        -- default: nil
                        output = nil,
                        -- true for all crates.io and external crates, false only the local
                        -- crates
                        -- default: true
                        full = true,

                        -- List of backends found on: https://graphviz.org/docs/outputs/
                        -- Is used for input validation and autocompletion
                        -- Last updated: 2021-08-26
                        enabled_graphviz_backends = {
                            "bmp",
                            "cgimage",
                            "canon",
                            "dot",
                            "gv",
                            "xdot",
                            "xdot1.2",
                            "xdot1.4",
                            "eps",
                            "exr",
                            "fig",
                            "gd",
                            "gd2",
                            "gif",
                            "gtk",
                            "ico",
                            "cmap",
                            "ismap",
                            "imap",
                            "cmapx",
                            "imap_np",
                            "cmapx_np",
                            "jpg",
                            "jpeg",
                            "jpe",
                            "jp2",
                            "json",
                            "json0",
                            "dot_json",
                            "xdot_json",
                            "pdf",
                            "pic",
                            "pct",
                            "pict",
                            "plain",
                            "plain-ext",
                            "png",
                            "pov",
                            "ps",
                            "ps2",
                            "psd",
                            "sgi",
                            "svg",
                            "svgz",
                            "tga",
                            "tiff",
                            "tif",
                            "tk",
                            "vml",
                            "vmlz",
                            "wbmp",
                            "webp",
                            "xlib",
                            "x11",
                        },
                    },
                },

                -- all the opts to send to nvim-lspconfig
                -- these override the defaults set by rust-tools.nvim
                -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
                server = {
                    -- standalone file support
                    -- setting it to false may improve startup time
                    standalone = true,
                    on_attach = function(_, bufnr)
                        local opts = { buffer = bufnr, remap = false }
                        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })         -- Hover actions
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr }) -- Code action groups
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
                        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
                        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                                loadOutDirsFromCheck = true,
                                runBuildScripts = true,
                                -- features = { "ssr", "python" },
                            },
                            -- Add clippy lints for Rust.
                            -- checkOnSave = {
                            --     allFeatures = true,
                            --     command = "clippy",
                            --     extraArgs = {
                            --         "--",
                            --         "--no-deps",
                            --         "-Dclippy::correctness",
                            --         "-Dclippy::complexity",
                            --         "-Wclippy::perf",
                            --         "-Wclippy::pedantic",
                            --     },
                            -- },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    ["async-trait"] = { "async_trait" },
                                    ["napi-derive"] = { "napi" },
                                    ["async-recursion"] = { "async_recursion" },
                                },
                            },
                        },
                    },
                },

                -- debugging stuff
                dap = {
                    adapter = {
                        type = "executable",
                        command = "lldb-vscode",
                        name = "rt_lldb",
                    },
                },
            }

            rt.setup(opts)
        end
    }
}
