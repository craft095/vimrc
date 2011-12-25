" set shell=cmd.exe
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'git://github.com/tpope/vim-fugitive'
Bundle 'git://github.com/scrooloose/nerdtree'
Bundle 'git://github.com/jistr/vim-nerdtree-tabs'
" Bundle 'Lokaltog/vim-easymotion'

Bundle 'git://github.com/tyru/fencview.vim'

Bundle 'git://github.com/vim-scripts/L9.git'
Bundle 'git://github.com/vim-scripts/FuzzyFinder.git'
Bundle 'git://github.com/vim-scripts/molokai.git'
Bundle 'git://github.com/vim-scripts/Rainbow-Parenthsis-Bundle.git'
" Bundle 'git://github.com/frerich/unicode-haskell.git'
"
" Bundle 'git://github.com/urso/dotrc.git', {'rtp': 'vim/syntax/haskell.vim'}
" Bundle 'rails.vim'
" non github repos

" Command-T requires VIM to be build with ruby support, but 7.3 has a bug
" about it
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
