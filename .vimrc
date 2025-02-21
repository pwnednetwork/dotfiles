set nocompatible              " be iMproved, required
filetype off                  " required
syntax on 

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" be able to call sudo from vim 
cnoremap w!! w !sudo tee > /dev/null %

" turn jk into ESC
inoremap jk <ESC>


" ┌────────────────────────────────────────┐
" │                                        │
" │                                        │
" │   Vundle                               │


    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    
    " NERDTree
    Plugin 'preservim/nerdtree'
   
   " vim-devicons 
    Plugin 'ryanoasis/vim-devicons'

    " color schemes
    Plugin 'morhetz/gruvbox'
    Plugin 'lunacookies/vim-colors-xcode'
    Plugin 'flazz/vim-colorschemes'

    call vundle#end()            " required

" └────────────────────────────────────────┘

filetype plugin indent on    " required

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


colorscheme molokai_dark
