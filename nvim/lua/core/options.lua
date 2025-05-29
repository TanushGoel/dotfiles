local opt = vim.opt

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = true -- enable line wrapping
opt.linebreak = true -- wrap at word boundaries

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = false -- don't highlight the current cursor line

-- appearance
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.iskeyword:append("-") -- consider string-string as whole word

-- autocompletion
opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
-- show completion menu - don't auto insert text or select first item

-- responsiveness
opt.updatetime = 300 -- time is ms before triggering CursorHold event
opt.timeout = true -- timeout for key mappings
opt.timeoutlen = 300 -- time in ms to wait for mapped sequence to complete

-- better syntax highlighting
opt.conceallevel = 0

-- file handling
opt.swapfile = false -- disable swap files
opt.undofile = true -- enable persistent undo
local undodir = vim.fn.stdpath("config") .. "/etc/undo"
opt.undodir = undodir -- directory for storing undo files
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p", 0700)
end
