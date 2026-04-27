-- https://github.com/DanteDogDev/ToastVim/blob/main/lua/toastvim/config/autocmds.lua

vim.opt.packpath:prepend(vim.fn.expand("~/.local/share/nvim/site"))
vim.pack.add({ { src = "https://github.com/Mythos-404/xmake.nvim", } })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "xmake.lua",
	callback = function()
		if vim.fn.executable("xmake") == 1 then
			vim.opt.packpath:prepend(vim.fn.expand("~/.local/share/nvim/site"))

			vim.cmd('packadd xmake.nvim')
			require("xmake").setup({});
		end
	end,
})
