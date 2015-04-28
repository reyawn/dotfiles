set mouse=a

" Relative number mode toggling on enter/leave insert mode
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

set t_Co=256

set tabstop=2 shiftwidth=2 expandtab

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'
Plugin 'moll/vim-node'
Plugin 'othree/yajs.vim'
Plugin 'L9'
Plugin 'zenburn'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax highlighting
syntax on

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Use zenburn colorscheme (BundleInstall first for this to work)
colorscheme zenburn

" NERDTree setup
" Map to Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Open automatically when VIM starts up and no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

