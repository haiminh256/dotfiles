vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.mapleader = " "
vim.keymap.set("n", "<F5>", ":source %<CR>", { silent = true })
vim.keymap.set("n", "<leader>v", ":Neotree toggle<CR>", { silent = true })
vim.keymap.set({"n", "t"}, "<leader><TAB>", "<Cmd>:ToggleTerm size=10<CR>", { silent = true })
vim.opt.termguicolors = true

require("config.lazy")
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight-storm',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16,
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
vim.cmd('colorscheme tokyonight-storm')
local signs = {
  Error = "",
  Warn  = "",
  Hint  = "󰌵",
  Info  = "",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  signs = true,
  virtual_text = { prefix = "●" },
  underline = true,
  severity_sort = true,
})
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      diagnostics = {
        enable = true,
      },
    },
  },
})
vim.lsp.enable('rust_analyzer')

