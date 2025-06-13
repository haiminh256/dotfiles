return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- null_ls.builtin.formatting.stylua,
                -- null_ls.builtin.formatting.prettier,
                -- null_ls.builtin.formatting.black,
                -- null_ls.builtin.formatting.isort,
                -- null_ls.builtin.formatting.mypy,
                -- null_ls.builtin.formatting.ruff,
                -- null_ls.builtin.formatting.gofumpt,
                -- null_ls.builtin.code_actions.impl,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
