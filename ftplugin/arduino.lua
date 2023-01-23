vim.cmd("w")
vim.keymap.set('n', 'å', function() vim.cmd("!arduino-cli compile --upload --no-color") end)
