return {
  "echaya/neowiki.nvim",
  lazy = false,
  opts = {
    wiki_dirs = {
      { name = "Personal", path = "~/my-home/notes/" },
    },
  },
  keys = {
    { "<leader>wk", "<cmd>lua require('neowiki').open_wiki('Personal')<cr>", desc = "Open Wiki" },
  },
}
