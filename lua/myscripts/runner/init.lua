local M = {}

local monitor_job_id = nil

local out_win, out_buf = nil, nil

local function setup_out()
    local code_win = vim.api.nvim_get_current_win()
    vim.cmd("vsplit") -- spilt vertically

    local out_win = vim.api.nvim_get_current_win()
    local out_buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(out_win, out_buf) -- sets the content op the split to be the new buffer
    -- vim.api.nvim_buf_set_name(out_buf, "output")
    vim.api.nvim_win_set_width(out_win, 70) -- Sets the width
    vim.api.nvim_win_set_option(out_win, "relativenumber", false)
    vim.api.nvim_win_set_option(out_win, "wrap", false)
    vim.api.nvim_set_current_win(code_win) -- sætter curseren på coden igen

    return out_win, out_buf
end

M.run_command = function(command, callback)
    vim.api.nvim_buf_set_lines(out_buf, 0, -1, false, { "[" .. table.concat(command, " ") .. "]" })
    vim.fn.jobstart(command, {
        stout_buffered = true,
        on_stdout = function(_, data)
            if data then
                vim.api.nvim_buf_set_lines(out_buf, -1, -1, false, data)
            end
        end,
        on_stderr = function(_, data)
            if data then
                vim.api.nvim_buf_set_lines(out_buf, -1, -1, false, data)
            end
        end,
        on_exit = function()
            callback()
        end
    })
end

M.start = function()
    if (not out_buf or not out_win) then
        out_win, out_buf = setup_out()
    elseif (not vim.api.nvim_buf_is_valid(out_buf) or not vim.api.nvim_win_is_valid(out_win)) then
        out_win, out_buf = setup_out()
    end


    local filename = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) -- name of current opended file


    -- Python
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("runner", { clear = false }),
        pattern = "*\\.py",
        callback = function()
            M.run_command({ "python", filename })
        end
    })

    -- Python
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("runner", { clear = false }),
        pattern = "*\\.cpp",
        callback = function()
            M.run_command({ "g++", "-o \"out\"", filename})
            -- M.run_command({ "./out" })
        end
    })

    -- latex
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    -- 	group = vim.api.nvim_create_augroup("runner", {clear = true}),
    -- 	pattern = "*.tex",
    -- 	callback = function ()
    -- 		M.run_command({"clatex"})
    -- 	end
    -- })

    -- Arduino
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("runner", { clear = false }),
        pattern = "*\\.ino",
        callback = function()

            if monitor_job_id then
                vim.fn.jobstop(monitor_job_id)
                print("Stopped monitor job.")
            end

            local port = require("myscripts.runner.arduino").get_arduino_port()
            M.run_command({ "arduino-cli", "compile", "--no-color", "--upload" }, function()

                vim.api.nvim_buf_set_lines(out_buf, -1, -1, false, { "", "Monitor:", "" })
                monitor_job_id = vim.fn.jobstart({ "cat", port }, {
                    stout_buffered = false,
                    on_stdout = function(_, data)
                        if data then
                            vim.api.nvim_buf_set_lines(out_buf, -1, -1, false, data)
                        end
                    end,
                    on_stderr = function(_, data)
                        if data then
                            vim.api.nvim_buf_set_lines(out_buf, -1, -1, false, data)
                        end
                    end
                }
                )
                print(monitor_job_id)


            end)

        end
    })

end

M.close = function()
    vim.api.nvim_buf_delete(out_buf, {}) -- deletes buffer (and its window)
    out_win, out_buf = nil, nil -- unsets saved buffer and window id

    if monitor_job_id then
        vim.fn.jobstop(monitor_job_id)
    end

    vim.api.nvim_del_augroup_by_name("runner") -- deletes the auto commands
end

M.toggle = function()
    if (out_win and out_buf) then
        if (vim.api.nvim_win_is_valid(out_win)) then
            M.close()
        else
            if (vim.api.nvim_buf_is_valid(out_buf)) then vim.api.nvim_buf_delete(out_buf, {}) end
            M.start()
        end
    else
        M.start()
    end
end

M.main_action = M.toggle

return (M)
