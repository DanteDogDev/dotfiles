-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

vim.filetype.add({
  extension = {
    dox = "doxygen",
  },
})

-- prettier,
vim.lsp.enable({ "emmylua_ls" }) -- lua
vim.lsp.enable({ "ts_ls","html","cssls" }) -- javascrip
vim.lsp.enable({ "clangd" }) -- clangd,
vim.lsp.enable({ "ruff", "pyright" }) -- lsp for python
vim.lsp.enable({ "nixd" }) -- nix
