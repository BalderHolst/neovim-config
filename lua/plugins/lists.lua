return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()

        local trouble = require("trouble")
        local trouble_opts = {skip_groups = true, jump = true}

        local qf_is_open = function()
            return vim.fn.empty(vim.fn.getqflist()) == 0
        end

        local next = function()

            if qf_is_open() then
                vim.cmd("cnext")
            elseif trouble.is_open() then
                trouble.next(trouble_opts)
            end

        end

        local prev = function()
            if qf_is_open() then
                vim.cmd("cprev")
            elseif trouble.is_open() then
                trouble.previous(trouble_opts)
            end
        end

        local open_or = function(f)
            if qf_is_open() or trouble.is_open() then
                f()
            else
                trouble.open()
            end
        end

        local close = function()
            if qf_is_open() then
                vim.cmd [[cclose]]
                vim.fn.setqflist({}) -- delete the quickfix list
            elseif trouble.is_open() then
                trouble.close()
            end
        end


        vim.keymap.set("n", "<C-j>", function () open_or(next) end)
        vim.keymap.set("n", "<C-k>", function () open_or(prev) end)
        vim.keymap.set('n', '<C-q>', close)
    end
}
