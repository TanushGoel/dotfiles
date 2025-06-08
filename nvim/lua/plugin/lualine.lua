local M = {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy'
}

M.config = function()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'auto',
            section_separators = { '', '' },
            component_separators = { '', '' }
        },
        extensions = { 'nvim-tree' },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        }
    }
end

return M
