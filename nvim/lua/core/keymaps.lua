-- set leader key to space
vim.g.mapleader = " "

local map = vim.keymap.set

-- use jk to exit insert mode
map("i", "jk", "<ESC>")

-- command + s to save
map('n', '<D-s>', ':w<CR>', { noremap = true })
map('i', '<D-s>', '<Esc>:w<CR>a', { noremap = true })

-- delete without yanking
map('v', '<leader>d', '"_d', { noremap = true, silent = true })

-- no highlight
map('n', '<leader>nh', ':nohl<CR>', { noremap = true, silent = true })

-- splits
map("n", "<leader>sh", "<CMD>split<CR>", { desc = "split window horizontally" })
map("n", "<leader>sv", "<CMD>vsplit<CR>", { desc = "split window vertically" })

-- telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>lg", builtin.live_grep)
map("n", "<leader>gs", builtin.grep_string)
map("n", "<leader>git", builtin.git_status)
map("n", "<leader>grep", function()
   builtin.grep_string ({search = vim.fn.input("rg > ")})
end)

-- lsp keymaps
map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>ld", vim.lsp.buf.definition)
map("n", "<leader>lr", vim.lsp.buf.references)
map("n", "<leader>li", vim.lsp.buf.implementation)
map("n", "<leader>la", vim.lsp.buf.code_action)
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>rn", vim.lsp.buf.rename) -- :'<,'>s/word/replace

-- copilot
vim.g.copilot_no_tab_map = true

-- diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "show diagnostics" })
map("n", "<leader>E", vim.diagnostic.setloclist, { desc = "show diagnostics in location list" })
map("n", "<leader>ln", vim.diagnostic.goto_next, { desc = "go to next diagnostic" })
map("n", "<leader>lp", vim.diagnostic.goto_prev, { desc = "go to previous diagnostic" })

-- harpoon
map("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "mark file with harpoon" })
map("n", "<leader>hr", "<cmd>lua require('harpoon.mark').remove_file()<cr>", { desc = "remove harpoon mark" })
map("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "go to next harpoon mark" })
map("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "go to previous harpoon mark" })
map("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "show harpoon marks" })
