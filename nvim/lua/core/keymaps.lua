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

-- window resizing
map("n", "<D-Up>", "<CMD>resize +2<CR>", { desc = "increase window height" })
map("n", "<D-Down>", "<CMD>resize -2<CR>", { desc = "decrease window height" })
map("n", "<D-Left>", "<CMD>vertical resize -2<CR>", { desc = "decrease window width" })
map("n", "<D-Right>", "<CMD>vertical resize +2<CR>", { desc = "increase window width" })

-- terminal
local function term_split(cmd)
  vim.cmd(cmd)
  vim.cmd("startinsert")
  vim.api.nvim_create_autocmd("TermClose", {
    buffer = 0,
    once = true,
    callback = function() vim.cmd("close") end
  })
end
map("n", "<leader>th", function() term_split("split | terminal") end, { silent = true })
map("n", "<leader>tv", function() term_split("vsplit | terminal") end, { silent = true })

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
map("n", "<leader>zz", ":CopilotChatToggle<CR>", { desc = "Toggle" })
map("n", "<leader>zc", ":CopilotChat<CR>", { desc = "Chat" })
map("n", "<leader>zx", "<cmd>CopilotChatReset<CR>", { desc = "Clear" })
map("v", "<leader>ze", ":CopilotChatExplain<CR>", { desc = "Explain Code" })
map("v", "<leader>zr", ":CopilotChatReview<CR>", { desc = "Review Code" })
map("v", "<leader>zf", ":CopilotChatFix<CR>", { desc = "Fix Code Issues" })
map("v", "<leader>zo", ":CopilotChatOptimize<CR>", { desc = "Optimize Code" })
map("v", "<leader>zd", ":CopilotChatDocs<CR>", { desc = "Generate Docs" })
map("v", "<leader>zv", ":CopilotChatRefactor<CR>", { desc = "Refactor Code" })
map("v", "<leader>zm", ":CopilotChatCommit<CR>", { desc = "Generate Commit Message" })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    map("n", "gs", ":CopilotChatSave<CR>", { desc = "Save Chat", buffer = true })
    map("n", "gl", ":CopilotChatLoad<CR>", { desc = "Load Chat", buffer = true })
  end
})

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

-- open file path under cursor in split window
map('n', 'gx', function()
  local line = vim.api.nvim_get_current_line()
  local path = line:match('%[.-%]%((.-)%)') or vim.fn.expand('<cfile>')
  if path and path ~= '' then
    vim.cmd('rightbelow vsplit ' .. vim.fn.fnameescape(path))
  end
end)

-- open URL under cursor in browser
map('n', 'gX', function()
  local line = vim.api.nvim_get_current_line()
  local url = line:match('https?://[%w-_%.%?%.:/%+=&]+[%w-_/]')
  if url then
    vim.fn.system('open "' .. url .. '"')
  end
end)
