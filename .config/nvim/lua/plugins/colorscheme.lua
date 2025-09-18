return {
  -- {
  --   "projekt0n/github-nvim-theme",
  --   enabled = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme github_dark")
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
