local M = {
   'VonHeikemen/lsp-zero.nvim',
   dependencies = {
      -- LSP support
      'neovim/nvim-lspconfig',

      -- autocompletetion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets'
   },
   event = { "BufReadPre", "BufNewFile", "BufReadPost" }
}

return M
