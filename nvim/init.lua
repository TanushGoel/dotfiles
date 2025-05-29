vim.loader.enable() -- module caching

require("core.options")
require("core.keymaps")
require("core.api")
require("lazyspec")

spec("plugin.start.startup")
spec("plugin.colorscheme")
spec("plugin.treesitter")
spec("plugin.lsp.lsp-zero")
spec("plugin.lsp.mason")
spec("plugin.typst")
spec("plugin.telescope")
spec("plugin.oil")
spec("plugin.harpoon")
spec("plugin.surround")
spec("plugin.lualine")
spec("plugin.ai.copilot")
spec("plugin.ai.copilotchat")

require("plugin.lazy")
