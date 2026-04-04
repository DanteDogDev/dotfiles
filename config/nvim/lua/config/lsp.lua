-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

vim.filetype.add({
	extension = {
		dox = "doxygen",
	},
})

-- prettier,
vim.lsp.enable({ "emmylua_ls" })           -- lua
vim.lsp.enable({ "ts_ls", "html", "cssls" }) -- javascript, html, css
vim.lsp.enable({ "clangd" })               -- cpp
vim.lsp.enable({ "ruff", "pyright" })      -- python
vim.lsp.enable({ "nixd" })                 -- nix
