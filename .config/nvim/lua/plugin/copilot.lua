return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 10, -- ms
        keymap = {
          accept = "<C-l>",
          dismiss = "<C-\\>",
          next = "<C-]>",
          prev = "<C-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        ["*"] = true
      },
      copilot_node_command = "node"
    })
  end
}
