local M = {
   'williamboman/mason.nvim',
   dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'nvim-lua/plenary.nvim',
   },
   servers = {
      "lua_ls",
      "pyright",
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
         ['<Tab>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
         }),
         ['<C-Space>'] = cmp.mapping.complete(),
         ['<C-f>'] = cmp_action.luasnip_jump_forward(),
         ['<C-b>'] = cmp_action.luasnip_jump_backward(),
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

   lsp.setup()

   require("mason").setup()
   require("mason-lspconfig").setup({
      ensure_installed = M.servers,
      automatic_installation = true,
      handlers = {
         function(server_name)
            require("lspconfig")[server_name].setup({})
         end
      }
   })
end

return M

-- :Mason 
-- i to install
