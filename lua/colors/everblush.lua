return {
    'Everblush/everblush.nvim',
    config = function ()
        local everblush = require('everblush')
        everblush.setup({ nvim_tree = { contrast = false } }) -- or use contrast = false to not apply contrast
        vim.cmd.colorscheme("everblush")
    end
}
