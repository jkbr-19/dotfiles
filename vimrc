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
"Plug 'sirosen/vim-rockstar'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'flazz/vim-colorschemes'
Plug 'jvirtanen/vim-octave'
call plug#end()

"Plugin config
let g:vimtex_compiler_enabled = 0

"Netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

"clipboard
"set clipboard=unnamedplus

"Autobrackets
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>

"if has('syntax') && has('eval')
"  packadd! matchit
"endif
let $BASH_ENV = "~/.bash_aliases"
set number relativenumber
set nohlsearch
set ruler
set backupdir=~/.vimtmp//
set directory=~/.vimtmp//

"Compiling and such
let extension = expand('%:e')
let file_name = expand('%:t:r')
"complete path with filename
let file_path = expand('%:p')

colorscheme mopkai
"some cool colorthemes to try
"chance of storm
"

if extension == "tex"
	map <F5> :w <CR>:!pdflatex --output-directory=$(pwd \| sed 's:$:/build/:') %<CR>
	map <F6> :te zathura $(echo build/% \| sed 's/tex$/pdf/')<CR><CR><C-^>
	inoremap _ _{}<Left>
	inoremap ^ ^{}<Left>
	inoremap $ $$<Left>
	colorscheme flattened_dark

elseif extension == "cpp"
	map <F5> :w <CR>:!make $(echo % \| sed 's/.cpp$//')<CR>
	map <F6> :!./$(echo % \| sed 's/.cpp$//')<CR>

elseif extension == "c"
	map <F5> :w <CR>:!make $(echo % \| sed 's/.c$//')<CR>
	map <F6> :!./$(echo % \| sed 's/.c$//')<CR>

elseif extension == "py"
	map <F5> :w <CR>:te python3 %<CR>i

elseif extension == "md"
	let g:vim_markdown_math = 1
	map <F5> :w <CR>:!pandoc % -s -V geometry:a4paper -o $(echo % \| sed 's/.md$/.pdf/')<CR><CR>
	map <F6> :te zathura $(echo % \| sed 's/.md$/.pdf/')<CR><CR><C-^>
	inoremap _ _{}<Left>
	inoremap ^ ^{}<Left>
	inoremap $ $$<Left>
	colorscheme flattened_dark

elseif extension == 'm'
	map <F5> :w <CR>:te octave %<CR>i
	colorscheme cobalt

endif
"
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
