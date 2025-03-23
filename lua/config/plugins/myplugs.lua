return {
  {

    "Rimkomatic/switchscheme.nvim",                     -- Replace with your GitHub repo
    lazy = true,
    cmd = { "SwitchColorscheme" },                      -- Load only when the command is used
    dependencies = { "nvim-telescope/telescope.nvim" }, -- Ensure Telescope is installed
    config = function()
      require("switchscheme").setup()
    end,
  }
}
