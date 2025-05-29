vim.loader.enable() -- module caching

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
spec("plugin.copilotchat")

require("plugin.lazy")
