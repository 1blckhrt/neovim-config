local colorschemes = {
    ["gruvbox-material-dark"] = {
        "sainnhe/gruvbox-material",
        config = function()
            vim.g.gruvbox_material_transparent_background = 1
            vim.g.gruvbox_material_better_performance = 1
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },

    ["github-dark"] = {
        "projekt0n/github-nvim-theme",
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = true,
                },
            })
            vim.cmd.colorscheme("github_dark")
        end,
    },

    ["nordic"] = {
        "AlexvZyl/nordic.nvim",
        config = function()
            require("nordic").setup({
                bold_keywords = false,
                italic_comments = false,
                transparent = { bg = true },
                bright_border = false,
            })
            require("nordic").load()
        end,
    },
}

local function get_colorscheme()
    local path = vim.fn.expand("~/.config/colorscheme.txt")
    local lines = vim.fn.readfile(path)

    return lines[1] or "gruvbox-material-dark"
end

local selected = get_colorscheme()

local plugins = {}

for name, plugin in pairs(colorschemes) do
    plugin.lazy = false
    plugin.priority = 1000
    plugin.cond = selected == name

    table.insert(plugins, plugin)
end

return plugins
