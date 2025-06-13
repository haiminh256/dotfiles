return
{
    {    
    "mason-org/mason.nvim",
    config = function()
       require("mason").setup() 
    end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup{
                ensure_installed = {
                    "pyright",
                    "lua_ls",
                    "jdtls",
                }
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            -- lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
     lspconfig.ts_ls.setup({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})       -- typescript


            lspconfig.ccls.setup({
                init_options = {
                    cache = {
                        directory = ".ccls-cache";
                    };
                },
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            }) 
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end   
    }
}
