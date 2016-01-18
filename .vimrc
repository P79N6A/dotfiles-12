set encoding=utf8 " 默认编码
set mouse=a " 使用鼠标
set nocompatible " 关闭 vi 兼容模式 
set autoread " Set to auto read when a file is changed from the outside

" 显示相关
syntax on " 语法高亮
" 主题
colorscheme molokai
set number " 显示行号
set cursorline " 突出显示当前行
"set cursorcolumn " 突出显示当前列
set ruler " 显示ruler
set showcmd " 输入的命令显示出来，看的清楚些
set laststatus=2 "显示状态栏
set wildmenu " Ex模式下自动补全添加单行菜单提

set hlsearch " 高亮搜索
set incsearch " 在输入要搜索的文字时，vim会实时匹配

" 排版,缩进相关
set shiftwidth=2 " 默认缩进2个空格
set tabstop=2 " 制表符占2个空格 
set softtabstop=2 " 敲入tab键时实际占有的列数
"set smartindent " 把当前行的对齐格式应用到下一行
set expandtab " 用spaces替换tabs
set smarttab " 自动缩进
set nowrap " 不要换行
set scrolloff=7 " 往上下移动到头的时候有7行的缓冲

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 不产生backup文件
set nobackup " 覆盖文件时不备份
set nowb
set noswapfile

" 不用保存也可以切换buffer
set hidden

"修改leader键为逗号
let mapleader=","

"使用左右光标键切换 buffer
noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>


"noremap <silent> <C-S> :update<CR>
"vnoremap <silent> <C-S>         <C-C>:update<CR>
"inoremap <silent> <C-S>         <C-O>:update<CR>

" 使用系统剪切板
vmap y :w !pbcopy<CR><CR>
nmap yy :.w !pbcopy<CR><CR>
" nmap p :r !pbpaste<CR><CR>


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
  
  map <C-n> :NERDTreeToggle<CR>
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
  " active only one nerdtree
  Bundle 'jistr/vim-nerdtree-tabs'
  " close vim if the only window left open is a NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'scrooloose/nerdcommenter' 

" git
" Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
  let g:gitgutter_realtimeltime = 1
  let g:gitgutter_eager = 1
" 自动帮你补全括号
"Bundle 'AutoClose' 

" 代码自动补全
Bundle 'Valloric/YouCompleteMe'

Bundle 'bling/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
" 设置状态栏(不要忘了rtp配置)
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" 保证关闭buffer的时候不关闭当前窗口
Bundle 'qpkorr/vim-bufkill'
  map <C-c> :BD<cr>

" 移动神器 
Bundle 'Lokaltog/vim-easymotion'

" 全局搜索
Bundle 'kien/ctrlp.vim'
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|site_packages\|venv\|jupiter\/static\|jupiter\/template'
Bundle 'EasyGrep'
  let g:EasyGrepCommand = 1
  let g:EasyGrepRecursive  = 1 " Recursive searching
  " 只有在EasyGrepCommand = 1的时候才有用
  let g:EasyGrepFilesToExclude = 'node_modules,.git/*,static,dist'
" 语法检查(打开有性能问题)  
" Bundle 'scrooloose/syntastic'
  "let g:syntastic_check_on_open = 1  
  "let g:syntastic_javascript_checkers = ['eslint']
  "let g:syntastic_warning_symbol='>'

" React相关
  Bundle 'mxw/vim-jsx'
    "for react jsx, JSX in .js files
    let g:jsx_ext_required = 0
    " Required by vim-jsx
    Bundle 'pangloss/vim-javascript'


call vundle#end() " required
filetype plugin indent on " required



"disable index_guides 在Vim里显示不好,所以干脆禁用掉了
"let g:indent_guides_auto_colors = 0


