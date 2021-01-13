"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/yoshi/.vim/dein/./repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/yoshi/.vim/dein/.')
  call dein#begin('/home/yoshi/.vim/dein/.')

  " Let dein manage dein
  " Required:
  call dein#add('/home/yoshi/.vim/dein/./repos/github.com/Shougo/dein.vim')
 

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  
" Load TOML 
   let s:toml_dir  = $HOME . '/.vim/dein/plugins' 
   let s:toml      = s:toml_dir . '/dein.toml'
   let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  
" tomlファイルをキャッシュしておくための記述
   call dein#load_toml(s:toml,      {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})
" Load TOML END
 
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

""Setting begin----------------------------
"括弧入力時に対応する括弧を表示
set showmatch

"
set tabstop=2

"自動インデントに使われる空白の数
set shiftwidth=2

"数値を10進数として扱う
set nrformats=

"
set ruler

"show title
set title 

syntax on 
set smartindent

""appearance------------------------------

"行番号を表示
set number

"現在の行を強調表示
set cursorline

"現在の列を強調表示
set cursorcolumn

""Tab-------------------------------------
"不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

"Tab文字を半角スペースにする
set expandtab

""Search
"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

"検索後をハイライト表示
set hlsearch

"colorschema molokai---------------------
colorscheme molokai
set t_Co=256

"### lightline
set laststatus=2

"### Emmet-vim

"vim-airline
"Show Tab Namber
let g:airline#extensions#tabline#buffer_idx_mode = 1
"
let g:airline#extensions#tabline#enabled = 1
"
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

"NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
"Show hidden files
"let NERDTreeShowHidden = 1

"
"Edit $MYVIMRC <Space>.
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
"Source $MYVIMRC <Space>s.
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>

"Leader
let mapleader = "\<Space>"
nnoremap <Leader>a ggVG
nnoremap <Leader>w :w<CR>

"クォーテーションの自動保管
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"Setting end------------------------------
