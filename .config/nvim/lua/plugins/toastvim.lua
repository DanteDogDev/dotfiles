return {
  {
    "DanteDogDev/ToastVim",
    branch = "dev",
    ---@type ToastVim.Config
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    opts = {
      -- When installing formatter you need to set it here
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      -- When installing linter you need to set it here
      linters_by_ft = {},
    },
  },
}
