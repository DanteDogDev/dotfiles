return {
  -- { "wnkz/monoglow.nvim" },
  -- { "projekt0n/github-nvim-theme" },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
