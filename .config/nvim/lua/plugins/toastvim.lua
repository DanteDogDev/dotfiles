return {
  "DanteDogDev/ToastVim",
  import = "toastvim.plugins",
  -- branch = "dev",
  -- dir = "~/git/ToastVim/",
  ---@type ToastVim.Config
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      jsonc = { "prettier" },
      json = { "prettier" },
    },
    linters_by_ft = {
      -- cmake = { "cmakelint" },
    },
    lsp = {
      keymaps = {
        -- stylua: ignore
        {mode = "n", keys = "<leader>ch", action = "<CMD>LspClangdSwitchSourceHeader<CR>", opts = {desc = "Switch to Source Header"}, ft = {"cpp","c"}},
      },
    },
    template = {
      -- stylua: ignore
      expressions = {
        ["${FILENAME}"] = function() return vim.fn.expand("%:t:r") end,
        ["${DATE}"] = function() return os.date("%d/%m/%y") end,
        ["${AUTHOR}"] = function() return vim.fn.system("git config user.name"):gsub("\n", "") end,
        ["${EMAIL}"] = function() return vim.fn.system("git config user.email"):gsub("\n", "") end,
        ["${DIR}"] = function() local path = vim.fn.expand("%:p:h") return path:match("([^/\\]+)$")end,
      },
    },
  },
}
