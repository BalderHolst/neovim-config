return {
    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        dependencies = {
            'hrsh7th/cmp-buffer',       -- buffer completions
            'hrsh7th/cmp-calc',         -- Evaluate math expressions
            'hrsh7th/cmp-path',         -- path completions
            'hrsh7th/cmp-nvim-lsp',     -- LSP completions
            'hrsh7th/cmp-nvim-lua',     -- vim type in lua config
            'saadparwaiz1/cmp_luasnip', -- snippet completion
            'f3fora/cmp-spell',         -- Spell suggestions
            'hrsh7th/cmp-nvim-lua',     -- Neovim's Lua API
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local cmp = require("cmp")

            ---------- Spelling ----------
            vim.opt.spell = true
            vim.opt.spelllang = { 'en_us', 'da' }
            local spell_opts = {
                keep_all_entries = false,
                enable_in_context = function()
                    return require('cmp.config.context').in_treesitter_capture('spell')
                end
            }

            ---------- Snippets ----------
            require("luasnip/loaders/from_vscode").lazy_load()
            local luasnip = require("luasnip")

            --   פּ ﯟ   some other good icons
            local kind_icons = {
                Text = "T",
                Method = "m",
                Function = " ",
                Constructor = " ",
                Field = "",
                Variable = "V",
                Class = "C",
                Interface = " ",
                Module = " ",
                Property = " ",
                Unit = " ",
                Value = "V",
                Enum = " ",
                Keyword = " ",
                Snippet = " ",
                Color = " ",
                File = "F",
                Reference = " ",
                Folder = "D",
                EnumMember = " ",
                Constant = " ",
                Struct = " ",
                Event = "",
                Operator = "O",
                TypeParameter = " ",
                Copilot = " ",
            }

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },

                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ["<M-e>"] = cmp.mapping {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    },
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    -- ["<CR>"] = cmp.mapping.confirm { select = true },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.confirm({ select = true })
                            elseif luasnip.expandable() then
                                luasnip.expand()
                            else
                                fallback()
                            end
                        end,
                        {
                            "i",
                            "s",
                        }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        -- Kind icons
                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            copilot = "[Copilot]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                sources = {
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    -- { name = 'spell', option = spell_opts },
                    { name = "path" },
                    { name = "buffer" },
                    { name = "calc" },
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                experimental = {
                    ghost_text = false,
                    native_menu = false,
                },
            }
        end
    }
}
