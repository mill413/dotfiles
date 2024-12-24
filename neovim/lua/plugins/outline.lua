return {
    "hedyhli/outline.nvim",
    config = function()
        -- Example mapping to toggle outline
        local function toggleOrFocus()
            local outline = require("outline")
            if outline.is_open() then
                outline.focus_toggle()
            else
                outline.open({
                    focus_outline = true
                })
            end
        end
        vim.keymap.set("n", "<leader>o", toggleOrFocus, {
            desc = "Toggle Outline"
        })
        vim.keymap.set("n", "<leader>co", require("outline").close, {
            desc = "Close Outline"
        })

        require("outline").setup {
            -- Your setup opts here (leave empty to use defaults)
        }
    end
}
