vim.o.guicursor = ""
vim.wo.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.termguicolors = true
local options = {noremap = true}
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-B>", ":NnnPicker<CR>", options)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    {"nvim-telescope/telescope.nvim", tag = "0.1.1",
	dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "lukas-reineke/indent-blankline.nvim" },
    {'goolord/alpha-nvim',
        config = function()
            require("alpha-theme")
        end,
        dependencies={"nvim-tree/nvim-web-devicons"}
    },
    {"glepnir/galaxyline.nvim", branch = "main",
        config = function()
            require('eviline')
        end,
        dependencies = {"nvim-tree/nvim-web-devicons"}
    },
    {"nvim-treesitter/nvim-treesitter", build=":TSUpdate",
        config = function()
            require"nvim-treesitter.configs".setup {
                highlight = {
                    enable = true,
                }
            }
        end
    },
    {"navarasu/onedark.nvim", 
        config=function()
            require("onedark").load()
        end
    },
    {"luukvbaal/nnn.nvim", 
        config=function()
            require("nnn").setup()
        end
    },
    {"ms-jpq/coq_nvim", branch="coq",
        config=function()
            vim.g.coq_settings = {auto_start = true}
            require("coq")
            vim.cmd("COQnow -s")
        end
    },
    {"ms-jpq/coq.artifacts", branch="artifacts"},
    {"neovim/nvim-lspconfig",
        config=function()
            local lsp = require"lspconfig"
            lsp.pyright.setup{}
            lsp.svelte.setup{}
            lsp.dartls.setup{}
            lsp.tsserver.setup{}
            lsp.kotlin_language_server.setup{}
            lsp.bashls.setup{}
            lsp.jsonls.setup{}
        end
    },{"williamboman/mason.nvim",
        config=function()
            require("mason").setup()
        end
    },{"akinsho/toggleterm.nvim", version="v2.*",
        config=function()
            require("toggleterm").setup()
        end
    }
})
require("telescope").setup{
    defaults = {
    	path_display={"smart"}
    }
}
