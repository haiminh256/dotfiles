return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 11,
      open_mapping = [[<leader><TAB>]],
      shading_factor = 2,
      direction = "horizontal", -- or 'horizontal', 'vertical', 'tab'
      float_opts = {
        border = "curved",
        winblend = 3,
      },
    })

    -- Optional keybinds
    -- vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
  end,
}

