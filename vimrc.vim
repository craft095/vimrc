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
nnoremap <esc> :noh<return><esc>

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
  set guifont=DejaVu\ LGC\ Sans\ Mono\ 12
  " set guifont=Courier\ 12
  au GUIEnter * simalt ~x
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
au FileType haskell set makeprg=ghc\ -c\ -i~/work/ais-exp\ -i~/work/ais-exp/resource\ %
map cn :cn<cr>
map cp :cp<cr>
" map cw <esc>:cw<cr>
map <F4> :update<cr>:silent make<cr>
"vmap <F4> <C-C>:update<cr><C-C>:make!<cr><C-C>:cw<cr>
"imap <F4> <C-O>:update<cr><C-O>:make!<cr><C-O>:cw<cr>
autocmd QuickFixCmdPost * :cwindow

