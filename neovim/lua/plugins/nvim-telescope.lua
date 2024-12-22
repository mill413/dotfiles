local builtin = require('telescope.builtin')

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    opts = {
        pickers = {
            find_files = {
                mappings = {
                    n = {
                        ["cd"] = function(prompt_bufnr)
                            local selection = require("telescope.actions.state").get_selected_entry()
                            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                            require("telescope.actions").close(prompt_bufnr)
                            -- Depending on what you want put `cd`, `lcd`, `tcd`
                            vim.cmd(string.format("silent lcd %s", dir))
                        end
                    }
                }
            }
        }
    },
    keys = {{
        "<leader>ff",
        builtin.find_files,
        mode = 'n',
        desc = "Telescope find files"
    }, {
        "<leader>fg",
        builtin.live_grep,
        mode = 'n',
        desc = "Telescope live grep"
    }, {
        "<leader>fb",
        builtin.buffers,
        mode = 'n',
        desc = "Telescope buffers"
    }, {
        "<leader>fh",
        builtin.help_tags,
        mode = 'n',
        desc = "Telescope help tags"
    }}
}
