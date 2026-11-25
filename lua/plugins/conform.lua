return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      nix = { "nixfmt" },
      markdown = { "prettierd-markdown" },
      sql = { "sqruff" },
    },
    formatters = {
      prettierd_markdown = {
        inherit = "prettierd",
        prepend_args = { "--prose-wrap", "always" },
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
