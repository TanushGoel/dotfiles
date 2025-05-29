local M = {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    lazy = false
}

function M.config()
    require "nvim-treesitter.configs".setup {
        -- ensure_installed = { "c", "lua", "rust" , "bash", "python", "markdown", "markdown_inline"},
        -- :TSInstall maintained (when update plugins or neovim)
        sync_install = true,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true }
    }
end

return M
