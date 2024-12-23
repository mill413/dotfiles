local function customLocation()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    return string.format("Row %d, Col %d", row, col)
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        options = {
            globalstatus = true,
            theme = "tokyonight"
            -- disabled_filetypes = {"NvimTree"}
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {{
                'branch',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                'diff',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                'diagnostics',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                "swenv",
                cond = function()
                    return vim.bo.filetype == "python"
                end,
                icon = ""
            }},
            lualine_c = {{
                'filename',
                file_status = true, -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 3, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                -- 4: Filename and parent dir, with tilde as the home directory

                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = '[+]', -- Text to show when the file is modified.
                    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]' -- Text to show for newly created file before first write
                },
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end

            }},
            lualine_x = {{
                'datetime',
                -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
                style = '%Y-%m-%d %H:%M:%S'

            }},
            lualine_y = {{
                customLocation,
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                'selectioncount',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }},
            lualine_z = {{
                'encoding',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                'fileformat',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, 'filetype'}
        },
        inactive_sections = {
            lualine_a = {{
                'mode',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }},
            lualine_b = {{
                'branch',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                'diff',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                'diagnostics',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }},
            lualine_c = {{
                'filename',
                file_status = true, -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 3, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                -- 4: Filename and parent dir, with tilde as the home directory

                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = '[+]', -- Text to show when the file is modified.
                    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]' -- Text to show for newly created file before first write
                },
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end

            }},
            lualine_x = {{
                'datetime',
                -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
                style = '%Y-%m-%d %H:%M:%S',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end

            }},
            lualine_y = {{
                customLocation,
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                'selectioncount',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }},
            lualine_z = {{
                'encoding',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                'fileformat',
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, 'filetype'}
        },
        winbar = {
            lualine_c = {{
                'filename',
                file_status = false, -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 0,
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                "navic",
                color_correction = "static",
                navic_opts = nil
            }}
        },
        inactive_winbar = {
            lualine_c = {{
                'filename',
                file_status = false, -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 0,
                cond = function()
                    return vim.bo.filetype ~= 'NvimTree'
                end
            }, {
                "navic",
                color_correction = "static",
                navic_opts = nil
            }}
        }
    }
}
