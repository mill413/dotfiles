-- Leader
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
-- Switch windows
vim.keymap.set('n', '<A-h>', '<C-w>h', {
    desc = 'Move to left split'
})
vim.keymap.set('n', '<A-j>', '<C-w>j', {
    desc = 'Move to lower split'
})
vim.keymap.set('n', '<A-k>', '<C-w>k', {
    desc = 'Move to upper split'
})
vim.keymap.set('n', '<A-l>', '<C-w>l', {
    desc = 'Move to right split'
})