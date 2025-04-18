return {
  "ThePrimeagen/harpoon",
  keys = function()
      return {
          {"<C-h>", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon: Go to file 1." },
          {"<C-t>", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon: Go to file 2" },
          {"<C-n>", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon: Go to file 3" },
          {"<C-s>", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon: Go to file 4" },
          {"<C-e>", require("harpoon.ui").toggle_quick_menu, desc = "Harpoon: Open the file menu."},
          {"<leader>a", require("harpoon.mark").add_file, desc = "Add a file to the Harpoon list."},
      }
  end,
}
