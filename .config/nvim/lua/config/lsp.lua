-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
vim.filetype.add({
  extension = {
    dox = "doxygen",
  },
})
-- prettier, style_lua, clangd, lua-language-server,
vim.lsp.enable({ "lua_ls", "clangd"})
