set encoding=utf8 " 默认编码
set mouse=a " 使用鼠标
set nocompatible " 关闭 vi 兼容模式
set autoread " Set to auto read when a file is changed from the outside

syntax on " 语法高亮
set background=dark
"colorscheme molokai
"colorscheme solarized
"colorscheme desert
colorscheme onedark
let g:onedark_terminal_italics=1

"colorscheme black_angus

" diff highlight
"highlight DiffAdd cterm=NONE ctermfg=bg ctermbg=Green gui=NONE guifg=bg guibg=Green
"highlight DiffDelete cterm=NONE ctermfg=bg ctermbg=Red gui=NONE guifg=bg guibg=Red
"highlight DiffChange cterm=NONE ctermfg=bg ctermbg=Yellow gui=NONE guifg=bg guibg=Yellow
"highlight DiffText cterm=NONE ctermfg=bg ctermbg=Magenta gui=NONE guifg=bg guibg=Magenta
" serch highlight, from molokai
"hi Search          ctermfg=0   ctermbg=222   cterm=NONE
"hi IncSearch       ctermfg=0 ctermbg=222

set number " 显示行号
"set relativenumber
set cursorline " 突出显示当前行
"set cursorcolumn " 突出显示当前列
set ruler " 显示ruler
set colorcolumn=80
set showcmd " 输入的命令显示出来，看的清楚些
set laststatus=2 "显示状态栏
set wildmenu " Ex模式下自动补全添加单行菜单提

set hlsearch " 高亮搜索
set incsearch " 在输入要搜索的文字时，vim会实时匹配
set ignorecase " 忽略大小写
set smartcase " 大小写非必敏感, 与ignorecase并用

" 排版,缩进相关
set shiftwidth=2 " 默认缩进2个空格
set tabstop=2 " 制表符占2个空格
set softtabstop=2 " 敲入tab键时实际占有的列数
set autoindent smartindent shiftround "缩进配置
set expandtab " 用spaces替换tabs
set smarttab " 自动缩进
set nowrap " 不要换行
set scrolloff=3 " 往上下移动到头的时候的缓冲行数
"set list listchars=eol:¬,tab:▸\ ,trail:.,
" Configure backspace so it cts s it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 不产生backup文件
set nobackup " 覆盖文件时不备份
set nowb
set noswapfile

" 不用保存也可以切换buffer
set hidden

""""""""""""""""""""""""""""
" 键位映射相关
""""""""""""""""""""""""""""
"修改leader键为逗号
let mapleader=","

"使用左右光标键切换 buffer(relpaced by airline)
"noremap <C-h> :bp<CR>
"noremap <C-l> :bn<CR>

command! W w
command! Q q
command! Wq wq
command! WQ wq
"nnoremap j jzz
"nnoremap k kzz
" 查找时自动滚屏
nnoremap n nzz
nnoremap * *zz
nnoremap # #zz

" 使用系统剪切板
set clipboard=unnamed

" reload vimrc
noremap <f5> :source $MYVIMRC<CR>
" auto reload .vimrc
"augroup reload_vimrc " {
"autocmd!
  "autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }

" 关闭buffer
map <C-c> :BD<cr>

" 复制粘贴后选中粘贴的内容
nnoremap gp `[v`]

"""""""""""""""""""""
"" Vundle插件相关
""""""""""""""""""""""
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

" 文件树
Bundle 'The-NERD-tree'
  " open nerdtree by default
  "autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  let NERDTreeMinimalUI = 1 " 不显示帮助面板
  let g:NERDTreeHijackNetrw=0
  let g:NERDTreeShowHidden=1 "show hidden files by default
  let g:NERDTreeMouseMode=3 "single click both nodes
  let g:NERDTreeIgnore=['\.git$', '\.DS_Store$','\~$']
  map <C-n> :NERDTreeToggle<CR>
  " active only one nerdtree
  "Bundle 'jistr/vim-nerdtree-tabs'
    "let g:nerdtree_tabs_open_on_gui_startup = 0
  " close vim if the only window left open is a NERDTree
  "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'scrooloose/nerdcommenter'

" indentLine
Bundle 'Yggdroot/indentLine'
  let g:indentLine_color_term = 239
  " json文件如果开了会不显示"号,  fix https://github.com/Yggdroot/indentLine/issues/140
  Bundle 'elzr/vim-json'
    let g:vim_json_syntax_conceal = 0

" git
Bundle 'tpope/vim-fugitive'
  Bundle 'airblade/vim-gitgutter'
  " may cause lag when set to 1
  let g:gitgutter_realtimeltime = 0
  let g:gitgutter_eager = 0

" relative number and absolute number
Bundle 'myusuf3/numbers.vim'

" 自动下载所有主题
"Bundle 'flazz/vim-colorschemes'

" 彩虹括号
"Bundle 'luochen1990/rainbow'
  "let g:rainbow_active = 1
" 自动补全括号
"Bundle 'AutoClose'

"Bundle 'mattn/emmet-vim'

"Bundle 'majutsushi/tagbar'

" 代码自动补全
"Bundle 'Valloric/YouCompleteMe'
  "let g:ycm_server_use_vim_stdout = 1
  "let g:ycm_server_log_level = 'debug'
  "nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
  "nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
  "nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
  "Bundle 'marijnh/tern_for_vim'
" 自动补全
Bundle 'ervandew/supertab'
  autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
    \ endif

" Autobuild
"Bundle 'tpope/vim-dispatch'

" 设置状态栏,顶部buffer栏
Bundle 'bling/vim-airline'
  " 使用powerline字体
  let g:airline_powerline_fonts = 1
  " enable tabline
  let g:airline#extensions#tabline#enabled = 1
  " white space checks to enable
    " indent: mixed indent within a line
    " long:   overlong lines
    " trailing: trailing whitespace
    " mixed-indent-file: different indentation in different lines
  let g:airline#extensions#whitespace#checks = ['trailing']
  let g:airline#extensions#syntastic#enabled = 0

  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  nmap <C-h> <Plug>AirlineSelectPrevTab
  nmap <C-l> <Plug>AirlineSelectNextTab

Bundle 'ntpeters/vim-better-whitespace'
  " auto remove whitespace when save
  autocmd BufWritePre * StripWhitespace

" 保证关闭buffer的时候不关闭当前窗口
Bundle 'qpkorr/vim-bufkill'

" 移动神器
"Bundle 'Lokaltog/vim-easymotion'


" 全局搜索
"Bundle 'Shougo/unite.vim'
Bundle 'ag.vim'
  "let g:ag_working_path_mode="r"
  let g:agprg = 'ag --nogroup --nocolor --column --ignore dist'
  " 禁止快捷键,如果是splite打开的话会创建一个空白的buffer
  let g:ag_apply_qmappings=1
  let g:ag_highlight=1
Bundle 'kien/ctrlp.vim'
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|site_packages\|venv\|jupiter\/static\|jupiter\/template'
  let g:ctrlp_show_hidden=1 "scan dot files

" 语法检查(打开有性能问题)
Bundle 'scrooloose/syntastic'
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_javascript_checkers = ['eslint']
  " make eslint faster
  let g:syntastic_javascript_eslint_exec = 'eslint_d'
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_error_symbol = '✗'
  " 部分解决syntastic性能问题(有 eslint_d就不用这个了)
  "Bundle 'ruanyl/vim-eslint', {'do': 'npm install'}

" markdown
Bundle 'plasticboy/vim-markdown'
  " required by vim-markdown
  Bundle 'godlygeek/tabular'
  let g:vim_markdown_toc_autofit = 1
  let g:vim_markdown_folding_disabled = 1

" React相关
Bundle 'mxw/vim-jsx'
  "for react jsx, JSX in .js files
  let g:jsx_ext_required = 0
  " Required by vim-jsx
  Bundle 'pangloss/vim-javascript'

" vim-react-snippets:
  "Bundle 'justinj/vim-react-snippets'

" SnipMate and its dependencies:
  "Bundle 'MarcWeber/vim-addon-mw-utils'
  "Bundle 'tomtom/tlib_vim'
  "Bundle 'garbas/vim-snipmate'

  "Bundle 'bentayloruk/vim-react-es6-snippets'

" snippets
Bundle 'SirVer/ultisnips'
let g:UltiSnipsJumpForwardTrigger="<c-f>"

Bundle 'mlaursen/vim-react-snippets'
Bundle 'honza/vim-snippets'

" 普通模式下输入法为英文
"Bundle 'CodeFalling/fcitx-vim-osx'

" 平滑滚动
"Bundle 'yonchu/accelerated-smooth-scroll'

" 多鼠标
"Bundle 'terryma/vim-multiple-cursors'
"let g:multi_cursor_next_key='<C-n>'

"Bundle 'lornix/vim-scrollbar'

call vundle#end() " required
filetype plugin indent on " required

filetype plugin on

" guiset
if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12'
  " nerttree不显示scrollbar
  set guioptions-=L
endif

" tmux
"if exists('$TMUX')
  set term=screen-256color
"endif
