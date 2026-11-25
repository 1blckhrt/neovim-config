return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local servers = {
      lua_ls = {},
      nil_ls = {},
      ruff = {},
      ty = {},
      pyrefly = {},
      sqruff = {},
      cssls = {},
      jsonls = {},
      rumdl = {
        cmd = { "rumdl", "server" },
        filetypes = { "markdown" },
        root_markers = { ".rumdl.toml", "rumdl.toml", ".git" },
        on_attach = function(client, bufnr)
          -- Prevent rumdl LSP from formatting; let conform + prettierd handle it
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      },
    }

    for server_name, cfg in pairs(servers) do
      vim.lsp.config(server_name, cfg)
      vim.lsp.enable(server_name)
    end
  end,
}
