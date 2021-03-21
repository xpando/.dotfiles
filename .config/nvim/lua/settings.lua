vim.o.hidden = true             -- keep multiple buffers open
vim.o.cmdheight = 2             -- more space for messages in the status line
vim.o.pumheight = 10            -- make popup menu smaller
vim.o.t_Co = "256"              -- support 256 colors
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 50           -- faster update time
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus" -- copy paste between vim and everything else
-- vim.o.termguicolors = true
vim.o.fileencoding = "utf-8"
vim.o.splitright = true         -- vertical splits will be to the right
vim.o.splitbelow = true         -- horizontal splits will be below

vim.bo.expandtab = true         -- convert tabs to spaces
vim.bo.smartindent = true
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

--vim.cmd('set ts=4')
--vim.cmd('set sw=4')
vim.cmd('set iskeyword+=-')     -- treat dash separated words as a word text object

vim.wo.number = true
vim.wo.wrap = false             -- don't wrap long lines
vim.wo.relativenumber = true
