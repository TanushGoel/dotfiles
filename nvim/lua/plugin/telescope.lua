local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}
    },
    lazy = true,
    cmd = "Telescope"
}

function M.config()
    local actions = require "telescope.actions"

    require("telescope").setup({
        defaults = {
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    preview_width = 0.6,
                    results_width = 0.4
                }
            },
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-q>"] = actions.close,
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev
                },
                n = {
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["q"] = actions.close,
                    ["n"] = actions.cycle_history_next,
                    ["p"] = actions.cycle_history_prev
                }
            }
        }
    })

    require("telescope").load_extension("fzf")
end

return M
