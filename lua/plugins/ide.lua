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
    'brianhuster/live-preview.nvim',
   },
   {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
   },
   {
  	'mrcjkb/rustaceanvim',
 	-- To avoid being surprised by breaking changes,
 	 -- I recommend you set a version range
 	 version = '^9',
 	 -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
 	 -- No need for lazy.nvim to lazy-load it.
 	 lazy = false,
  }
}
