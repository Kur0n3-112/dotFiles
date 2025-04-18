-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = true -- Enable invisible characters
vim.opt.listchars = { space = "·", tab = "▸·", eol = "¬" }

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true -- While searching for a word it wont underline the ocurrencies
vim.opt.incsearch = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Config for reseting the cursor in nvim exit, because in Tmux it is needed
--vim.api.nvim_create_autocmd("VimLeave", {
--  group = vim.api.nvim_create_augroup("ResetCursor", {}),
--  command = "set guicursor=a:ver25",
--})
vim.g.snacks_animate = false
vim.g.autoformat = false
