local api = vim.api

-- oil
api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local open_oil = function(path) vim.schedule(function() vim.cmd("Oil " .. vim.fn.fnameescape(path or "")) end) end

        vim.keymap.set("n", "-", function() open_oil() end)

        local arg = vim.fn.argv(0)
        if arg and vim.fn.isdirectory(arg) == 1 then
            open_oil(arg)
        end
    end
})

api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.filetype == "oil" then
          vim.cmd.lcd(require("oil").get_current_dir())
        end
    end
})


-- open files in external applications
local function open_external(patterns, command, event)
  api.nvim_create_autocmd(event or "BufReadPost", {
    pattern = patterns,
    callback = function()
      local file = vim.fn.shellescape(vim.fn.expand("%:p"))
      vim.fn.jobstart(command .. " " .. file, {detach = true})
      vim.cmd("bd!")
    end
  })
end

open_external({"*.ipynb"}, "cursor")
open_external({"*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.pdf", "*.heic"}, "open")
open_external({"*.pdb", "*.cif"}, "pymol", "BufReadPre")
