return {
    'BalderHolst/matlab.nvim',
    ft = { 'matlab' },
    config = function ()
        local matlab = require("matlab");
        matlab.setup({
            matlab_path = "matlab",
            open_window = require("matlab.openers").vsplit,
            splash = false,
        })

        vim.keymap.set("v", "m", function () matlab.visual_evaluate() end)
        vim.keymap.set("n", "<f1>", function () matlab.open_documentation_at_cursor() end)
        vim.keymap.set("n", "<leader>me", function () matlab.open_variable_explorer() end)
        vim.keymap.set("n", "<leader>mq", function () matlab.close() end)
        vim.keymap.set("n", "<leader><cr>", function () matlab.evaluate_current_file() end)

        vim.keymap.set("n", "å", function () matlab.evaluate_block() end)
    end
}
