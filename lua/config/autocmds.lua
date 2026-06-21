-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.g.root_spec = { "cwd" }

local bufcheck = vim.api.nvim_create_augroup("BufCheck", { clear = true })
local neotree = vim.api.nvim_create_augroup("NeoTreeAutoOpen", { clear = true })

local function is_neotree_open()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_get_option_value("filetype", { buf = buf }) == "neo-tree" then
      return true
    end
  end
  return false
end

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
  desc = "Highlight yanked text",
})

-- reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
  group = bufcheck,
  pattern = vim.env.MYVIMRC,
  command = "silent source %",
})

vim.api.nvim_create_autocmd("BufNew", {
  desc = "Open Neo-tree automatically",
  callback = function()
    -- Only auto-open if Neovim is opened without a specific file argument
    if vim.fn.argc() and not is_neotree_open() == 0 then
      require("neo-tree.command").execute({ toggle = true, position = "left" })
    end
  end,
})
