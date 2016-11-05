set encoding=utf8 " 默认编码
set mouse=a "使用鼠标
" double click mouse highlight
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
set nocompatible " 关闭 vi 兼容模式
"set autoread " Set to auto read when a file is changed from the outside

"在执行宏命令时，不进行显示重绘；在宏命令执行完成后，一次性重绘，以便提高性能。
" set lazyredraw
" set ttyfast

syntax on " 语法高亮
set background=dark

" let g:onedark_terminal_italics=1
" let g:onedark_termcolors=16
colorscheme onedark

" colorscheme molokai
"colorscheme solarized
"colorscheme desert
"colorscheme black_angus
"highlight DiffChange cterm=NONE ctermfg=bg ctermbg=Yellow gui=NONE guifg=bg guibg=Yellow
"highlight DiffText cterm=NONE ctermfg=bg ctermbg=Magenta gui=NONE guifg=bg guibg=Magenta
" serch highlight, from molokai
"hi Search          ctermfg=0   ctermbg=222   cterm=NONE
"hi IncSearch       ctermfg=0 ctermbg=222

set number " 显示行号
"set relativenumber
" set cursorline " 突出显示当前行(disable it for better performance)
"set cursorcolumn " 突出显示当前列
set synmaxcol=200 " max highlight column number, reduce it for better performance
set ruler " 显示ruler
" set colorcolumn=80 " disable it for better performance
" set showcmd " 输入的命令显示出来，disable for better performance
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
"set nowrap " 不要换行
set scrolloff=3 " 往上下移动到头的时候的缓冲行数
" highlight whitespace
" set list listchars=tab:▸\ ,trail:·
" set list listchars=trail:·

" Configure backspace so it cts s it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 不产生backup文件
set nobackup " 覆盖文件时不备份
set nowb
set noswapfile

set noshowmatch         " Don't match parentheses/brackets

" 不用保存也可以切换buffer
set hidden

set foldmethod=syntax
" set foldlevel=2
" set foldnestmax=2
set foldlevelstart=99
"
""""""""""""""""""""""""""""
" key mapping
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

" delete whitespace onsave
" fun! <SID>StripTrailingWhitespaces()
    " let l = line(".")
    " let c = col(".")
    " %s/\s\+$//e
    " call cursor(l, c)
" endfun
" autocmd BufWritePre !markdown :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""
" Plugin Manager(vim-plug) "
""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" chinese document
Plug 'asins/vimcdoc'

" source tree
Plug 'The-NERD-tree', { 'on':  'NERDTreeToggle' }
  " open nerdtree by default
  "autocmd StdinReadPre * let s:std_in=1
  " open nerdtree when no file argement provided
  function! StartUp()
    if 0 == argc()
      NERDTree
    end
  endfunction
  autocmd VimEnter * call StartUp()
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  let g:NERDTreeMinimalUI = 1 " 不显示帮助面板
  " let g:NERDTreeHijackNetrw=0
  let g:NERDTreeShowHidden=1 "show hidden files by default
  let g:NERDTreeMouseMode=3 "single click both nodes
  let g:NERDTreeAutoDeleteBuffer=1
  let g:NERDTreeIgnore=['\.git$', '\.DS_Store$','\~$']
  map <C-n> :NERDTreeToggle<CR>
  " active only one nerdtree
  "Plug 'jistr/vim-nerdtree-tabs'
    "let g:nerdtree_tabs_open_on_gui_startup = 0
  " close vim if the only window left open is a NERDTree
  "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " relative number and absolute number
  Plug 'myusuf3/numbers.vim'
  let g:NERDTreeShowLineNumbers=1
  autocmd BufEnter NERD_* setlocal rnu
  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }

" commenter
" Plug 'scrooloose/nerdcommenter'
"   let g:NERDSpaceDelims = 1
Plug 'tomtom/tcomment_vim'

" indentLine (make lag in html)
" Plug 'Yggdroot/indentLine'
"   " let g:indentLine_color_term = 239
"   " let g:indentLine_color_gui = '#2C323C'
"   let g:indentLine_color_gui = '#3E4452'
"   let g:indentLine_char = '│'
"   " json文件如果开了会不显示"号,  fix https://github.com/Yggdroot/indentLine/issues/140
"   Plug 'elzr/vim-json'
"     let g:vim_json_syntax_conceal = 0

" git
Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " may cause lag when set to 1 for these two below
  " let g:gitgutter_realtimeltime = 0
  " let g:gitgutter_eager = 0


" " surrounding
" Plug 'tpope/vim-surround'

" 自动下载所有主题
"Plug 'flazz/vim-colorschemes'

" 彩虹括号
"Plug 'luochen1990/rainbow'
  "let g:rainbow_active = 1
" 自动补全括号
"Plug 'AutoClose'

"Plug 'mattn/emmet-vim'

"Plug 'majutsushi/tagbar'

" 后悔药
"Plug 'mbbill/undotree'
 "nnoremap <leader>u :UndotreeToggle<cr>:UndotreeFocus<cr>

" 代码自动补全
"Plug 'Valloric/YouCompleteMe'
  "let g:ycm_server_use_vim_stdout = 1
  "let g:ycm_server_log_level = 'debug'
  "nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
  "nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
  "nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
  "Plug 'marijnh/tern_for_vim'

" 自动补全
Plug 'ervandew/supertab'
  autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, '<c-p>') |
    \   call SuperTabSetDefaultCompletionType('<c-x><c-u>') |
    \ endif

" Plug 'ajh17/VimCompletesMe'

" Autobuild
"Plug 'tpope/vim-dispatch'

" 设置状态栏,顶部buffer栏
Plug 'bling/vim-airline'
  let g:airline_theme='onedark'
  " 使用powerline字体
  " let g:airline_powerline_fonts = 1
  " 防止切换到 normal 模式时候的延迟
  set ttimeoutlen=0
  " enable tabline
  let g:airline#extensions#tabline#enabled = 1
  " white space checks to enable
    " indent: mixed indent within a line
    " long:   overlong lines
    " trailing: trailing whitespace
    " mixed-indent-file: different indentation in different lines
  let g:airline#extensions#whitespace#checks = []
  " markdown不需要监测
  "autocmd FileType * unlet! g:airline#extensions#whitespace#checks
  "autocmd FileType markdown let g:airline#extensions#whitespace#checks = []
  let g:airline#extensions#syntastic#enabled = 0

  let g:airline#extensions#tabline#buffer_idx_mode = 1
  " TODO use for
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


" 保证关闭buffer的时候不关闭当前窗口
Plug 'qpkorr/vim-bufkill'

" 移动神器
"Plug 'Lokaltog/vim-easymotion'

" 全局搜索
"Plug 'Shougo/unite.vim'
Plug 'dkprice/vim-easygrep'
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  let g:EasyGrepCommand=1
  "let g:EasyGrepOpenWindowOnMatch=0 
  let g:EasyGrepJumpToMatch=0
  "let g:EasyGrepWindow=1
  "let g:EasyGrepFileAssociationsInExplorer=1
  let g:EasyGrepRecursive=1 
  "let g:EasyGrepAllOptionsInExplorer=1
  let g:EasyGrepFilesToExclude='.svn,.git,dist,autoconfig,node_modules,node_modules_old'
  let g:EasyGrepRoot = "search:.git,.hg,.svn"
"Plug 'ag.vim'
  ""let g:ag_working_path_mode="r"
  "let g:agprg = 'ag --nogroup --nocolor --column --ignore dist'
  "" 禁止快捷键,如果是splite打开的话会创建一个空白的buffer
  "let g:ag_apply_qmappings=1
  "let g:ag_highlight=1
Plug 'kien/ctrlp.vim'
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|site_packages\|venv\|jupiter\/static\|jupiter\/template'
  let g:ctrlp_show_hidden=1 "scan dot files
  " use ag as the ctrip command
  "let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden 
      "\ --ignore .git 
      "\ --ignore out 
      "\ --ignore .svn 
      "\ --ignore .hg 
      "\ --ignore .DS_Store
      "\ -g ""'

" 语法检查(打开有性能问题)
Plug 'w0rp/ale'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:ale_echo_msg_error_str = '⨉'
" let g:ale_echo_msg_warning_str = '⚠'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Plug 'scrooloose/syntastic'
"   let g:syntastic_check_on_open = 0
"   let g:syntastic_check_on_wq = 1
"   let g:syntastic_javascript_checkers = ['eslint']
"   " make eslint faster
"   let g:syntastic_javascript_eslint_exec = 'eslint_d'
"   let g:syntastic_warning_symbol='W'
"   let g:syntastic_error_symbol = 'E'

" disable scrooloose when file is larger than 1mb
let g:LargeFile = 1
" augroup LargeFile 
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile * 1024 * 10 || f == -2 | call BigFile() | endif
" augroup END

function! BigFile()
  let b:syntastic_mode = "passive"
  " SyntasticReset
  " echo 'disabled syntastic in files larger than 1mb'
endfunction


"Plug 'heavenshell/vim-jsdoc'

" 'gf' to jump to imported file
Plug 'moll/vim-node'

" Plug 'mattn/emmet-vim'

""""""""""""""""""""
" syntax highlight "
""""""""""""""""""""

" 万能语法高亮
Plug 'sheerun/vim-polyglot', { 'do': './build'}
" let g:polyglot_disabled = ['jsx']
" markdown
" tabular is required by vim-markdown
" Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  let g:vim_markdown_toc_autofit = 1
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_new_list_item_indent = 0 
  let g:vim_markdown_fenced_languages = ['js=javascript', 'php=php', 'css=css', 'html=html']

" Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
"   "for react jsx, JSX in .js files
"   let g:jsx_ext_required = 0


"vim-react-snippets(replaced by mlaursen/vim-react-snippets)
  "Plug 'justinj/vim-react-snippets'

  "SnipMate and its dependencies:
    "Plug 'MarcWeber/vim-addon-mw-utils'
    "Plug 'tomtom/tlib_vim'
    "Plug 'garbas/vim-snipmate'

    "Plug 'bentayloruk/vim-react-es6-snippets'

" snippets
Plug 'SirVer/ultisnips'
  let g:UltiSnipsJumpForwardTrigger="<c-f>"

Plug 'mlaursen/vim-react-snippets'
Plug 'honza/vim-snippets'

" 普通模式下输入法为英文(have bugs)
" Plug 'CodeFalling/fcitx-vim-osx'

" 平滑滚动
"Plug 'yonchu/accelerated-smooth-scroll'

" 多鼠标
"Plug 'terryma/vim-multiple-cursors'
"let g:multi_cursor_next_key='<C-n>'

"Plug 'lornix/vim-scrollbar'

" guiset and tmux
if has('gui_running')
  set guifont=Hack\ Regular:h12'
  " nerttree不显示scrollbar
  set guioptions-=L
elseif exists('$TMUX')

  " make large file faster
  Plug 'mhinz/vim-hugefile'
  let g:hugefile_trigger_size=1

  " for tmux
  if (has("nvim"))
    nmap <bs> <C-h>
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  else
    set term=xterm-256color
  endif
endif

if (has("termguicolors"))
  set termguicolors
endif

" https://github.com/vim/vim/issues/804
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  set t_ut=
endif
call plug#end()



" for iterm3
if has('mouse_sgr')
  set ttymouse=sgr
endif

