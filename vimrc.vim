" set shell=bash.exe
filetype off 
" set ffs=dos,unix
set runtimepath+=$HOME/.vim,$HOME/.vim/after
" Vundle and bundles configuration
source $HOME/.vim/bundles.vim

" use ghc functionality for haskell files
" au Bufenter *.hs compiler ghc

" enable filetype detection, plus loading of filetype plugins
filetype plugin on

" configure browser for haskell_doc.vim
"let g:haddock_browser = "C:/Users/dima/AppData/Local/Google/Chrome/Application/chrome.exe"
"let g:haddock_browser = "C:/Program Files/Opera/Opera.exe"
"let g:haddock_browser = "C:/Program Files/Mozilla Firefox/firefox.exe"
"let g:haddock_browser = "C:/Program Files/Internet Explorer/IEXPLORE.exe"
"let g:haddock_docdir = "C:/Program Files (x86)/Haskell Platform/2010.2.0.0/doc" 

"let rap_path = "C:/work/ais-exp"

"au FileType haskell let b:ghc_staticoptions = '-i'.rap_path.' -i'.rap_path.'/resources'
"au FileType haskell setlocal path += rap_path
"au FileType haskell setlocal path += (rap_path.'/resources')
au FileType haskell set encoding=utf-8
"au BufEnter *.hs compiler ghc
let g:haddock_browser = "/usr/bin/chromium-browser"

"hi ghcmodType ctermbg=yellow
"let g:ghcmod_type_highlight = 'ghcmodType'
map <Leader>t :GhcModType<cr>

filetype plugin indent on 

" Molokai color scheme
colorscheme molokai

syntax on
:let mapleader="," 

" Default backspace like normal 
" set bs=2 

"Highlight JSON as python
" au! BufRead,BufNewFile *.json setfiletype python

let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.log$', '\.exe$', '\.o$', '\.hi$', '\.obj$', '\.dll$', '\.lib$']
map <Leader>n <plug>NERDTreeMirrorToggle<CR>
map <Leader>r :NERDTreeFind<CR>
map <Leader>c :NERDTree 

" Default backspace like normal 
set bs=2 

"Highlight JSON as python
au! BufRead,BufNewFile *.json setfiletype python

set encoding=utf-8

set lazyredraw   " Don't redraw while executing macros
set incsearch    " Show search matches as you type
set ignorecase   " Ignore case when searching
set smartcase    " Override 'ignorecase' when needed
set hlsearch     " Highlight search results
set autoindent smartindent
set expandtab
set tabstop=4
set shiftwidth=4

"Clear search highlight on ESC
nnoremap <esc> :GhcModTypeClear<return>:noh<return><esc>

" show the cursor position all the time
" set ruler
" Set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

if has('gui_running')

  " set the gui options to:
  "   g: grey inactive menu items
  "   m: display menu bar
  "   r: display scrollbar on right side of window
  "   b: display scrollbar at bottom of window

  "   t: enable tearoff menus on Win32
  "   T: enable toolbar on Win32
  set go=gmr
  " set guifont=Consolas:h13
  " set guifont=DejaVu\ LGC\ Sans\ Mono\ 12
  set guifont=DejaVu\ Sans\ Mono\ 12
  " set guifont=Courier\ 12
  " au GUIEnter * simalt ~x
endif
" Maximize window on startup

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

imap <silent> <A-Up> <ESC>:wincmd k<CR>
imap <silent> <A-Down> <ESC>:wincmd j<CR>
imap <silent> <A-Left> <ESC>:wincmd h<CR>
imap <silent> <A-Right> <ESC>:wincmd l<CR>

" Work with tabs
" :hi TabLineFill guifg=LightGreen guibg=DarkGreen ctermfg=LightGreen ctermbg=DarkGreen
hi TabLine      guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
hi TabLineSel   guifg=#999 guibg=#333 gui=bold ctermfg=231 ctermbg=235 cterm=bold
hi TabLineFill  guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none

set guitablabel=%N/\ %t\ %M
map    <C-Tab>    :tabnext<CR>
imap   <C-Tab>    <C-O>:tabnext<CR>
map    <C-S-Tab>  :tabprev<CR>
imap   <C-S-Tab>  <C-O>:tabprev<CR>
map    <A-1>      1gt
map    <A-2>      2gt
map    <A-3>      3gt
map    <A-4>      4gt
map    <A-5>      5gt
map    <A-6>      6gt
map    <A-7>      7gt
map    <A-8>      8gt
map    <A-9>      9gt
map    <A-0>      10gt
imap    <A-1>     <C-O>1gt
imap    <A-2>     <C-O>2gt
imap    <A-3>     <C-O>3gt
imap    <A-4>     <C-O>4gt
imap    <A-5>     <C-O>5gt
imap    <A-6>     <C-O>6gt
imap    <A-7>     <C-O>7gt
imap    <A-8>     <C-O>8gt
imap    <A-9>     <C-O>9gt
imap    <A-0>     <C-O>10gt

" Fuzzy search
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_ignoreCase = 1
map <A-F11> :FufMruFile<CR>
imap <A-F11> <C-C>:FufMruFile<CR>
map <A-F12> :FufFileWithCurrentBufferDir<CR>
imap <A-F12> <C-C>:FufFileWithCurrentBufferDir<CR>

" Git
"status
nnoremap <Leader>gs :Gstatus<cr> 
"vimdiff current vs git head (fugitive extension)
nnoremap <Leader>gd :Gdiff<cr> 
"switch back to current file and closes fugitive buffer
nnoremap <Leader>gD :diffoff!<cr><c-w>h:bd<cr>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
source $VIMRUNTIME/mswin.vim
behave mswin
set selectmode=
set textwidth=0
" follow file dir
set autochdir

set keymap=russian-jcukenwin

set iminsert=0

set imsearch=0

highlight lCursor guifg=NONE guibg=Cyan

" setlocal spell spelllang=ru_yo,en_us

" включить сохранение резервных копий
set backup

" сохранять умные резервные копии ежедневно
function! BackupDir()
	" определим каталог для сохранения резервной копии
	let l:backupdir=$HOME.'/.vim/backup/'.
			\substitute(expand('%:p:h'), '^'.$HOME, '~', '')

	" если каталог не существует, создадим его рекурсивно
	if !isdirectory(l:backupdir)
		call mkdir(l:backupdir, 'p', 0700)
	endif

	" переопределим каталог для резервных копий
	let &backupdir=l:backupdir

	" переопределим расширение файла резервной копии
	let &backupext=strftime('~%Y-%m-%d-%H-%M-%S~')
endfunction

" выполним перед записью буффера на диск
autocmd! bufwritepre * call BackupDir()

" setup building for haskell
"  au FileType haskell set makeprg=pushd\ /home/dima/work/ais-exp\;\ ghc\ -i/home/dima/work/ais-exp\:/home/dima/work/ais-exp/resources\ -outputdir\ /home/dima/tmp/ghc-vim\ %\ \;\ popd
au FileType haskell set makeprg=bash\ -f\ vim-ghc.sh\ %
au FileType haskell let b:ghc_staticoptions = '-i/home/dima/work/ais-exp\:/home/dima/work/ais-exp/resources'
map cn :cn<cr>
map cp :cp<cr>
" map cw <esc>:cw<cr>
map <F4> :update<cr>:silent make<cr>
imap <F4> <C-O>:update<cr><C-O>:silent make<cr>
"vmap <F4> <C-C>:update<cr><C-C>:make!<cr><C-C>:cw<cr>
"imap <F4> <C-O>:update<cr><C-O>:make!<cr><C-O>:cw<cr>
autocmd QuickFixCmdPost * :cwindow

" necomplete stuff
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use _no_ smartcase.
let g:neocomplcache_enable_smart_case = 0
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 0
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Disable auto popup
let g:neocomplcache_disable_auto_complete = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Popup on <C-Space>.
      
inoremap <expr><C-Space> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
function! s:check_back_space()"{{{
let col = col('.') - 1
return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}
        
" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

