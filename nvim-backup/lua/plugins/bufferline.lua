return {
  'akinsho/bufferline.nvim', 
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        always_show_bufferline = true,
        separator_style = "slope",
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        }
      },
    })
  end,
}
