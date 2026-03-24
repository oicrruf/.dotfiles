return {
  {
    "marcinjahn/gemini-cli.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    -- cmd = { "Gemini" },
    keys = {
      { "<leader>gc", "<cmd>Gemini toggle<cr>", desc = "Toggle Gemini CLI" },
      { "<leader>ga", "<cmd>Gemini add_file<cr>", desc = "Add current file to Gemini" },
    },
    opts = {
      win = {
        -- position = "right",
        -- relative = "win",
        width = 100,
      },
    },
  },
}
