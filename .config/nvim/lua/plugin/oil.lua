vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	{
		"stevearc/oil.nvim",
        cmd = "Oil",
		opts = {
			columns = {
				"icon",
			},
			win_options = {
				winbar = "%{v:lua.require('oil').get_current_dir()}"
			},
            view_options = {
                show_hidden = false,
                is_hidden_file = function(name)
                    return vim.startswith(name, ".")
                end
            },
            delete_to_trash = true
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "-", "<cmd>Oil<CR>", desc = "Open parent directory" }
		}
	}
}
