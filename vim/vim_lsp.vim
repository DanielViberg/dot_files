vim9script
# Snippets
# Add snippets :UltiSnipsEdit
var snippetDir = $VIM_CONFIG .. "/snippets"
g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = snippetDir 
g:UltiSnipsSnippetDirectories = [snippetDir]
g:UltiSnipsExpandTrigger = "<c-m>" 
g:UltiSnipsJumpForwardTrigger = "<s-tab>"

#Lsp
nnoremap <silent> <C-m> :LspGotoDefinition<CR>
cnoreabbrev ra LspRename
cnoreabbrev fr LspPeekReferences  
cnoreabbrev gd LspHover

if has('win32')
  autocmd! BufWritePre * silent :LspFormat | silent! :%s/\r\(\n\)/\1/g
else
  autocmd! BufWritePre * silent :LspFormat
endif

#Options
var lspOpts = {
  autoHighlight: true,
  omniComplete: true,
  useBufferCompletion: true,
  snippetSupport: true, # Onlt because html lsp needs it
  ultisnipsSupport: false,
  showDiagWithVirtualText: true,
  diagVirtualTextAlign: 'after',
  showDiagOnStatusLine: true,
  showInlayHints: true,
  noNewlineInCompletion: true,
  outlineOnRight: true,
  ignoreMissingServer: true, 
  highlightDiagInline: true,
  showDiagWithSign: true,
  diagSignErrorText: "E:",
  diagSignInfoText: "I:",
  diagSignHintText: "H:",
  diagSignWarningText: "W:",
  filterCompletionDuplicates: true,
}

autocmd VimEnter * call LspOptionsSet(lspOpts)

# Higlight pum options
augroup LspSetup
  au!
  au User LspAttached set completeopt-=noselect
augroup END

# npm i -g vim-language-server
# npm i -g intelephense
# npm i -g @vue/language-server
# npm i -g typescript
# npm i -g vscode-json-languageserver
# npm i -g bash-language-server
# npm i -g vscode-html-language-server
# sudo snap install marksman 
# sudo apt install clangd

var file = $VIM_CONFIG .. '/lsp-config.json'
var config = json_decode(join(readfile(file), "\n"))

# Set license
for server in config.servers
  if has_key(server, 'path')
    if server.path == 'intelephense'
      server.initializationOptions.licenseKey = $INTELEPHENSE_LIC
    endif
  endif
endfor

autocmd VimEnter * call LspAddServer(config.servers)

