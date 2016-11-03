call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'delimitMate.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'nathanielc/vim-tickscript'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'

call plug#end()

syntax on
filetype plugin indent on
set number

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Enable syntax highlighting
syntax enable
set background=dark
colorscheme solarized
set t_Co=16

" Disable arrow keys
noremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable swap files
set nobackup
set nowb
set noswapfile

" Leave insert mode by pressing 'jj'
imap jj <ESC>

" Save file in normal mode by pressing Enter
nnoremap <CR> :w<CR>

" Wrap line when it exceeds textwidth.
let mapleader = "\<Space>"

" Open Ctrl-P to search in open buffers.
let g:ctrlp_map = '<leader>p'

" Disable default keybindings.
let g:EasyMotion_do_mapping = 0

" Map two charachter to <leader>-s
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Use EasyMotion when searching with /
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.  Without these mappings, `n` & `N` works fine. (These mappings
" just provide different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


" Moving (block of) lines around with Ctrl-j and Ctrl-k. Learned from
" http://reefpoints.dockyard.com/2013/09/26/vim-moving-lines-aint-hard.html
 nnoremap <C-j> :m .+1<CR>==
 nnoremap <C-k> :m .-2<CR>==


 " Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
