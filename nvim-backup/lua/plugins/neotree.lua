return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          },
        },
        diagnostics = {
          symbols = {
            hint = "󰌵",
            info = "",
            warn = "",
            error = "",
          },
        },
      },
    },
  },
}
