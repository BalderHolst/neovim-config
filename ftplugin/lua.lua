local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- settings


-- mappings
map('n', 'å', ':w | :luafile %<cr>', opts) -- run


-- autocmd
