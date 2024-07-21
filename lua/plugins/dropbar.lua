return {
    {
        'Bekaboo/dropbar.nvim',
        -- optional, but required for fuzzy finder support
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim'
        },
        config = function()
            require('dropbar').setup {
                bar = {
                    hover = true,
                    sources = function(buf, _)
                        local sources = require('dropbar.sources')
                        if vim.bo[buf].ft == 'markdown' then
                            return {
                                sources.path,
                                sources.markdown,
                            }
                        end
                        if vim.bo[buf].buftype == 'terminal' then
                            return {
                                sources.terminal,
                            }
                        end
                        return {
                            sources.lsp,
                        }
                    end,
                    padding = {
                        left = 3,
                        right = 3,
                    },
                    pick = {
                        pivots = 'abcdefghijklmnopqrstuvwxyz',
                    },
                    truncate = true,
                },
            }
        end
    }
}
