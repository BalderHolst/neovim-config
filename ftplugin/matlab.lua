local matlab = require("plugins.matlab")
vim.keymap.set("n", "å", function () matlab.evaluate_block() end)
