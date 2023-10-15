local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }



-- other
map('n', "<C-n>", ':noh<cr>', opts)

-- Spelling
map('n', '<leader>d', ':set spell! spelllang=da<CR>', opts)
map('n', '<leader>e', ':set spell! spelllang=En<CR>', opts)

-- Move highlighted lines
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Center cursor when scroling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Terminal
vim.keymap.set('n', '<leader>t', function() vim.fn.jobstart("kitty --detach") end) -- open terminal
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])


-- Quickfix
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
map('n', '<C-q>', ':cclose<cr>', opts)

-- leaders
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })



-- Other Plugins
-- map('n', '<leader>f', ':Goyo | set linebreak <cr> | :e<cr>', opts)
