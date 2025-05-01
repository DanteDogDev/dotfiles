return {
  "DanteDogDev/ToastVim",
  import = "toastvim.plugins",
  -- branch = "dev",
  -- dir = "~/git/ToastVim/",
  ---@type ToastVim.Config
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      markdown = { "markdownlint-cli2", "markdown-toc" },
      jsonc = { "prettier" },
      json = { "prettier" },
    },
    linters_by_ft = {
      markdown = { "markdownlint-cli2" },
    },
    lsp = {
      keymaps = {
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
        ["${PROJECT}"] = function() return vim.fn.system('powershell -Command "Split-Path -Leaf (Get-Location)"'):gsub("\n", "") end,
      },
    },
  },
}

--vim.api.nvim_buf_set_keymap(0,"n","<leader>ch","<CMD>LspClangdSwitchSourceHeader<CR>", {desc = "Switch to Source Header",silent = true})
