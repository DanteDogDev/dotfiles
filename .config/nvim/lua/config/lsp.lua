-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
vim.filetype.add({
  extension = {
    dox = "doxygen",
  },
})

-- prettier,
vim.lsp.enable({ "lua_ls" }) -- lua-language-server, style_lua,
vim.lsp.enable({ "clangd" }) -- clangd,
vim.lsp.enable({ "rust_analyzer", "bacon_ls" }) -- rust-analyzer, bacon, bacon-ls
