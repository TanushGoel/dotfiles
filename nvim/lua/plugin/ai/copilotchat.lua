return {
  "CopilotC-Nvim/CopilotChat.nvim",
  cmd = { "CopilotChat", "CopilotChatToggle" },
  branch = "main",
  build = "make tiktoken",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- copilot backend
    { "nvim-lua/plenary.nvim" }
  },
  opts = {
    system_prompt = (function()
        local script_path = debug.getinfo(1, "S").source:sub(2)
        local script_dir = vim.fn.fnamemodify(script_path, ":h")
        local file = io.open(script_dir .. "/.copilotsysp.txt", "r")
        local content = file and file:read("*a") or ""
        if file then file:close() end
        return content
    end)(),
    model = "claude-sonnet-4", -- :CopilotChatModels
    -- agent = "askstackoverflow", -- :CopilotChatAgents
    temperature = 0.0,
    prompts = {
      Explain = "Explain this code please:",
      Review = "Review this code please:",
      Fix = "Help debug this code and fix any issues please:",
      Optimize = "Optimize this code please:",
      Docs = "Add documentation comments for this code please:",
      Refactor = "Refactor this code please"
    },
    window = {
      layout = "vertical", -- "float"
      width = 0.4,
      height = 0.6,
      border = "rounded"
    },
    show_help = false,
    callback = nil,
    remember_as_sticky = false
  },
  keys = {
    { "<leader>zz", ":CopilotChatToggle<CR>", mode = "n", desc = "Toggle" },
    { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat" },
    { "<leader>zx", "<cmd>CopilotChatReset<CR>", mode = "n", desc = "Clear" },
    { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
    { "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code" },
    { "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code Issues" },
    { "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
    { "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs" },
    { "<leader>zm", ":CopilotChatRefactor<CR>", mode = "v", desc = "Refactor Code" },
  }
}

-- :Copilot setup
-- enable/disable features: https://github.com/settings/copilot/features
-- marketplace: https://github.com/marketplace?type=apps&copilot_app=true
