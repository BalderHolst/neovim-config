return {
    "jake-stewart/multicursor.nvim",
    config = function()
        local mc = require("multicursor-nvim")

        mc.setup()

        -- use MultiCursorCursor and MultiCursorVisual to customize
        -- additional cursors appearance
        vim.cmd.hi("link", "MultiCursorCursor", "Cursor")
        vim.cmd.hi("link", "MultiCursorVisual", "Visual")

        vim.api.nvim_set_hl(0, 'MultiCursorCursor', { fg = "#ffffff", bg = "#A03000" })
        vim.api.nvim_set_hl(0, 'MultiCursorVisual', { fg = "#dddddd", bg = "#C05050" })

        vim.keymap.set("n", "<esc>", function()
            if mc.hasCursors() then
                mc.clearCursors()
            else
                -- default <esc> handler
            end
        end)

        -- add cursors above/below the main cursor
        vim.keymap.set("n", "<M-d>", function() mc.addCursor("j") end)
        vim.keymap.set("n", "<M-u>", function() mc.addCursor("k") end)

        -- add a cursor and jump to the next word under cursor
        vim.keymap.set("n", "<c-n>", function() mc.addCursor("*") end)

        -- jump to the next word under cursor but do not add a cursor
        vim.keymap.set("n", "<c-s>", function() mc.skipCursor("*") end)

        -- add and remove cursors with control + left click
        vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)
    end,
}
