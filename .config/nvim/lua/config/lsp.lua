-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
vim.filetype.add({
  extension = {
    dox = "doxygen",
  },
})
vim.lsp.enable({ "lua_ls", "clangd", "rust_analyzer", "java_language_server"})
