local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    svelte = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    python = { "black" },
    go = { "gofumpt", "goimports" },
    rust = { "rustfmt" },
    php = { "php_cs_fixer" }, -- or "pint" for Laravel projects
    java = { "google-java-format" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    sql = { "sql_formatter" },
    dockerfile = { "dockfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
