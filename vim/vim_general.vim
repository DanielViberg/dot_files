vim9script 

set number
set undofile
set autoread
set incsearch
set relativenumber
set wildmenu
set smartindent
set expandtab
set nowrap
set ttimeout
set smartcase
set hlsearch!
set splitright
set splitbelow
set exrc

set belloff=all
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ttimeoutlen=0
set colorcolumn=100
set wildmode=longest:full
set wildoptions=pum
set scrolloff=10
set backspace=indent,eol,start
set termwinscroll=1000
set pumheight=20

filetype plugin on

# Remap
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <Esc> :noh<CR>
nnoremap <silent> <S-up> <Nop>
nnoremap <silent> <S-down> <Nop>
vnoremap <silent> <S-up> <Up>
vnoremap <silent> <S-down> <Down>
nnoremap <silent> <C-right> <Nop>
nnoremap <silent> <C-left> <Nop>

# Autopairs
inoremap {<cr> {<cr>}<ESC>kA<C-m> 
inoremap (<cr> (<cr>)<ESC>kA<C-m> 
inoremap [<cr> [<cr>]<ESC>kA<C-m>
inoremap ><cr> ><ESC>^l:let tagName=expand('<cword>')<cr>:put ='</' .. tagName .. '>'<cr>i<BS><C-m><ESC>kA<C-m>

noremap <silent> <C-z> <nop>
nnoremap r <C-r>
cabbrev W w
cabbrev Q q
nnoremap <Space> /

# Cursor
if !has('win32')
  au VimEnter * silent execute "!echo -ne '\e[1 q'"
  au InsertEnter * silent execute "!echo -ne '\e[5 q'"
  au InsertLeave * silent execute "!echo -ne '\e[1 q'"
endif

# Statusline
set laststatus=2
g:tene_glyphs     = 0
g:tene_file_tail  = 0
g:tene_unicode    = 0
g:tene_path       = 0
g:tene_buffer_num = 0
g:tene_window_num = 0
g:tene_ga = {}
g:tene_ga["line()"] = ['', '']

# :fa - find all occurances of word under cursor
silent command! FindAll execute 'normal! /' .. expand('<cword>') .. "\<CR>"
cnoreabbrev fa FindAll
cnoreabbrev Fa FindAll
cnoreabbrev fA FindAll
cnoreabbrev FA FindAll

# :yt - yank this word
nnoremap yt yaw

# Windows
cabbrev new vnew
autocmd VimResized * silent execute 'horizontal wincmd ='  

# Tabs
nnoremap <silent> <PageUp> :tabprevious<CR>
nnoremap <silent> <PageDown> :tabnext<CR>
nnoremap <silent> <C-down> :tabclose<CR>
nnoremap <silent> <C-up> :tabnew<CR>
tnoremap <silent> <expr> <PageUp> "<C-\><C-n>:tabprevious \<CR>"
tnoremap <silent> <expr> <PageDown> "<C-\><C-n>:tabnext \<CR>"
tnoremap <silent> <expr> <C-down> "<C-\><C-n>:q! \<CR>"
tnoremap <silent> <expr> <C-up> "<C-\><C-n>:tabnew \<CR>"

# md preview
g:mkdp_filetypes  = ['markdown']
g:mkdp_page_title = '${name}'
g:mkdp_theme      = 'dark'

# Buffer
command! BufferBack :execute # b##  
cnoreabbrev bb edit #
cnoreabbrev Bb edit #
cnoreabbrev bB edit #
cnoreabbrev BB edit #

# Fuzzy
g:fuzzyy_files_ignore_dir = ['.git', 'node_modules', 'vendor', 'docker']
if has('win32')
  g:files_only_git_files = true
endif
nnoremap <silent> <C-F> :FuzzyFiles<CR>
nnoremap <silent> <S-F> :FuzzyGrep<CR>
cnoreabbr <silent> bf :FuzzyBuffers

# Explorer
g:netrw_liststyle  = 1
g:netrw_banner     = 0
g:netrw_localrmdir = 'rm -r'
g:netrw_sort_by    = 'exten'
nnoremap <silent> <C-b> :50Vex<cr>

# Sudo
cmap w!! w !sudo tee > /dev/null %

# Easy jump
g:easyjump_default_keymap = false
g:easyjump_case           = 'icase'
g:easyjump_letters        = 'asdfgwercvhjkluiopynmbtqxz0123456789'
nmap f <Plug>EasyjumpJump;
omap f <Plug>EasyjumpJump;
vmap f <Plug>EasyjumpJump;

# Doc
cnoreabbr <silent> df :DevdocsFind
cnoreabbr <silent> di :DevdocsInstall
cnoreabbr <silent> du :DevdocsUninstall

# Copilot
g:copilot_filetypes = {
  'markdown': false,
  'env':      false,
  'text':     false,
}

# EasyAlign
xmap ea <Plug>(EasyAlign)

# Clipboarde
if has('unix')
 autocmd TextYankPost * call job_start('wl-copy ' .. getreg('0'))
 nnoremap <silent> cp :r !wl-paste<CR>
endif

# Workspace
def MkWFolder(dir: string): void
  if !isdirectory(dir)
    call mkdir(dir, "p", 0o700)
  endif
enddef

MkWFolder($HOME .. "/.vim/ses/")

g:workspace_autosave                = 0
g:workspace_persist_undo_history    = 0
g:workspace_session_directory       = $HOME .. "/.vim/ses/"
g:workspace_session_disable_on_args = 1

# Set custome dir for .backup .swp .undo
var backupDir = $HOME .. "/.vim/backup"
var swpDir    = $HOME .. "/.vim/swp"
var undoDir   = $HOME .. "/.vim/undo"

MkWFolder(backupDir)
MkWFolder(swpDir)
MkWFolder(undoDir)

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undo//
