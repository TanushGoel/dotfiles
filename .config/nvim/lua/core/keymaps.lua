-- set leader key to space
vim.g.mapleader = " "

local map = vim.keymap.set

-- use jk to exit insert mode
map("i", "jk", "<ESC>")

-- control + s to save
map('n', '<C-s>', ':w<CR>', { noremap = true })
map('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true })

-- delete without yanking
map('v', '<leader>d', '"_d', { noremap = true, silent = true })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>") -- increment
map("n", "<leader>-", "<C-x>") -- decrement

-- telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>lg", builtin.live_grep)
map("n", "<leader>gs", builtin.grep_string)
map("n", "<leader>git", builtin.git_status)
map("n", "<leader>grep", function()
   builtin.grep_string ({search = vim.fn.input("rg > ")}) -- brew install ripgrep
end)

-- lsp keymaps
map("n", "<leader>gd", vim.lsp.buf.definition)
map("n", "<leader>gr", vim.lsp.buf.references)
map("n", "<leader>gi", vim.lsp.buf.implementation)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>K", vim.lsp.buf.hover)
map("n", "<leader>rn", vim.lsp.buf.rename)

-- copilot
vim.g.copilot_no_tab_map = true
map("i", "<C-l>", "copilot#Accept('<CR>')", {noremap=true, silent=true, expr=true, replace_keycodes=false})
map("i", "<C-j>", "copilot#Previous()", {expr=true, silent=true})
map("i", "<C-k>", "copilot#Next()", {expr=true, silent=true})

-- harpoon
map("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "mark file with harpoon" })
map("n", "<leader>hr", "<cmd>lua require('harpoon.mark').remove_file()<cr>", { desc = "remove harpoon mark" })
map("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "go to next harpoon mark" })
map("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "go to previous harpoon mark" })
map("n", "<leader>hs", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "show harpoon marks" })

-- splits
map("n", "<leader>sh", "<CMD>split<CR>", { desc = "split window horizontally" })
map("n", "<leader>sv", "<CMD>vsplit<CR>", { desc = "split window vertically" })

-- diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "show diagnostics" })
map("n", "<leader>E", vim.diagnostic.setloclist, { desc = "show diagnostics in location list" })
