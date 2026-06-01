-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_spec = { "cwd" }

vim.g.lazyvim_picker = "telescope"

require("mason.nvim").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enabled = true, -- Automatically reveal and focus the file in the active buffer
      leave_dirs_open = false, -- Close all other directories
    },
    use_libuv_file_watcher = true, -- Auto-update the tree when files change on disk
    bind_to_cwd = true, -- Keep root in sync with the window's working directory
  },
})
