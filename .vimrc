set mouse=a

" Relative number mode toggling on enter/leave insert mode
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

set t_Co=256
set encoding=utf8

set tabstop=2 shiftwidth=2 expandtab
set laststatus=2
set showtabline=2
set noshowmode

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'drn/zoomwin-vim'
Plug 'moll/vim-node'
Plug 'othree/yajs.vim'
Plug 'jnurmine/Zenburn'
Plug 'ryanoasis/vim-webdevicons'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
call plug#end()

call deoplete#custom#option('sources', {
  \ '_': ['ale'],
\})

" Use zenburn colorscheme (PlugInstall first for this to work)
colorscheme zenburn

" NERDTree setup
" Map to Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Open automatically when VIM starts up and no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim-session Don't prompt to save sessions
:let g:session_autosave = 'no'

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Devicons
let g:airline_powerline_fonts = 1

" Airline
let g:airline#extensions#tabline#enabled = 1

" File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" FZF setup
" let g:fzf_command_prefix = 'Fzf'
