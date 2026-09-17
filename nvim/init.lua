vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.mapleader = " "
vim.keymap.set("n", "q", ":q<CR>", { silent = true })
vim.keymap.set("n", "<F5>", ":source %<CR>", { silent = true })
vim.keymap.set("n", "<leader>v", ":lua MiniFiles.open()<CR>", { silent = true })
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
local MiniDeps = require('mini.deps')
MiniDeps.setup({ path = { package = path_package } })
local add = MiniDeps.add
add({
  source = 'folke/tokyonight.nvim'
})
add({
  source = 'neovim/nvim-lspconfig'
})
add({
  source = 'akinsho/toggleterm.nvim'
})
vim.cmd("colorscheme tokyonight-storm")
require("mini.icons").setup({})
require("mini.files").setup({})
require("mini.pairs").setup({})
require("mini.statusline").setup({})
require("mini.cmdline").setup({})
require("mini.snippets").setup({})
require("mini.completion").setup({})
require("mini.tabline").setup({})
require("mini.fuzzy").setup({})
require("mini.pick").setup({})

vim.lsp.enable("rust_analyzer")
require("toggleterm").setup({
  winbar = {
    enabled = true
  }
})
vim.keymap.set({"n", "t"}, "<leader><TAB>", "<Cmd>:ToggleTerm toggle size=10<CR>", { silent = true })
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { silent = true })
