require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "ts_ls", -- TypeScript/JavaScript (formerly tsserver)
  "emmet_ls",
  "tailwindcss",
  "vuels", -- Vue
  "svelte", -- Svelte
  "pyright", -- Python
  "lua_ls", -- Lua
  "gopls", -- Go
  "rust_analyzer", -- Rust
  "intelephense", -- PHP
  "jdtls", -- Java
  "sqlls", -- SQL
  "jsonls", -- JSON
  "yamlls", -- YAML
  "bashls", -- Bash
  "clangd", -- C/C++
  "csharp_ls", -- C#
  "dockerls", -- Docker
  "graphql", -- GraphQL
}

-- Setup each server with NvChad's defaults
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- Special configuration for lua_ls (Lua Language Server)
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Recognize 'vim' global
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
-- read :h vim.lsp.config for changing options of lsp servers
