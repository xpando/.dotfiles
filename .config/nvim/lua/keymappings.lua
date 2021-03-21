local kmap = vim.api.nvim_set_keymap

kmap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
kmap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
kmap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- git blame
kmap('n', '<Leader>gb', ':GitBlameToggle<CR>', {noremap = true, silent = true})

-- better window movement
kmap('n', '<C-h>', '<C-w>h', { silent = true })
kmap('n', '<C-j>', '<C-w>j', { silent = true })
kmap('n', '<C-k>', '<C-w>k', { silent = true })
kmap('n', '<C-l>', '<C-w>l', { silent = true })


