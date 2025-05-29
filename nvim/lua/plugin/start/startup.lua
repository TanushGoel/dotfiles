local M = {
    "startup-nvim/startup.nvim",
    lazy = false,
    requires = {require("plugin/telescope"), "nvim-lua/plenary.nvim"}
}

function M.config()
    -- vim.g.startup_disable_on_startup = true
    require("startup").setup(require("plugin.start.startup-config"))
end

return M
