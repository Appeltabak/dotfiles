call plug#begin('~/.vim/plugged')

" Fuzzy file, buffer. finder 
Plug  'ctrlpvim/ctrlp.vim'

" Syntax highlighting for Dockerfiles
" FIXME 
"Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" Vim plugin for intensely orgasmic commenting.
Plug 'scrooloose/nerdcommenter'

" Go development plugin for Vim.
Plug 'fatih/vim-go'

call plug#end()

set nocompatible
set number

" Syntax highlighting
syntax enable
set background=dark
"colorscheme solarized

" Enable plugins
filetype plugin on

" Disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Map Leader to space bar
let mapleader = "\<Space>"

" Disable swap files.
set nobackup
set nowb
set noswapfile

"#
"# ctrlpvim/ctrlp.vim
"#

" Open Ctrl-P withe leader-p.
let g:ctrlp_map = '<leader>p'

" Move line up or down with CTRL-K and CTRL-J
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
