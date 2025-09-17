-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
vim.filetype.add({
  extension = {
    dox = "doxygen",
  },
})
vim.lsp.enable({ "lua_ls", "clangd", "cmake" })
