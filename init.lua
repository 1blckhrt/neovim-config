-- Leader
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Globals
vim.g.have_nerd_font = true

-- UI
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.showmatch = true
vim.o.laststatus = 3
vim.opt.fillchars = { eob = " " }
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.o.breakindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.o.inccommand = "split"

-- Behavior
vim.o.mouse = "a"
vim.opt.undofile = true
vim.opt.confirm = true
vim.opt.updatetime = 200
vim.opt.timeoutlen = 250
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
})

-- Keymaps
local map = vim.keymap.set

-- General
map("n", ";", ":")
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "U", "<C-r>", { desc = "Redo" })

-- Visual mode indent keeps selection
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Disable arrow keys
map({ "n", "i", "v" }, "<left>", '<cmd>echo "Use h to move!"<CR>')
map({ "n", "i", "v" }, "<right>", '<cmd>echo "Use l to move!"<CR>')
map({ "n", "i", "v" }, "<up>", '<cmd>echo "Use k to move!"<CR>')
map({ "n", "i", "v" }, "<down>", '<cmd>echo "Use j to move!"<CR>')

-- System clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Plugins
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
