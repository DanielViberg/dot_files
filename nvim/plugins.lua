require("lazy").setup({
	{ "rose-pine/neovim",  as = "rose-pine" },
	{
		'rmagatti/auto-session',
		config = function()
			require("auto-session").setup {
				log_level = "error",
				auto_save_enabled = true,
			}
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		config = function()
			local actions = require('telescope.actions')
			require('telescope').setup({
				defaults = {
					mappings = {
						i = {
							["<ESC>"] = actions.close,
						},
					},
				},
			})
		end,
		tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ "github/copilot.vim" },
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
		}
	},
	{
		'smoka7/hop.nvim',
		version = "*",
		opts = {
			keys = 'etovxqpdygfblzhckisuran'
		},
		init = function()
			local hop = require('hop')
			vim.keymap.set('', 'f', function()
				hop.hint_char1({})
			end, { remap = true })
		end
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' }
		},
		init = function()
			local cmp = require('cmp')
			cmp.setup.mapping = cmp.mapping.preset.insert({
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			})
		end
	},
})
