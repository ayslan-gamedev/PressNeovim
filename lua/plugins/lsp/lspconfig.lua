return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
    { "hrsh7th/cmp-nvim-lsp" },
    { "lvimuser/lsp-inlayhints.nvim" }
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- mason config
    require("mason-lspconfig").setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["svelte"] = function()
        -- configure svelte server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            "svelte",
          },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,

      ["clangd"] = function()
        -- configure clangd language server
        lspconfig["clangd"].setup({
          capabilities = capabilities,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=bundled",
            "--cross-file-rename",
            "--function-arg-placeholders",
            "--header-insertion=iwyu",
            "--header-insertion-decorators",
            "-j=8",
            "--malloc-trim",
            "--pch-storage=memory",
          },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)
          end,
        })
      end,
    })

    -- neocmakelsp config
    if not configs.neocmake then
      configs.neocmake = {
        default_config = {
          cmd = { "neocmakelsp", "--stdio" },
          filetypes = { "cmake" },
          root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname)
          end,
          single_file_support = true, -- suggested
          on_attach = on_attach,      -- on_attach is the on_attach function you defined
          init_options = {
            format = {
              enable = true
            },
            lint = {
              enable = true
            },
            scan_cmake_in_package = true -- default is true
          }
        }
      }
      lspconfig.neocmake.setup({})
    end
  end,
}
