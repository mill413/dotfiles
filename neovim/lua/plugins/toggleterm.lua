vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        size = 25,
        open_mapping = "<C-t>"
    },
    -- config = function()
    --     vim.keymap.set('t', "<esc>", [[<C-\><C-n>]], { buffer = 0 })
    --     require("toggleterm").setup({
    --         size = 20,
    --         open_mapping = "<C-t>",
    --         hide_numbers = true,
    --         shade_filetypes = {},
    --         shade_terminals = true,
    --         shading_factor = 2,
    --         start_in_insert = true,
    --         insert_mappings = true,
    --         terminal_mappings = true,
    --         direction = "horizontal",
    --         close_on_exit = true,
    --         shell = vim.o.shell,
    --         float_opts = {
    --             border = "curved",
    --             winblend = 3,
    --         },
    --         winbar = {
    --             enable = true,
    --             name_formatter = function(term)
    --                 return term.name
    --             end
    --         },
    --     })
    -- end, -- 启用默认配置
    config = true
}
