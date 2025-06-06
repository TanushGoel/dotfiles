return {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotChat", "CopilotChatToggle" },
    branch = "main",
    build = "make tiktoken",
    dependencies = {
        { "zbirenbaum/copilot.lua" }, -- copilot backend
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" }
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        previewer = false,
                        initial_mode = "normal",
                        sorting_strategy = "ascending",
                        layout_strategy = "center",
                        layout_config = {
                            center = { width = 0.8, height = 0.9 }
                        }
                    })
                }
            }
        })
        require("telescope").load_extension("ui-select")

        require("CopilotChat").setup({
            show_help = false,
            system_prompt = (function()
                local script_path = debug.getinfo(1, "S").source:sub(2)
                local script_dir = vim.fn.fnamemodify(script_path, ":h")
                local file = io.open(script_dir .. "/.copilotsysp.txt", "r")
                local content = file and file:read("*a") or ""
                if file then file:close() end
                return content
            end)(),
            model = "claude-sonnet-4", -- :CopilotChatModels
            -- agent = "agentic-search", -- :CopilotChatAgents
            temperature = 0.0,
            question_header = " ME ",
            answer_header = " AI ",
            error_header = " SHIT ",
            remember_as_sticky = false,
            references_display = 'write',
            window = {
                layout = "vertical",
                width = 0.35
            },
            mappings = {
                accept_diff = { normal = "<C-l>", insert = "<C-l>" },
                reset = { normal = false, insert = false },
                show_diff = { full_diff = true }
            },
            prompts = {
                Explain = "Explain this code please:",
                Review = "Review this code please:",
                Fix = "Help debug this code and fix any issues please:",
                Optimize = "Optimize this code please:",
                Docs = "Add documentation comments for this code please:",
                Refactor = "Refactor this code please:",
                Commit = {
                    prompt = "Write a conventional commit message for these changes please:",
                    context = "git:staged"
                }
            }
        })
    end
}

-- enable/disable features: https://github.com/settings/copilot/features
-- marketplace: https://github.com/marketplace?type=apps&copilot_app=true
-- https://docs.github.com/en/copilot/using-github-copilot/ai-models/changing-the-ai-model-for-copilot-chat#ai-models-for-copilot-chat
