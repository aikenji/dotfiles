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

set noswapfile

"------------------
" Syntax and indent
"------------------
" turn on syntax highlighting
syntax on

" auto indent
set autoindent 
" tab size is 4 space
set tabstop=4 
set noexpandtab " overwritten in .py file

" display the indent line
set list lcs=tab:\|\  
" when indenting with endter use 4 spaces width
set shiftwidth=4
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

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
" set mouse+=a

" Enable external clipboard 
set clipboard=unnamed 

"---------------------
" Key bindings
"---------------------

" Unbind some useless/annoying default key bindings.
nmap Q <Nop>  " 'Q' in normal mode enters Ex mode. You almost never want this.
nnoremap <esc><esc> :noh<CR><esc>  " key bindings for :nohlsearch
let mapleader=" "

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
set statusline+=\ %Y\ \ %l:\ %c\ \ %p%%\ %{kite#statusline()}

"---------------------
" File type options
"---------------------
augroup python
    " ftype/python.vim overwrites this
    autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
augroup end

"---------------------
" Plug setup
"---------------------
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-peekaboo'
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'mhinz/vim-startify' 
Plug 'tpope/vim-fugitive' 
Plug 'scrooloose/nerdtree'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Yggdroot/LeaderF' 
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dense-analysis/ale'

call plug#end()

" plugin setup

" NERDTree-------------------------------------------------------
nnoremap <F9> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" vim-startify---------------------------------------------------
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]

" tagbar---------------------------------------------------------
nnoremap <F8> :TagbarToggle<CR>

" gutentags------------------------------------------------------

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" LeaderF--------------------------------------------------------
"
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_WindowPosition = 'popup' " cmd line in popup window
let g:Lf_PreviewInPopup = 0 " use popup window to preview
let g:Lf_ShowDevIcons = 0
let g:Lf_ShortcutF = '<C-P>'
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>ff :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


" vim-cpp-enhanced-highlight-------------------------------------------
" Highlighting of class scope is disabled by default. To enable set

let g:cpp_class_scope_highlight = 1
" Highlighting of member variables is disabled by default. To enable set

let g:cpp_member_variable_highlight = 1
" Highlighting of class names in declarations is disabled by default. To enable set

let g:cpp_class_decl_highlight = 1
" Highlighting of POSIX functions is disabled by default. To enable set

let g:cpp_posix_standard = 1
" There are two ways to highlight template functions. Either

let g:cpp_experimental_simple_template_highlight = 1
" which works in most cases, but can be a little slow on large files. Alternatively set

let g:cpp_experimental_template_highlight = 1
" which is a faster implementation but has some corner cases where it doesn't work.

" Note: C++ template syntax is notoriously difficult to parse, so don't expect this feature to be perfect.

" Highlighting of library concepts is enabled by

let g:cpp_concepts_highlight = 1
" This will highlight the keywords concept and requires as well as all named requirements (like DefaultConstructible) in the standard library.

" Highlighting of user defined functions can be disabled by

let g:cpp_no_function_highlight = 1

" Kite------------------------------------------------------------------

let g:kite_supported_languages = ['*'] 
