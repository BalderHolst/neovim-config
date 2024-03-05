return {
    "zbirenbaum/copilot.lua",
    config = function()

        -- Close completions popup if 'cmp' is loaded
        local cmp_ok, cmp= pcall(require, "cmp")
        local close_cmp = function ()
            if not cmp_ok then
                return
            end
            cmp.close()
        end

        require('copilot').setup({
            panel = {
                enabled = true,
                auto_refresh = true,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<M-CR>",
                    refresh = "gr",
                    open = "<M-CR>"
                },
                layout = {
                    position = "right", -- | top | left | right
                    ratio = 0.4
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = "<M-y>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                yaml = false,
                markdown = false,
                help = false,
                gitcommit = true,
                gitrebase = true,
                hgcommit = true,
                svn = false,
                cvs = false,
                ["."] = false,
            },
            copilot_node_command = 'node', -- Node.js version must be > 18.x
            server_opts_overrides = {},
        })
        vim.keymap.set('i', '<M-c>', function ()
            close_cmp()
        end)
        vim.keymap.set('i', '<M-n>', function ()
            close_cmp()
            require("copilot.suggestion").next()
        end)
        vim.keymap.set('i', '<M-p>', function ()
            close_cmp()
            require("copilot.suggestion").next()
        end)
    end
}
