-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.g.root_spec = { "cwd" }

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
  desc = "Highlight yanked text",
})

-- reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "bufcheck",
  pattern = vim.env.MYVIMRC,
  command = "silent source %",
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NeoTreeAutoOpen", { clear = true }),
  callback = function()
    -- Ensure we are in a valid file buffer and not another neo-tree buffer
    if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      require("neo-tree.command").execute({ reveal = true, position = "left" })
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open Neo-tree automatically",
  callback = function()
    -- Only auto-open if Neovim is opened without a specific file argument
    if vim.fn.argc() == 0 then
      require("neo-tree.command").execute({ toggle = true, position = "left" })
    end
  end,
})
