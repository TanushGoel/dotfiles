local M = {
    'mason-org/mason.nvim',
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
        'nvim-lua/plenary.nvim',
    },
    servers = {
        "lua_ls",
        "pyright",
        "ruff", "ty",
        "clangd"
    },
    build = ":MasonUpdate",
    event = { "BufReadPre", "BufNewFile", "BufReadPost" }
}

function M.config()
    local lsp = require("lsp-zero")
    lsp.preset("recommended")

    local cmp = require('cmp')
    local cmp_action = lsp.cmp_action()

    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ['<C-l>'] = cmp.mapping(function(fallback)
                if cmp.visible() and cmp.get_selected_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end, { "i", "s" }),
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-u>'] = cmp.mapping.scroll_docs(4)
        }),
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }
        })
    })

    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    vim.defer_fn(function() vim.cmd("silent! MasonUpdate") end, 1000)
    require("mason-lspconfig").setup({
        ensure_installed = M.servers,
        automatic_installation = true,
        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end
        }
    })
    lsp.setup()
end

return M

-- :Mason 
-- i to install
-- u to update
-- X to uninstall
