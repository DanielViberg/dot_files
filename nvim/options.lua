vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.number = true

vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.termguicolors = true
vim.o.colorcolumn = '100'
vim.o.smartcase = true
vim.o.scrolloff = 10
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.undofile = true
vim.o.wildoptions = 'pum'
vim.o.autoread = true
vim.o.showtabline = 2
vim.o.fillchars = 'vert:|,horiz:-'
vim.o.pumheight = 20

vim.g.netrw_liststyle = 1
vim.g.netrw_banner = 0
vim.g.netrw_localrmdir = 'rm -r'
vim.g.netrw_sort_by = 'exten'

vim.g.vim_vue_plugin_config = {
	syntax = {
		template = { 'html' },
		script = { 'typescript' },
		style = { 'css' },
	}
}

vim.g.copilot_filetypes = {
	markdown = false,
	env = false,
	text = false,
}
