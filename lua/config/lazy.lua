print("This is required")

local setlinecolor = function()
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
end


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
  spec = {

    -- #f00 Ayu Theme
    {
      "Shatur/neovim-ayu",
      name = "ayu",
      config = function()
        require("ayu").setup({
          dark = true, -- Set to false for "light" variant
          terminal = true,
          overrides = {
            Normal = { bg = "None" },
            NormalFloat = { bg = "none" },
            ColorColumn = { bg = "None" },
            SignColumn = { bg = "None" },
            Folded = { bg = "None" },
            FoldColumn = { bg = "None" },
            CursorLine = { bg = "None" },
            CursorColumn = { bg = "None" },
            VertSplit = { bg = "None" },
          },
        })
        vim.cmd("colorscheme ayu")
      end
    },

    -- #f00  tokyo Night Theme
    {
      "tiagovla/tokyodark.nvim",
      opts = {
        transparent_background = true,
      },
      config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        --vim.cmd [[colorscheme tokyodark]]
      end,
    },

    -- #f00 rose-pine
    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function(opts)
        require("rose-pine").setup({
          dim_inactive_windows = true,
          extend_background_behind_borders = true,
          enable = {
            terminal = true,
            legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
            migrations = true,        -- Handle deprecated options automatically
          },
          styles = {
            transparency = true,
          },
        })
        vim.cmd("colorscheme rose-pine")
      end
    },
    { import = "config.plugins" },
  },
})

-- vim.api.nvim_create_user_command("SetTokyoDark", function()
--   vim.cmd("colorscheme tokyodark")
--   vim.cmd [[LineColor]]
-- end, {})
--
-- vim.api.nvim_create_user_command("SetAyu", function()
--   vim.cmd("colorscheme ayu")
--   vim.cmd [[LineColor]]
-- end, {})
