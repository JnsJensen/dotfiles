---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-t>d"] = { function()
      local bufnr = vim.api.nvim_get_current_buf()
      if vim.diagnostic.is_disabled(bufnr) then
        vim.diagnostic.enable(bufnr)
      else
        vim.diagnostic.disable(bufnr)
      end
    end, "toggle diagnostics" },
    ["<Space>p"] = { "<cmd> Telescope find_files<CR>", "telescope find files" },
    ["<f1>"] = { "<cmd> source ~/.config/nvim/init.lua <CR>" }
  }
}

return M
