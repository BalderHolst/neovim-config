local matlab = require("matlab")

vim.keymap.set("v", "m", function () matlab.visual_evaluate() end)
vim.keymap.set("n", "<leader>e", function () matlab.open_variable_explorer() end)
vim.keymap.set("n", "<leader><cr>", function () matlab.evaluate_file() end)
vim.keymap.set("n", "å", function () matlab.evaluate_block() end)
