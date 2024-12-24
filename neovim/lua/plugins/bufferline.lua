local tabline_bg = "#191b29"
local normal_tab_bg = "#2f334d"
local selected_tab_bg = "#3b4261"

local red = "#f7768e"
local yellow = "#e0af68"

vim.api.nvim_set_keymap("n", "<A-w>", ":bdelete %<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", {
    noremap = true,
    silent = true
})

return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " " or (e == "warning" and " " or " ")
                    s = s .. n .. sym
                end
                return s
            end,
            offsets = {{
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "Directory",
                text_align = "center"
            }},
            numbers = "ordinal",
            separator_style = "slant",
            right_mouse_command = false,
            hover = {
                enabled = true,
                delay = 200,
                reveal = {"close"}
            },
            tab_size = 12,
            close_command = ":bdelete",
            show_tab_indicators = false,
            show_close_icon = false
        },
        highlights = {
            fill = {
                bg = tabline_bg
            },
            background = {
                bg = normal_tab_bg
            },
            -- Separator
            separator = {
                bg = normal_tab_bg,
                fg = tabline_bg
            },
            separator_visible = {
                bg = normal_tab_bg,
                fg = tabline_bg
            },
            separator_selected = {
                bg = selected_tab_bg,
                fg = tabline_bg
            },
            -- Buffer
            buffer = {
                bg = normal_tab_bg
            },
            buffer_selected = {
                fg = "#fd966c",
                bg = selected_tab_bg
            },
            buffer_visible = {
                bg = normal_tab_bg
            },
            -- Close button
            close_button = {
                bg = normal_tab_bg
            },
            close_button_visible = {
                bg = normal_tab_bg
            },
            close_button_selected = {
                bg = selected_tab_bg
            },
            -- Numbers
            numbers = {
                bg = normal_tab_bg
            },
            numbers_visible = {
                bg = normal_tab_bg
            },
            numbers_selected = {
                bg = selected_tab_bg,
                bold = true,
                italic = true
            },
            -- Modified Icon
            modified = {
                bg = normal_tab_bg
            },
            modified_visible = {
                bg = normal_tab_bg
            },
            modified_selected = {
                bg = selected_tab_bg
            },
            -- Duplicate
            duplicate_selected = {
                fg = "#fd966c",
                bg = selected_tab_bg,
                italic = true
            },
            duplicate_visible = {
                bg = normal_tab_bg,
                italic = true
            },
            duplicate = {
                bg = normal_tab_bg,
                italic = true
            },
            -- Error
            error = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            error_visible = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            error_selected = {
                fg = red,
                bg = selected_tab_bg,
                bold = true,
                italic = true
            },
            error_diagnostic = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            error_diagnostic_visible = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            error_diagnostic_selected = {
                fg = red,
                bg = selected_tab_bg,
                bold = true,
                italic = true
            },
            -- Warning
            warning = {
                -- fg = normal_tab_bg,
                -- sp = normal_tab_bg,
                bg = normal_tab_bg
            },
            warning_visible = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            warning_selected = {
                -- fg = normal_tab_bg,
                bg = selected_tab_bg,
                -- sp = normal_tab_bg,
                bold = true,
                italic = true
            },
            warning_diagnostic = {
                -- fg = normal_tab_bg,
                -- sp = normal_tab_bg,
                bg = normal_tab_bg
            },
            warning_diagnostic_visible = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            warning_diagnostic_selected = {
                -- fg = normal_tab_bg,
                bg = selected_tab_bg,
                -- sp = normal_tab_bg,
                bold = true,
                italic = true
            },
            -- Info
            info = {
                -- fg = normal_tab_bg,
                -- sp = normal_tab_bg,
                bg = normal_tab_bg
            },
            info_visible = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            info_selected = {
                -- fg = normal_tab_bg,
                bg = selected_tab_bg,
                -- sp = normal_tab_bg,
                bold = true,
                italic = true
            },
            info_diagnostic = {
                -- fg = normal_tab_bg,
                -- sp = normal_tab_bg,
                bg = normal_tab_bg
            },
            info_diagnostic_visible = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            info_diagnostic_selected = {
                -- fg = normal_tab_bg,
                bg = selected_tab_bg,
                -- sp = normal_tab_bg,
                bold = true,
                italic = true
            },
            -- Diagnostic
            diagnostic = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            diagnostic_visible = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            diagnostic_selected = {
                -- fg = normal_tab_bg,
                bg = selected_tab_bg,
                bold = true,
                italic = true
            },
            -- Hint
            hint = {
                -- fg = normal_tab_bg,
                -- sp = normal_tab_bg,
                bg = normal_tab_bg
            },
            hint_visible = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            hint_selected = {
                -- fg = normal_tab_bg,
                bg = selected_tab_bg,
                -- sp = normal_tab_bg,
                bold = true,
                italic = true
            },
            hint_diagnostic = {
                -- fg = normal_tab_bg,
                -- sp = normal_tab_bg,
                bg = normal_tab_bg
            },
            hint_diagnostic_visible = {
                -- fg = normal_tab_bg,
                bg = normal_tab_bg
            },
            hint_diagnostic_selected = {
                -- fg = normal_tab_bg,
                bg = selected_tab_bg,
                -- sp = normal_tab_bg,
                bold = true,
                italic = true
            }
        }
    }
}
