-- autocmd for VimResize
vim.cmd [[
	autocmd VimResized * :wincmd =
]]

--when using term automatically go into insert mode
vim.cmd([[
	autocmd TermOpen * startinsert
]])

-- auto format on save
vim.cmd([[
	autocmd BufWritePre * lua vim.lsp.buf.format()
]])
