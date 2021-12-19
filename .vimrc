" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

"------------------
" Syntax and indent
"------------------
" turn on syntax highlighting
syntax on

" auto indent
set autoindent 
" tab size is 4 space
set tabstop=4 
" use UTF-8 encoding
set encoding=UTF-8 

" colorscheme
colorscheme janah

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
     autocmd!
     autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
     autocmd WinLeave * setlocal nocursorline
augroup END

filetype plugin indent on " enable file type detection

"---------------------
" Basic editing config
"---------------------

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" show matching braces when text indicator is over them
set showmatch 

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
" Enable highlight search
set incsearch
set hlsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop>  " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

"---------------------
" Key bindings
"---------------------

let mapleader=","

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

"---------------------
" Cmdline & statusline
"---------------------
" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Show partial command you type in the last line of the screen.
set showcmd

" cmd line completion
set wildmenu 

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ %Y\ row:\ %l\ col:\ %c\ percent:\ %p%%

"---------------------
" Plug setup
"---------------------
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify' 
Plug 'tpope/vim-fugitive' 
Plug 'lfv89/vim-interestingwords'
Plug 'scrooloose/nerdtree'
Plug 'preservim/tagbar'

call plug#end()

" plugin setup

" NERDTree-------------------------------------------------------
nnoremap <C-t> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" vim-startify---------------------------------------------------
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]

" tagbar---------------------------------------------------------
nnoremap <F8> :TagbarToggle<CR>
