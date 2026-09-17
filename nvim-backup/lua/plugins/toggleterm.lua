return {
  {
    'akinsho/toggleterm.nvim',
    config = true,
    opts = {
      winbar = {
        enabled = true,
        name_formatter = function(term)
          return string.format("%d:%s", term.id, term.name)
        end,
      }
    }
  }
}

