return {
  "rachartier/tiny-inline-diagnostic.nvim",
  lazy = false,
  config = function()
    require("tiny-inline-diagnostic").setup({
      options = {
        multilines = {
          enabled = true,
        },
      },
    })
    vim.diagnostic.config({ virtual_text = false })
  end,
}
