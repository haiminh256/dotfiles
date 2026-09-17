return {
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = { preset = "default" },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },

      completion = {
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind" },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 150,
          window = { border = "rounded" },
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
