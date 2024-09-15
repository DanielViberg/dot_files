vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-right>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-z>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'r', '<C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>', '/', { noremap = true })
vim.api.nvim_set_keymap('n', '<ESC>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Execute buffer with bb
vim.api.nvim_set_keymap('c', 'bb', 'b#', { noremap = true })
vim.api.nvim_set_keymap('c', 'Bb', 'b#', { noremap = true })
vim.api.nvim_set_keymap('c', 'BB', 'b#', { noremap = true })

-- Corrections
vim.cmd('abb W w')
vim.cmd('abb Q q')

-- Search word under cursor
vim.cmd('abb fa FindAll')
vim.cmd('abb Fa FindAll')
vim.cmd('abb fA FindAll')
vim.cmd('abb FA FindAll')
vim.api.nvim_create_user_command('FindAll',
	function()
		local word = vim.fn.expand('<cword>')
		vim.cmd('/' .. word)
	end, {})

-- Tab navigation
vim.api.nvim_set_keymap('n', '<PageUp>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<PageDown>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-down>', ':tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-up>', ':tabnew<CR>', { noremap = true, silent = true })

-- Tab navigation in terminal mode
vim.api.nvim_set_keymap('t', '<PageUp>', '<C-\\><C-n>:tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<PageDown>', '<C-\\><C-n>:tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-down>', '<C-\\><C-n>:tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-up>', '<C-\\><C-n>:tabnew<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<C-F>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-F>', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Explorer
vim.api.nvim_set_keymap('n', '<C-B>', ':50Vex<CR>', { noremap = true, silent = true })

-- Sudo write
vim.api.nvim_set_keymap('c', 'w!!', 'w !sudo tee % > /dev/null', { noremap = true })

-- Wild menu
vim.api.nvim_set_keymap('c', '<Down>', '<C-n>', { noremap = true })
vim.api.nvim_set_keymap('c', '<Up>', '<C-p>', { noremap = true })

-- Command remaps
-- In command mode, but never in search mode, make new be vnew	
vim.cmd('cnoreabbrev new vnew')
vim.cmd('abb ter hor ter')

-- Auto pair
vim.cmd('inoremap {<cr> {<cr>}<ESC>kA<C-m>')
vim.cmd('inoremap (<cr> (<cr>)<ESC>kA<C-m>')
vim.cmd('inoremap [<cr> [<cr>]<ESC>kA<C-m>')
vim.cmd(
	'inoremap ><cr> ><ESC>^l:let tagName=expand(\'<cword>\')<cr>:put =\'</\' .. tagName .. \'>\'<cr>i<BS><C-m><ESC>kA<C-m>')
