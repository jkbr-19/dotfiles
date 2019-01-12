"vim-plug
"des is für den Pluginmanager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif"

call plug#begin('~/.vim/plugged')
"Liste von Plugins
Plug 'davidhalter/jedi-vim'
Plug 'sirosen/vim-rockstar'
Plug 'lervag/vimtex'
call plug#end()

"Plugin config
let g:vimtex_compiler_enabled = 0

"clipboard
set clipboard+=unnamedplus

"if has('syntax') && has('eval')
"  packadd! matchit
"endif
let $BASH_ENV = "~/.bash_aliases"
set number relativenumber
set nohlsearch
set ruler
set backupdir=~/.vimtmp//
set directory=~/.vimtmp//

"Comüiling and such
let extension = expand('%:e')
let file_name = expand('%:t:r')
"complete path with filename
let file_path = expand('%:p')

if extension == "tex"
	map <F5> :w <CR>:!pdflatex --output-directory=$(pwd \| sed 's:$:/build/:') %<CR><CR>
	map <F6> :te qpdfview --unique $(echo build/% \| sed 's/tex$/pdf/')<CR><CR><C-^>
elseif extension == "cpp"
	"map <F5> :!make $(echo file_name \| make <CR>
	map <F5> :w <CR>:!make $(echo % \| sed 's/.cpp$//')<CR>
	"map <F6> :!./file_name<CR>
	map <F6> :!./$(echo % \| sed 's/.cpp$//')<CR>
endif
"some leader mappings
let mapleader = " "
let maplocalleader = " "
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
""nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"Python Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set fileformat=unix
    
set encoding=utf-8
set termguicolors
colorscheme flattened_dark
