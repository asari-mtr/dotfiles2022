" Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run :PlugInstall if don't exists plugin in this machine
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Install plugin
call plug#begin('$HOME/.local/share/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'terryma/vim-multiple-cursors'
Plug 'luochen1990/rainbow'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" for dev icons
set encoding=UTF-8
set guifont=Hack\ Nerd\ Font:h11
let g:airline_powerline_fonts = 1

set autoread
set cursorline
highlight CursorLine guifg=#E19972
set clipboard=unnamed
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noswapfile
set number
set ruler
set scrolloff=5
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set title
set ts=2 sw=2 sts=0
set wrapscan
set nobackup
set hidden
set visualbell
set mouse=a
set clipboard+=unnamed
set virtualedit=all
set inccommand=split

set ttimeoutlen=10

let mapleader = "\<Space>"

" easymotion
nmap s <Plug>(easymotion-w)
nmap S <Plug>(easymotion-b)

" 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Nerd toggle_window
let g:toggle_window_size = 0
function! ToggleWindowSize()
  NERDTreeToggle()
  if g:toggle_window_size == 1
    exec "normal \<C-w>="
    let g:toggle_window_size = 0
  else
    :resize
    :vertical resize
    let g:toggle_window_size = 1
  endif
endfunction
nnoremap <C-w>z :call ToggleWindowSize()<CR>

" gitgutter
let g:gitgutter_highlight_lines = 0
let g:gitgutter_realtime        = 1
let g:gitgutter_eager           = 1

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
  \  'ctermfgs': ['blue', 'yellow', 'red', 'green', 'magenta', 'cyan']
\}
