return {
    "AckslD/swenv.nvim",
    dependencies = {"ahmedkhalf/project.nvim"},
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"python"},
            callback = function()
                require('swenv.api').auto_venv()
            end
        })
        require('swenv').setup({
            -- Should return a list of tables with a `name` and a `path` entry each.
            -- Gets the argument `venvs_path` set below.
            -- By default just lists the entries in `venvs_path`.
            get_venvs = function(venvs_path)
                return require('swenv.api').get_venvs(venvs_path)
            end,
            -- Path passed to `get_venvs`.
            venvs_path = vim.fn.expand('~/.conda/envs'),
            -- Something to do after setting an environment, for example call vim.cmd.LspRestart
            post_set_venv = function(venv)
                vim.cmd('LspRestart')
            end
        })

        vim.keymap.set('n', "<leader>ve", require('swenv.api').pick_venv, {
            desc = "Pick Python Virtual Environment"
        })
    end
}
