-- https://github.com/DanteDogDev/ToastVim/blob/main/lua/toastvim/config/keymaps.lua

local symbols = " .,(){}<>[]\"'"
local pattern = symbols:gsub("([%%%^%]%-%]])", "%%%1")

local tab_forward = function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == nil then
    return
  end
  line = line:sub(col + 1)
  -- If next char is a symbol move past it
  local char = line:match("^.")
  for c in symbols:gmatch(".") do
    if char == c then
      return "<C-o>a"
    end
  end
  -- Find next symbol in line and move to it
  local result = line:match("[" .. pattern .. "]")
  if result ~= nil then
    return "<C-o>f" .. result:sub(1, 1)
  end
  -- If at end of line act like a normal tab
  if col == vim.fn.col("$") - 1 then
    return "\t"
  end
end

local tab_backward = function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == nil then
    return
  end
  line = line:sub(0, col):reverse()
  print(line)
  -- If next char is a symbol move past it
  local char = line:match("^.")
  print(line)
  for c in symbols:gmatch(".") do
    if char == c and col == vim.fn.col("$") - 1 then
      return "<C-o>i"
    elseif char == c then
      print("simple")
      return "<C-o>h"
    end
  end
  -- Find next symbol in line and move to it
  local result = line:match("[" .. pattern .. "]")
  if result ~= nil then
    print("find")
    return "<C-o>T" .. result:sub(1, 1)
  end
  -- else go to start of the line
  return "<C-o>I"
end

vim.keymap.set("i", "<S-Tab>", tab_backward, { expr = true })
vim.keymap.set("i", "<Tab>", tab_forward, { expr = true })
vim.keymap.set("i", "<C-l>", "<Tab>")
