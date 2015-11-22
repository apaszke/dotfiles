" Vundle requires this
set nocompatible

set hidden

" enable syntax highlighting
syntax enable
colorscheme monokai

" don't wrap lines
set nowrap

" keep the cursor in the middle of the screen
set scrolloff=15

" tab = 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2

" expand tabs to spaces
set expandtab

" autoindenting
set autoindent
set copyindent
set shiftround

set showmatch

" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" show line numbers
set relativenumber
set nonumber

" highlight current line
set cursorline

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" highlight search terms, but clear on esc
set hlsearch

" show search matches during typing
set incsearch

set history=1000
set undolevels=1000

" ignore files during autocompletion
set wildignore=*.pyc

" change leader key
let mapleader = " "

" change terminal title
set title

" don't use terminal bell
set visualbell
set noerrorbells
set t_vb=

" who needs it?!
set nobackup
set noswapfile

" color 81th column
let &colorcolumn=0
nnoremap <leader>f :call ColorColumnToggle()<CR>
function! ColorColumnToggle()
    if &colorcolumn
        setlocal colorcolumn=0
    else
        setlocal colorcolumn=81
    endif
endfunction

" shortcut for paste mode
nnoremap <leader>p :set paste!<CR>

" show that there are more characters in a long line
set nolist
set listchars=extends:#,precedes:#,tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

set ttimeoutlen=10

" shift+;+w = ;+w
nnoremap ; :

" enable mouse scrolling
set mouse=a

" w!! saves the file with sudo
cmap w!! w !sudo tee % >/dev/null

" Remove trailing whitespace on file save
autocmd BufWritePre * :%s/\s\+$//e

" Don't mess up html files
let html_no_rendering=1

" Open new panes on the right and below
set splitbelow
set splitright

" %% expands into path to current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" open file in current file's directory
map <leader>ew :e %%
map <leader>et :tabe %%

set encoding=utf-8

" disable highlighting after search
map <leader>s :noh<CR>

" :Wrap enables line wrapping
command! -nargs=* Wrap set wrap linebreak nolist

" Set up Vundle
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'

Bundle 'supertab'

Bundle 'bling/vim-airline'

Bundle 'scrooloose/nerdtree'

Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'

Bundle 'scrooloose/nerdcommenter'

Bundle 'wikitopian/hardmode'

Bundle 'easymotion/vim-easymotion'

Bundle 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_left_sep=''
let g:airline_right_sep='◀'
let g:airline_theme='solarized'

" show airline when there is only one tab
set laststatus=2

" ==============================================================================
" NERDTree settings
" ==============================================================================
" open NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

" ==============================================================================
" Markdown settings
" ==============================================================================
let g:vim_markdown_folding_disabled=1

" Relative numbers
" Relative line numbering only in sone cases
function! NumberToggle()
  if &relativenumber
    set number
    set norelativenumber
  else
    set relativenumber
    set nonumber
  endif
endfunc

nnoremap <C-x> :call NumberToggle()<cr>

" Switch to absolute numbers when vim loses focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Switch to absolute numbers when going into insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" ==============================================================================
" Commenter shortcuts
" ==============================================================================
" Ctrl+k toggles comments
map <C-k> <leader>c<space>

" ==============================================================================
" EasyMotion config
" ==============================================================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

nmap t <Plug>(easymotion-s2)


