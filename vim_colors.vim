vim9script

autocmd ColorScheme rosepine hi LspDiagVirtualTextError guifg=#EB6F92 guibg=NONE gui=NONE cterm=NONE
autocmd ColorScheme rosepine hi LspDiagVirtualTextWarning guifg=#31748F guibg=NONE gui=NONE cterm=NONE
autocmd ColorScheme rosepine hi LspDiagVirtualTextHint guifg=#31748F guibg=NONE gui=NONE cterm=NONE
autocmd ColorScheme rosepine hi LspDiagVirtualTextInfo guifg=#31748F guibg=NONE gui=NONE cterm=NONE

autocmd ColorScheme rosepine hi LspDiagSignErrorText guifg=#EB6F92 guibg=NONE gui=NONE cterm=NONE
autocmd ColorScheme rosepine hi LspDiagSignHintText guifg=#31748F guibg=NONE

autocmd ColorScheme rosepine hi LspDiagInlineError guibg=#EB6F92 guifg=black 
autocmd ColorScheme rosepine hi LspDiagInlineWarning guibg=#31748F guifg=black
autocmd ColorScheme rosepine hi LspDiagInlineHint guibg=#31748F guifg=black
autocmd ColorScheme rosepine hi LspDiagInlineInfo guibg=#9CCFD8 guifg=black

autocmd ColorScheme rosepine hi StatusLineNC guibg=#1F1D2E

g:terminal_ansi_colors = [
   '#282c34', '#EB6F92', '#31748F', '#F6C177', '#9CCFD8', '#C4A7E7', '#EBBCBA', '#E0DEF4',
   '#282c34', '#EB6F92', '#31748F', '#F6C177', '#9CCFD8', '#C4A7E7', '#EBBCBA', '#E0DEF4'
]

g:disable_bg = 1

colorscheme rosepine
set termguicolors

# Vue
g:vim_vue_plugin_config = { 
 syntax: {
 template: ['html'],
 script: ['typescript'],
 style: ['css'],
 },
}
