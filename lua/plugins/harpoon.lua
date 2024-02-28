return {
    'ThePrimeagen/harpoon',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function ()
        vim.keymap.set('n', '<M-m>', function()
            vim.notify("Harpooned!")
            require("harpoon.mark").add_file()
        end)
        vim.keymap.set('n', '<M-h>', function() require("harpoon.ui").toggle_quick_menu() end)
        vim.keymap.set('n', '<M-j>', function() require("harpoon.ui").nav_next()  end)
        vim.keymap.set('n', '<M-k>', function() require("harpoon.ui").nav_prev()  end)
    end
}
