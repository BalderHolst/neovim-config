local M = {}

M.repl_job_id = nil

M.out_win, M.out_buf = nil, nil

local function start_REPL()
    if M.repl_job_id == nil then
        M.repl_job_id = vim.fn.jobstart({ "matlab", "-nodesktop" }, {
            stout_buffered = true,
            on_stdout = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(M.out_buf, -1, -1, false, data)
                end
            end,
            on_stderr = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(M.out_buf, -1, -1, false, data)
                end
            end,
            on_exit = function()
                print("Repl stopped.")
            end
        })
    end
end

local function setup_out_buffer()
    if M.out_win == nil or M.out_buf == nil then
        local code_win = vim.api.nvim_get_current_win()
        vim.cmd("vsplit") -- spilt vertically
        M.out_win = vim.api.nvim_get_current_win()
        M.out_buf = vim.api.nvim_create_buf(true, true)
        vim.api.nvim_win_set_buf(M.out_win, M.out_buf) -- sets the content op the split to be the new buffer
        vim.api.nvim_win_set_width(M.out_win, 70) -- Sets the width
        vim.api.nvim_win_set_option(M.out_win, "relativenumber", false)
        vim.api.nvim_win_set_option(M.out_win, "wrap", false)
        vim.api.nvim_set_current_win(code_win) -- sætter curseren på coden igen
        return M.out_win, M.out_buf
    end
end

M.evaluate = function(input)
    setup_out_buffer()
    start_REPL()
    vim.fn.chansend(M.repl_job_id, input .. "\n")
end

M.close = function()
    vim.api.nvim_buf_delete(M.out_buf, {}) -- deletes buffer (and its window)
    M.out_win, M.out_buf = nil, nil -- unsets saved buffer and window id
    vim.fn.jobclose(M.repl_job_id)
end

M.is_open = function()
    return M.repl_job_id ~= nil
end

return M
