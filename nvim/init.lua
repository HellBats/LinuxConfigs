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

local plugins = {{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}}
local opts = {}

 
require("lazy").setup(plugins,opts)


require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    }}
	,{transparent_background = false},{
			integrations = {
        nvimtree = true,
        treesitter = true,
    }
    })

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

local builtin = require("telescope.builtin")

vim.keymap.set('n','<C-p>',builtin.find_files,{})


local configs = require("nvim-treesitter.configs")


