local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require "lazy".setup(LAZY_SPEC, {
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
                "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
                "2html_plugin", "matchparen", "logipat", "rrhelper",
                "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers",
            }
        },
        cache = {
            enabled = true,
            paths = {
                vim.fn.stdpath("cache") .. "/lazy",
                ttl = 3600 * 24 -- 1 day
            }
        }
    }
})
