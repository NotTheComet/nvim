return {
  { "neoclide/coc.nvim", branch = "release" },
  {
    "alex-popov-tech/store.nvim",
    dependencies = {
      { "OXY2DEV/markview.nvim", opts = {} },
      -- Optional: inline image rendering in README previews (Kitty, Ghostty, WezTerm only)
      -- { "3rd/image.nvim", opts = { integrations = { markdown = { enabled = false } } } },
    },
    opts = {
      -- layout = "tab", -- recommended when using image preview
    },
    cmd = "Store",
  },
  {
    "brianhuster/live-preview.nvim",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "mrcjkb/rustaceanvim",

    version = "^9",
    lazy = false,
  },
  {
    "coffebar/neovim-project",
    opts = {
      projects = {
        "~/Documents/GitHub/*",
        "~/AppData/Local/nvim/*",
        "~/AppData/Local/neovide/*",
        "D:/code/*",
      },
      picker = {
        type = "telescope",
      },
    },
    init = function()
      vim.opt.sessionoptions:append("globals")
    end,
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    cond = vim.loop.os_uname().sysname == "Windows_NT",
    lazy = false,
    priority = 100,
  },
  {
    "coffebar/neovim-project",
    opts = {
      projects = {
        "~/Documents/GitHub/*",
        "~/.config/nvim/*",
        "~/.config/neovide/*",
        "/Volumes/dev-hdd1/code/*",
      },
      picker = {
        type = "telescope",
      },
    },
    init = function()
      vim.opt.sessionoptions:append("globals")
    end,
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    cond = vim.loop.os_uname().sysname == "Linux" or vim.loop.os_uname().sysname == "Darwin",
    lazy = false,
    priority = 100,
  },
}
