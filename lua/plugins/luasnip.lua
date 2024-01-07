return {
    'rafamadriz/friendly-snippets',
    {
        'L3MON4D3/LuaSnip',
        config = function ()
            -- load custom snippets (https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md)
            require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/lua/snippets"})

            local snip_status_ok, luasnip = pcall(require, "luasnip")
            if not snip_status_ok then
                return
            end

            vim.keymap.set({'i', 'n', 'v'}, '<M-l>', function()
                if luasnip.jumpable(1) then
                    luasnip.jump(1)
                end
            end)
        end
    }
}
