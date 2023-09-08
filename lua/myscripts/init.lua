local matlab = require("matlab")
local runner = require("myscripts.runner")

vim.keymap.set("n", "Å", function () runner.main_action() end)

vim.keymap.set("v", "m", function () matlab.visual_evaluate() end)
vim.keymap.set("n", "<leader>me", function () matlab.open_variable_explorer() end)
vim.keymap.set("n", "<leader>mq", function () matlab.close() end)
vim.keymap.set("n", "<leader><cr>", function () matlab.evaluate_current_file() end)
vim.keymap.set("n", "å", function () matlab.evaluate_current_file() end)
