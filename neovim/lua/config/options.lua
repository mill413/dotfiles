---- General Settings
-- Use mouse
vim.opt.mouse = "a"
-- Show line number
vim.opt.number = true
-- Highlight search result
vim.opt.incsearch = true
vim.opt.hlsearch = true
-- Highlight current line and column
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
-- Set cursor style
vim.opt.guicursor = "n-v-c-sm:ver25-blinkon1,i-ci-ve:ver25-blinkon1,r-cr:ver25-blinkon1,o:ver25-blinkon1"
-- Set tab width
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.softtabstop = 4
-- Set termguicolors
vim.opt.termguicolors = true
-- Open syntax
vim.cmd("syntax on")
-- Set autoindent
vim.opt.autoindent = true
-- Auto wrap line
vim.opt.whichwrap = "b,s,<,>,[,]"
-- Show blank and tab
vim.opt.list = true
vim.opt.listchars = "space:·,tab:→ ,trail:·"
-- Set minimal lines before and after current line when scroll
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5
-- Cursor can be the end of line
vim.opt.virtualedit = "block,onemore"
-- Record last cursor position
vim.api.nvim_create_augroup("resCur", {
    clear = true,
})
vim.api.nvim_create_autocmd("BufReadPost", {
    group = "resCur",
    callback = function()
        local last_pos = vim.fn.getpos("'\"")
        vim.fn.setpos(".", last_pos)
    end,
})
-- Split position
vim.opt.splitbelow = true
vim.opt.splitright = false
-- Clipboard
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Search uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Fold code
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
