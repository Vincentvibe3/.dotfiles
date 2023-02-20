require"alpha".setup(require"alpha.themes.theta".config)
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local theta = require("alpha.themes.theta")
theta.buttons.val = {
    dashboard.button("n", "  > New ", "<cmd>ene<cr>"),
    dashboard.button("o", "  > Open", "<cmd>Telescope find_files<cr>"),
    dashboard.button("h", "  > Health", "<cmd>checkhealth<cr>"),
    dashboard.button("p", "  > Manage Plugins", "<cmd>Lazy<cr>"),
    dashboard.button("m", "  > Manage LSP", "<cmd>Mason<cr>"),
    dashboard.button("q", "  > Quit", "<cmd>qa!<cr>")
}

