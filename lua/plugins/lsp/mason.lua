return {
  "williamboman/mason.nvim",
  dependencies = {
    "stevearc/conform.nvim",
    "mfussenegger/nvim-lint",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Setup mason
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    })

    -- Setup conform
    require("conform").setup({
      formatters_by_ft = {
        html = { "prettier" },
        css = { "prettier" },
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "eslint_d" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })

    -- Setup nvim-lint
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      python = { "flake8", "pylint" },
      javascript = { "eslint" },
      c = { "clang-tidy" },
      cpp = { "clang-tidy" },
    }

    require("mason-lspconfig").setup({
      -- list of servers for mason to install
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "clangd",
        "ts_ls"
      },
    })

    vim.filetype.add({
      pattern = { [".*/hyprland%.conf"] = "hyprlang" },
    })
  end,
}
