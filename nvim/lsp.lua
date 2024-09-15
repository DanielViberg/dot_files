local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.keymap.set('n', '<C-m>', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr })
end)

--RenameAll
vim.cmd('abb ra RenameAll')
vim.api.nvim_create_user_command('RenameAll',
	function()
		vim.cmd('lua vim.lsp.buf.rename()');
	end, {})

--FindReferences
vim.cmd('abb fr FindReferences')
vim.api.nvim_create_user_command('FindReferences',
	function()
		vim.cmd('lua vim.lsp.buf.references()');
	end, {})

--GetDoc
vim.cmd('abb gd HoverDoc')
vim.api.nvim_create_user_command('HoverDoc',
	function()
		vim.cmd('lua vim.lsp.buf.hover()');
	end, {})

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		-- Navigate between snippet placeholder
		['<TAB>'] = cmp_action.luasnip_jump_forward(),
		['<S-TAB>'] = cmp_action.luasnip_jump_backward(),
	})
})

-- Lua
require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	}
})

-- Php
-- Read lic keu from file
local file = os.getenv("NVIM_CONFIG") .. "/.lic/php"
local fileContent = io.open(file, "r")
local licenseKey = fileContent:read("*a")
fileContent:close()
licenseKey = string.gsub(licenseKey, "\n", "")

require('lspconfig').intelephense.setup({
	init_options = {
		licenceKey = licenseKey,
	},
	settings = {
		intelephense = {
			format = {
				braces = 'k&r',
			},
		},
	}
})

-- Vue
require('lspconfig').volar.setup({
	settings = {
		html = {
			format = {
				wrapAttributes = "force-aligned"
			}
		},
	},
})

-- Typescript
require('lspconfig').tsserver.setup({
	init_options = {
		plugins = { {
			name = "@vue/typescript-plugin",
			location = "/repos/tools/node-v20.17.0-linux-x64/lib/node_modules/@vue/typescript-plugin",
			languages = {
				"typescript",
				"javascript",
				"vue",
			}
		},
		},
		tsserver = {
			tsdk = "/repos/tools/node-v20.17.0-linux-x64/lib/node_modules/typescript/lib"
		},
	},
	root_dir = require('lspconfig.util').root_pattern("package.json", "vue.config.js", ".git"),
	filetypes = { 'typescript', 'javascript', 'vue' },
})


-- Bash
require('lspconfig').bashls.setup({})

-- Clangd
require('lspconfig').clangd.setup({
	handlers = {
		['textDocument/publishDiagnostics'] = function()
		end,
	},
})
