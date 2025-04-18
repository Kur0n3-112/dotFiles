return {
    "folke/trouble.nvim",
    keys = function()
       return {
            {"<leader>ee", ":Trouble diagnostics toggle<CR>"},
            {"<leader>e", ":Trouble diagnostics toggle filter.buf=0<CR"},
        }
    end,
}
