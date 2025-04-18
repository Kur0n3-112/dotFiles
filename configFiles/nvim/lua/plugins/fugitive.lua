return {
  "tpope/vim-fugitive",
  --lazy = false,
  keys = function ()
     return {
        {"<leader>gs", vim.cmd.Git},
     }
  end,
}
