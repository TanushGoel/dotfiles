local m = {
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("mini.surround").setup {
            mappings = {
                add = "sa",            -- Add surrounding
                delete = "sd",         -- Delete surrounding
                find = "sf",           -- Find surrounding (to the right)
                find_left = "sF",      -- Find surrounding (to the left)
                highlight = "sh",      -- Highlight surrounding
                replace = "sr",        -- Replace surrounding
                update_n_lines = "sn", -- Update number of lines
                suffix_last = "l",     -- Suffix for last method
                suffix_next = "n",     -- Suffix for next method
            },

            highlight_duration = 500,  -- Duration of highlight when calling MiniSurround.highlight()
            n_lines = 20,  -- Number of lines within which surrounding is searched
            respect_selection_type = false,  -- Respect selection type (linewise or blockwise)
            search_method = "cover",  -- Search method for surrounding - options: 'cover', 'cover_or_next', 'cover_or_prev', 'cover_or_nearest', 'next', 'prev', 'nearest'
            silent = false  -- Disable feedback when silent is true
        }
    end
}

return m
