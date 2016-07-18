" COMPILED WITH ./configure --with-features=huge --enable-cscope --enable-gui=auto --enable-rubyinterp --enable-pythoninterp
set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/sh

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Powerline setup
set laststatus=2
set term=xterm-256color
set termencoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
" set guifont=Ubuntu\ Mono
let g:Powerline_symbols = 'fancy'

" EDITOR
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'othree/html5.vim'

" INTEGRATION CONSOLE FILESYSTEM
Plugin 'scrooloose/nerdtree' 
Plugin 'Xuyuanp/nerdtree-git-plugin' 

Plugin 'ctrlpvim/ctrlp.vim'

" Miscellanea
Plugin 'tpope/vim-bundler'
Plugin 'benmills/vimux'
Plugin 'airblade/vim-gitgutter'

" Dev Tools
Plugin 'skalnik/vim-vroom'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup


" DRAW COLUMN AT 80 character column and set no wrap
set fo+=o                      
set fo-=r                     
set fo-=t                      " Do no auto-wrap text using textwidth (does not apply to comments)
set nowrap
set textwidth=0
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")

" Mouse
" set ttyfast
" let g:NERDTreeMouseMode=3 

" Enable mouse use in all modes
" set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
"set ttymouse=xterm2

" ENABLE SCROLL AFTER reach border
set scrolloff=5         "Start scrolling when we're 8 lines away from margins       
set sidescrolloff=15                                                                
set sidescroll=1
set cursorline!

nnoremap <leader>sv :source $MYVIMRC<CR>

" THEME  && EDITING
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set hidden                        " Handle multiple buffers better.

syntax on                         " enable syntax highlighting
set number                        " line numbers on
set relativenumber!               " Relative number for default
set ruler                         " show the cursor position all the time
set visualbell                    " no beeping
set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set autoindent                    " always set autoindenting on
let mapleader=","                 " change mapleader key

" Use space instead of tabs
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase 
nmap <silent> ,/ :nohlsearch<CR>

" Backups and swap files
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup
set noswapfile 

" TEST VROOM
let g:vroom_spec_command = "bundle exec rspec "
let g:vroom_use_bundle_exec = 0
let g:vroom_use_vimux = 1
let g:vroom_test_unit_command = "test"
let g:VimuxOrientation = "h"
let g:vroom_cucumber_path = '`([ -e .zeus.sock ] && echo zeus) || echo bundle exec` cucumber -r features '

map <leader>R :VroomRunTestFile<cr>
map <leader>r :VroomRunNearestTest<cr>

" SHORTCUT
noremap  <Up> ""
noremap  <Down> ""
noremap  <Left> ""
noremap  <Right> ""
map <F2> :NERDTreeToggle<CR>
map <F4> :mksession! ~/vim_session <cr>
map <F5> :source ~/vim_session <cr>
map <F7> :GitGutterToggle<CR>
map <F6> :set nonu!<CR>
" nmap <F8> :TagbarToggle<CR>
set pastetoggle=<F10>
map <F11> gg=G " Indent file


" Copy to system clipboard
map <leader>y "*y
" Paste from system clipboard
map <leader>p "*p


" Modify vimrc on the fly
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>vr :source $MYVIMRC<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Protractor map keys
function RunProtractor()
 if match(expand("%"), '_spec\.js$') != -1
   execute "VimuxRunCommand 'cd frontend && grunt e2e --specs ../'.bufname('%').'; cd -'"
 else
   execute "VimuxRunLastCommand"
 endif
endfunction
autocmd FileType javascript map <leader>r :call RunProtractor()<cr>

set updatetime=1000

map <C-n> :set relativenumber!<cr>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CTRLP
"let g:ctrlp_cmd = 'CtrlPBuffer'
"let g:ctrlp_cmd = 'CtrlPBuffer'
map <C-b> :CtrlPBuffer<cr>
map <C-m> :CtrlPMRUFiles<cr> 

