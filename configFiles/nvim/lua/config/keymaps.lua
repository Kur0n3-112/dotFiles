-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--vim.g.mapleader = " " -- Declare the leader key to space
--vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- This means while in normal mode, if you press the leader key plus p plus v, it will execute Ex.

-- While in visual mode(highlight text) you can move the highlighted part UP or DOWN in the code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- It allows to wrap the underline to the end of the actual line

-- Half page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- While searching it allow that the cursor stay on the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

--vim.keymap.set("n", "<leader>vwm", function()
--    require("vim-with-me").StartVimWithMe()
--end)
--vim.keymap.set("n", "<leader>svwm", function()
--    require("vim-with-me").StopVimWithMe()
--end)

-- While in select mode if you paste the content of the clipboard, the highlighted actual word is going to copy to the clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Clipboard usage
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to the clipboard of the system
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy the entyre buffer to the system clipboard

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- Control+C to press Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader><C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- this creates a new tmux session usign tmux-sessionizer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick Fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- like find and replace all the ocurrencies
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make executable a file

--Set para el lenguaje de programacion de go
--vim.keymap.set(
--    "n",
--    "<leader>eb",
--    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
--)
--
--vim.keymap.set(
--    "n",
--    "<leader>ea",
--    "oassert.NoError(err, \"\")<Esc>F\";a"
--)
--
--vim.keymap.set(
--    "n",
--    "<leader>el",
--    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
--)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim<CR>")
--vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- clear the highlight when use search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- leader plus leader it makes directly source of the actual file
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- clear the highlight when use search
vim.keymap.set("n", "<leader>cd", "<cmd>:cd %:p:h<CR><cmd>echo 'Localization change to the actual'<CR>") -- change to the actual directory while in normal mode
vim.keymap.set("c", "<leader>cd", "<cmd>:cd %:p:h<CR><cmd>echo 'Localization change to the actual'<CR>") -- change to the actual directory while in console(file explorer) mode

-- Control + f: Avanzar al siguiente placeholder
vim.keymap.set({ "i", "s" }, "<C-f>", function()
  if vim.snippet.active({ direction = 1 }) then
    return "<cmd>lua vim.snippet.jump(1)<cr>"
  else
    return "<C-f>"
  end
end, { expr = true })

-- Control + b: Retroceder al placeholder anterior
vim.keymap.set({ "i", "s" }, "<C-b>", function()
  if vim.snippet.active({ direction = -1 }) then
    return "<cmd>lua vim.snippet.jump(-1)<cr>"
  else
    return "<C-b>"
  end
end, { expr = true })

-- Copy the full path to the actual file
vim.keymap.set(
  "n",
  "<leader>ypp",
  "<cmd>:let @+ = fnamemodify(expand('%:d'), ':~')<CR><cmd>echo 'Yank: Full path copied to the clipboard.'<CR>"
)
-- Copy the relative path to the actual file
vim.keymap.set(
  "n",
  "<leader>yp",
  "<cmd>:let @+ = fnamemodify(expand('%:h'), ':~')<CR><CR><cmd>echo 'Yank: Relative path copied to the clipboard.'<CR>"
)

vim.keymap.set("n", "<leader>so", vim.cmd.Oil, {desc = "OIL: Open Oil file manager"})
