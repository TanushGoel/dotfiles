local M = {
    "gbprod/nord.nvim",
    priority = 1000,
    lazy = false
}

M.config = function()
    vim.opt.termguicolors = true
    vim.cmd "colorscheme nord"
end

return M;
