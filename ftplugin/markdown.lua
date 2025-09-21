local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.api.nvim_command

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- settings
wo.conceallevel = 2
wo.linebreak = true
wo.wrap = true


-- mappings
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
-- map('n', '<leader>l', ':lua require("links.functions").link_to()<cr>', opts)
-- map('n', '<leader>t', ':lua require("links.functions").follow_link()<cr>', opts)


-- autocmd
-- cmd('au VimEnter * :Goyo')

-- plugins
vim.keymap.set('n', 'å', function() require("mdeval").eval_code_block() end)
vim.keymap.set('n', 'Å', ":MarkdownPreview<CR>", {silent = true})
