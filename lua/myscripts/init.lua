Matlab = require("myscripts.matlab.matlab")
runner = require("myscripts.runner")

vim.keymap.set("n", "Å", function () runner.main_action() end)
