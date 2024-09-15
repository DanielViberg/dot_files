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
	print('Done')
end
vim.opt.rtp:prepend(lazypath)

local config = os.getenv("NVIM_CONFIG")
if config == nil then
	print("NVIM_CONFIG not set")
	return
end
package.path = package.path .. ";" .. config .. "/?.lua"

require("plugins")
require("options")
require("lsp")
require("remaps")
require("autocmd")
require("colors")
