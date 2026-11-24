vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

if mnw ~= nil then
  require("lazy").setup({
    dev = {
      path = mnw.configDir .. "/pack/mnw/opt",
      patterns = { "" },
      fallback = true,
    },

    performance = {
      reset_packpath = false,
      rtp = {
        reset = false,
      },
    },

    install = {
      missing = true,
    },

    spec = {
      { import = "plugins" },
    },
  })
else
  print("mnw not found...")
end
