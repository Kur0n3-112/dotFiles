-- init.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>tt', vim.cmd.Telescope, {desc = "Open Telescope."})
        vim.keymap.set('n', '<leader>tf', builtin.find_files, {desc = "Telescope find a file in the current location."})
        vim.keymap.set('n', '<leader>tg', builtin.git_files, {desc = "Telescope find git files."})

        -- Find via user input a match inside the actual folder
        vim.keymap.set('n', '<leader>tw', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end, { desc = "Telescope find a word in the location files." })
        -- Use Telescope and Treesiter to find functions, variables and more inside the actual code file
        vim.keymap.set('n', '<leader>fs', function()
            require('telescope.builtin').treesitter{}
        end, { noremap = true, silent = true, desc = "Search inside the actual code file a function, variable and more related code terms." })

        -- search current buffer
        vim.keymap.set("n", "<leader>ts", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope search in the current file." })

        -- search hidden files
        vim.keymap.set("n", "<leader>th", ":Telescope find_files hidden=true no_ignore=true<CR>", { desc = "Telescope find hidden files." })

        vim.keymap.set("n", "<leader>tv", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip." })

        require('telescope').setup{
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key"
                    }
                }
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
                live_grep = {
                    sorting_strategy = "ascending",
                },
            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
                require("telescope").load_extension("neoclip")
            }
        }
   end,
}

-- plugins/telescope.lua:
--return {
--    'nvim-telescope/telescope.nvim', tag = '0.1.8',
---- or                              , branch = '0.1.x',
--      dependencies = { 'nvim-lua/plenary.nvim' }
--    }
