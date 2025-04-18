-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.mapleader = " " -- Declare the leader key to space
vim.g.maplocalleader = "\\"

function RmAllMarks()
    vim.cmd("delm! | delm A-Z0-9\"<>")
end

RmAllMarks()

vim.keymap.set("n", "<leader>rm", function()
    RmAllMarks()
    vim.cmd("echo 'All the marks have been deleted.'")
end)
