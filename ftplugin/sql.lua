vim.cmd("w")
vim.keymap.set('n', 'å', function()
    vim.cmd(":w | !mysql -u root --password=root kiosk < %")
end)

