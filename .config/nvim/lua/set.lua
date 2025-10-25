vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

vim.o.guicursor = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2
vim.o.cursorline = true

vim.o.colorcolumn = "80"
vim.o.termguicolors = true
vim.opt.smartindent = true
vim.o.scrolloff = 10
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.wrap = false
vim.o.signcolumn = "yes"

vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.winborder = "rounded"
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.updatetime = 50
