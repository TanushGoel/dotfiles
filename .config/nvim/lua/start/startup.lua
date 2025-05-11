local M = {
    "startup-nvim/startup.nvim",
    requires = {require("plugin/telescope"), "nvim-lua/plenary.nvim"}
}

function M.config()
    -- vim.g.startup_disable_on_startup = true
    require("startup").setup(require("start.startup-config"))
end

return M
