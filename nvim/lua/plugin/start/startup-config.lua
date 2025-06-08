local settings = {
    header = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = require("plugin.start.image_ascii"), -- require("startup.headers").hydra_header,
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0
    },
    header_2 = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Quote",
        margin = 5,
        content = require("plugin.start.nvim_ascii"),
        highlight = "Constant",
        default_color = "",
        oldfiles_amount = 0
    },

    body = {
        type = "mapping",
        align = "center",
        fold_section = true,
        title = "Scriptures",
        margin = 5,
        content = {
            { "Find Word", "Telescope live_grep", "<leader>lg" },
            { "Find File", "Telescope find_files", "<leader>ff" },
            { "Old File", "Telescope oldfiles", "<leader>of" },
            { "New File", "lua require'startup'.new_file()", "<leader>nf" },
            { "Obsidian", "cd $HOME/0brain/ | Telescope find_files", "obs" },
            { "Code", "cd $HOME/1code/ | Telescope find_files", "code" }
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0
    },
    body_2 = {
        type = "oldfiles",
        oldfiles_directory = true,
        align = "center",
        fold_section = true,
        title = "Historic Relics",
        margin = 5,
        content = {},
        highlight = "String",
        default_color = "#FFFFFF",
        oldfiles_amount = 5
    },

    footer = {
        type = "oldfiles",
        oldfiles_directory = false,
        align = "center",
        fold_section = true,
        title = "Ancient Ruins",
        margin = 5,
        content = { "startup.nvim" },
        highlight = "String",
        default_color = "#FFFFFF",
        oldfiles_amount = 5
    },

    options = {
        after = function()
            require("startup.utils").oldfiles_mappings()
        end,
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 2, 2, 2, 2, 2, 2, 2 }
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2"
    },
    parts = {
        "header",
        "header_2",
        "body",
        "body_2",
        "footer"
    }
}
return settings
