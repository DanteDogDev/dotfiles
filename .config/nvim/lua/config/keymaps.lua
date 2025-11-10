-- https://github.com/DanteDogDev/ToastVim/blob/main/lua/toastvim/config/keymaps.lua

ToastVim.nmap("y:", "<CMD>let @+=expand('%:t') . ':' . line('.')<CR>", { desc = "Filename:Number"})
