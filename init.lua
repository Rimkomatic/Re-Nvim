require("config.lazy")
require("keymap")
--require("/hime/rik/.config/nvim/plugin/floaterminal")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes:1"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff" })                    -- Make absolute line numbers white
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true }) -- Make current line number white and bold

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "D", '"_D')



vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yank a text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
