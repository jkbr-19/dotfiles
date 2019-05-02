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
"Plug 'dmix/elvish.vim', { 'on_ft': ['elvish']}
Plug 'plasticboy/vim-markdown'
Plug 'flazz/vim-colorschemes'
Plug 'jvirtanen/vim-octave'
Plug 'lervag/vimtex'
call plug#end()


"Plugin config
let g:vimtex_compiler_enabled = 0


"Netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete


"clipboard
"set clipboard=unnamedplus

"Autobrackets
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>

"some visual settings
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set number relativenumber
set hlsearch

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

autocmd BufEnter *.tex call SetTexOption()
function SetTexOption()
	map <A-CR> :w <CR>:!pdflatex --output-directory=$(pwd \| sed 's:$:/build/:') %<CR>
	map <F6> :te zathura $(echo build/% \| sed 's/tex$/pdf/')<CR><CR><C-^>
	inoremap _ _{}<Left>
	inoremap ^ ^{}<Left>
	inoremap $ $$<Left>
	colorscheme flattened_dark
endfunction

autocmd BufEnter *.cpp call SetCppOption()
function SetCppOption()
	map <A-CR> :w <CR>:!make $(echo % \| sed 's/.cpp$//')<CR>
	map <F6> :!./$(echo % \| sed 's/.cpp$//')<CR>
endfunction

autocmd BufEnter *.c call SetCOption()
function SetCOption()
	map <A-CR> :w <CR>:!make $(echo % \| sed 's/.c$//')<CR>
	map <F6> :!./$(echo % \| sed 's/.c$//')<CR>
endfunction

autocmd BufEnter *.py nested call SetPyOption()
function SetPyOption()
	map <A-CR> :w<CR>:belowright split term://python3 -i %<CR>:resize 17<CR>i
endfunction

autocmd BufEnter *.m call SetOctOption()
function SetOctOption()
	map <A-CR> :w<CR>:belowright split term://octave --persist -q %<CR>:resize 17<CR>i
	colorscheme cobalt
endfunction

autocmd BufEnter *.md call SetMdOption()
function SetMdOption()
	let g:tex_conceal = ""
	let g:vim_markdown_math = 1
	map <A-CR> :w <CR>:!pandoc % -s -V geometry:a4paper -o $(echo % \| sed 's/.md$/.pdf/')<CR><CR>
	map <F6> :te zathura $(echo % \| sed 's/.md$/.pdf/')<CR><CR><C-^>
	inoremap _ _{}<Left>
	inoremap ^ ^{}<Left>
	inoremap $ $$<Left>
	colorscheme flattened_dark
endfunction

"some key mappings
let mapleader = " "
let maplocalleader = " "
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"window movement
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

"Terminal Buffer
tnoremap <Esc> <C-\><C-n>

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"Python Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set fileformat=unix
    
set encoding=utf-8
set termguicolors

"a paar tests mit autocmds
