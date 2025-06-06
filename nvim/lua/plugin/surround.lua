local M = {
    "echasnovski/mini.surround",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("mini.surround").setup {
            mappings = {
                add = "ms",            -- Add surrounding
                delete = "md",         -- Delete surrounding
                find = "mf",           -- Find surrounding (to the right)
                find_left = "mF",      -- Find surrounding (to the left)
                highlight = "mh",      -- Highlight surrounding
                replace = "mr",        -- Replace surrounding
                update_n_lines = "mu", -- Update number of lines
                suffix_last = "ml",    -- Suffix for last method
                suffix_next = "mn"     -- Suffix for next method
            },
            highlight_duration = 500,  -- Duration of highlight when calling MiniSurround.highlight()
            n_lines = 20,  -- Number of lines within which surrounding is searched
            respect_selection_type = false,  -- Respect selection type (linewise or blockwise)
            search_method = "cover_or_nearest",  -- Search method for surrounding - 'cover', 'cover_or_next', 'cover_or_prev', 'cover_or_nearest', 'next', 'prev', 'nearest'
            silent = true  -- Disable feedback when silent is true
        }
    end
}

return M
