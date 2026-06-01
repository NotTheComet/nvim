-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.root_spec = { "cwd" }

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({ "hover", "actions" })
  end,
  { silent = true, buffer = bufnr }
)

-- Toggle Neo-tree with Space + e
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- Reveal the current file in Neo-tree
vim.keymap.set("n", "<leader>o", ":Neotree reveal<CR>", { desc = "Reveal current file in Neo-tree" })
