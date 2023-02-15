local obsidian_dir = "~/Documents/uni/noter"

require("obsidian").setup({
    dir = obsidian_dir,
    completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
    },
    use_advanced_uri = false,
    -- note_id_func = function(title)
    --     -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    --     local suffix = ""
    --     if title ~= nil then
    --         -- If title is given, transform it into valid file name.
    --         suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    --     else
    --         -- If title is nil, just add 4 random uppercase letters to the suffix.
    --         for _ = 1, 4 do
    --             suffix = suffix .. string.char(math.random(65, 90))
    --         end
    --     end
    --     return tostring(os.time()) .. "-" .. suffix
    -- end
})

local open_vault = function()
    vim.cmd("cd " .. obsidian_dir)
    vim.cmd("e HJEM.md")

    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("runner", { clear = false }),
        pattern = "*\\.md",
        callback = function()
            vim.cmd("write")
            vim.cmd("ObsidianOpen")
        end
    })
    vim.cmd("ObsidianOpen")
end

-- mappings
vim.keymap.set("n", "<leader>go", open_vault)



vim.keymap.set(
    "n",
    "gf",
    function()
        if require('obsidian').util.cursor_on_markdown_link() then
            return "<cmd>ObsidianFollowLink<CR>"
        else
            return "gf"
        end
    end,
    { noremap = false, expr = true }
)
