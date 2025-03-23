return {
  "echasnovski/mini.nvim",
  name = "mini",
  version = false,
  config = function()
    local mini_config = {}
    local mini_modules = {
      "icons",
      "pairs",
      "indentscope",
    }
    for _, module in ipairs(mini_modules) do
      require("mini." .. module).setup(mini_config[module] or {}) -- Prevent indexing nil
    end
  end,
}
