vim.loader.enable()

require("core.options")
require("core.keymaps")
require("core.api")
require("lazyspec")

spec("start.startup")
spec("plugin.colorscheme")
spec("plugin.treesitter")
spec("plugin.lsp-zero")
spec("plugin.mason")
spec("plugin.typst")
spec("plugin.telescope")
spec("plugin.oil")
spec("plugin.harpoon")
spec("plugin.surround")
spec("plugin.lualine")
spec("plugin.copilot")

require("plugin.lazy")

for _, plugin in ipairs({
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
  "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
  "2html_plugin", "matchparen", "logipat", "rrhelper", "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers",
}) do
  vim.g["loaded_" .. plugin] = 1
end
