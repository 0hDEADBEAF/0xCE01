local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
	-- Colorscheme
	"morhetz/gruvbox",
	
	-- Completion 
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "*",
		---@module "blink.cmp"
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono"
			},
			completion = {
				keyword = {
					range = "prefix"
				},
				menu = {
					draw = {
						treesitter = { "lsp" }
					}
				},
				trigger = {
					show_on_trigger_character = true
				},
				documentation = {
					auto_show = true
				}
			},
			signature = {
				enabled = true
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" }
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning"
			}
		},
		opts_extend = { "sources.default" }
	},

	-- LSP
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig"
		},
		opts = {
			ensure_installed = {
				-- Language specific LSP here
			}
		}
	}
})
