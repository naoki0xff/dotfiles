return {
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          acp = {
            codex = function()
              return require("codecompanion.adapters").extend("codex", {
                defaults = {
                  auth_method = "chat-gpt", -- options: "api-key" || "chat-gpt"
                },
              })
            end,
          },
        },
        interactions = {
          chat = {
            adapter = {
              name = "codex",
              model = "gpt-5.6-terra",
            },
          },
        },
      })
      -- require("codecompanion").setup({
      --   -- Using Gemini
      --   adapters = {
      --     acp = {
      --       gemini_cli = function()
      --         return require("codecompanion.adapters").extend("gemini_cli", {
      --           defaults = {
      --             auth_method = "gemini-api-key",
      --             timeout = 20000, -- equals to 20 seconds
      --           },
      --           env = {
      --             GEMINI_API_KEY = "****",
      --           },
      --         })
      --       end,
      --     },
      --   },
      --   interactions = {
      --     chat = { adapter = "gemini_cli" },
      --   },
      -- })
    end
  },
}

