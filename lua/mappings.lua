local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }



-- other
map('n', "<C-n>", ':noh<cr>', opts)

vim.cmd(":command WQ wq")
vim.cmd(":command Wq wq")
vim.cmd(":command W w")
vim.cmd(":command Q q")

-- Spelling
map('n', '<leader>d', ':set spell! spelllang=da<CR>', opts)
map('n', '<leader>e', ':set spell! spelllang=En<CR>', opts)

-- Move highlighted lines
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")

-- Center cursor when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Undo
vim.keymap.set('n', 'U', '<C-r>')

-- Play @q macro
vim.keymap.set('n', 'Q', '@q')

-- Better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '<', '<<')
vim.keymap.set('n', '>', '>>')

-- Terminal
vim.keymap.set('n', '<leader>t', function() vim.fn.jobstart("kitty --detach") end) -- open terminal
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- System clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>D", [["+D]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- leaders
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
