" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
set runtimepath=$VIMRUNTIME,$HOME/.vim,$HOME/.vim/after
"set runtimepath=$VIM/vimfiles,$VIMRUNTIME,$HOME/.vim,$HOME/.vim/after
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

set t_Co=256
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on
if filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim")) && !has("gui_running")
  runtime! plugin/guicolorscheme.vim
  GuiColorScheme darkspectrum
else
  colorscheme darkspectrum
endif
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase  " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite   " Automatically save before commands like :next and :make
set hidden      " Hide buffers when they are abandoned
set expandtab   " Replace tabs with spaces
set tabstop=2   " Set default tab width to 2 spaces
set shiftwidth=2
set nu          " Number Lines
set foldcolumn=2 " Show fold detail column, 2 chars wide.
filetype on
filetype plugin on

au FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1
" Don't show variable in the taglist plugin for php files.
let tlist_php_settings = 'php;c:class;d:constant;f:function'

syntax enable

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabMidWordCompletion = "off"


"set mouse=a    " Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

map <F2> :setlocal spell! spelllang=en_us<CR>
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window   = 1

map <F4> :NERDTreeToggle<CR>
nmap <tab> gt
nmap <S-tab> gT

noremap <F5> <Esc>:syntax sync fromstart<CR>
inoremap <F5> <C-o>:syntax sync fromstart<CR>

inoremap <F1> <Esc>
noremap <F1> :call MapF1()<CR>

function! MapF1()
  if &buftype == "help"
    exec 'quit'
  else
    exec 'help'
  endif
endfunction

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

inoremap jj <ESC>
nnoremap ; :
nnoremap <f6> :!ctags -R<cr>
