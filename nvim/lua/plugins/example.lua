-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- In your plugin files, you can:
-- * add extra plugins
--
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    enabled = false,
  },


{
  "projekt0n/github-nvim-theme",
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      transparent = true,
    },
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  config = function(_, opts)
    require("github-theme").setup(opts)
    vim.cmd("colorscheme github_dark_dimmed")
  end,
},
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "github_dark_dimmed",
  },
},
 {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },


  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- 🧠 Core and scripting
        "bash",
        "lua",
        "vim",
        "vimdoc",
        "regex",
        "query",
        -- 🌐 Web / Frontend
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "xml",
        -- 🐘 Symfony / PHP stack
        "php",
        "phpdoc",
        "twig",
        "yaml",
        "ini",
        "sql",
        -- 🐍 Other backends
        "python",
        "java",
        "c",
        "cpp",
        "rust",
        "go",
        -- ⚙️ Data & config formats
        "toml",
        "dockerfile",
        "gitignore",
        "graphql",
        -- 🧾 Documentation & markup
        "markdown",
        "markdown_inline",
        "latex",
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },
  -- use mini.starter instead of alpha
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {

      ensure_installed = {
        -- 🧹 Formatters / Linters
        "stylua", -- Lua formatter
        "shfmt", -- Shell formatter
        "shellcheck", -- Shell linter
        "flake8", -- Python linter
        "black", -- Python formatter
        "isort", -- Python import sorter
        "prettier", -- JS/TS/HTML/CSS/Markdown formatter
        "phpcs", -- PHP code sniffer
        "phpcbf", -- PHP code beautifier
        "phpstan", -- PHP static analyzer
        "twigcs", -- Twig linter
        "markdownlint", -- Markdown linter
        "hadolint", -- Dockerfile linter
        "sqlfluff", -- SQL linter/formatter

        -- 🌐 LSP servers
        "intelephense", -- PHP LSP server
        "phpactor", -- PHP refactoring / helper
        "pyright", -- Python LSP
        "typescript-language-server",
        "html-lsp", -- HTML LSP
        "css-lsp", -- CSS LSP

        -- 🐘 C / C++ / Go
        "clangd", -- C/C++ LSP server
        "gofumpt", -- Go formatter
        "golangci-lint", -- Go linter
        "gopls", -- Go LSP server

        -- ⚙️ Other
        "bash-language-server", -- Bash LSP
      },
    },
  },
}
