set nocompatible        " use vim defaults
set showcmd             " show the command being typed
set t_Co=256
set mouse=a
set ls=2
set encoding=utf-8

let mapleader=","
let maplocalleader=","

filetype off            " required (for vundle?)

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" file browser 
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'

call vundle#end()

syntax enable
set background=dark
colorscheme bubblegum
syntax on
filetype plugin indent on   " load filetype plugins and indent settings
set number                  " yay line number
set ruler                   " current position at bottom
set noerrorbells            " whine off
set visualbell t_vb=        " don't make faces
set scrolloff=5             " keep at least 5 lines arounf the cursor

"--- Text editing and searching behavior ---"

set hlsearch              " turn off hilighting for searched expressions
set incsearch               " hilight as we search however
set showmatch               " show matching brackets
set smartcase

"--- Indent and tabs ---"

set autoindent              " set the cursor at the same indent as line above
set smartindent             " try to be smart about indenting (C-style)
set expandtab               " expand <Tab>s with spaces; kill  tabs!

" Don't break up long lines but visually wrap them
set textwidth=0
set wrap

set cursorline              " Hilight current line
set cursorcolumn            " Hilight current column

" To save, ctrl-s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
imap <c-s> <Esc><c-s>

" more natural split opening
" set splitbelow
" set splitright
imap <C-w> <C-o><C-w>

" MiniBuffer Mapping
noremap <C-Down>    <C-W>j
noremap <C-Up>      <C-W>k
noremap <C-Left>    <C-W>h
noremap <C-Right>   <C-W>l
noremap <C-TAB>     :MBEbn<CR>
noremap <C-S-TAB>   :MBEbp<CR>

" Easier split window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabcloce<cr>
map <leader>tm :tabmove

" open a new tab with the current buffer's path
" super useful when editing filen in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" remember info about open buffers on close
set viminfo^=%

" open nerdtree with Ctrl + n
map <C-n> :NERDTreeToggle<CR>

" open nerdTree automatically on vim startup
autocmd vimenter * NERDTree
" Open nerdTree automatically at startup if no file is specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if NerdTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"
" Taglist settings.
nnoremap <silent> <F8> :TlistToggle<CR>

let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1

" sudo to write
cmap w!! w !sudo tee % >/dev/null
" fast saving
nmap <leader>w :w!<cr>

set shiftwidth=4            " spaces for each step of (auto)indent
set softtabstop=4           " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8               " for proper display of files with tabs
set shiftround              " always round indents to multiple of shiftwidth
set copyindent              " use existing indents for new indents
set preserveindent          " save as much indent structure as possible
