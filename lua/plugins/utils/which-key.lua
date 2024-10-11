return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>f", group = "telescope" },
      { "<leader>e", group = "exmplorer" },
      { "<leader>l", group = "lazy" },
      { "<leader>t", group = "tabs" },
      { "<leader>s", group = "splits" },
      { "<leader>w", group = "sessions" },
      { "<leader>x", group = "trouble" },
      {
        -- Nested mappings are allowed and can be added in any order
        -- Most attributes can be inherited or overridden on any level
        -- There's no limit to the depth of nesting
        mode = { "n", "v" },                          -- NORMAL and VISUAL mode
        { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
        { "<leader>w", "<cmd>w<cr>", desc = "Write" },
      }
    })
  end
}
