call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'git@github.com:ludovicchabant/vim-gutentags.git'
Plug 'mhinz/vim-signify'
Plug 'skywind3000/asyncrun.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'tell-k/vim-autopep8'
Plug 'jiangmiao/auto-pairs'
Plug 'git@github.com:rakr/vim-one.git'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'rizzatti/dash.vim'

" YCM
Plug 'git@github.com:Valloric/YouCompleteMe.git'

" git
Plug 'git@github.com:tpope/vim-fugitive.git'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug '~/.fzf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" go config
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

" git diff
Plug 'airblade/vim-gitgutter'

" scala
Plug 'derekwyatt/vim-scala'

" racket
Plug 'git@github.com:wlangstroth/vim-racket.git'
Plug 'git@github.com:jpalardy/vim-slime.git'

" python
Plug 'fisadev/vim-isort'

" vim
Plug 'posva/vim-vue'

" Python docsting
Plug 'git@github.com:heavenshell/vim-pydocstring.git'


call plug#end()

" 缩进设置
set textwidth=89  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
" set autoindent    " align the new line indent with the previous line"

" 高亮设置
set hlsearch


" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


" 动态检查设置, 用的ale
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Check Python files with flake8 and pylint.
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8']}
" Fix Python files with autopep8 and yapf.
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'python':['autopep8', 'yapf']}
" Disable warnings about trailing whitespace for Python files.
let g:ale_warn_about_trailing_whitespace = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 0

" 缓冲区切换设置
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" 主题设置
let g:airline_theme='one'
colorscheme one
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

hi Normal ctermbg=NONE guibg=NONE

highlight PMenu ctermfg=grey  guibg=darkgrey
highlight PMenuSel ctermfg=grey ctermbg=darkblue

" 当前行设置
set cursorline  
hi CursorLine ctermbg=NONE ctermfg=NONE term=bold cterm=bold

" noeol
set nofixendofline

" 行号设置
set nu

" NERDTree config
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '__pycache__', 'venv']

" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'



" 状态栏设置
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" 修改leader键
let mapleader=","
noremap <leader>z :ALEFix<CR>
nmap <leader>c   :Pydocstring<CR>
nmap <leader>w   :w<CR>
nmap <leader>q   :q<CR>
nmap <leader>wq   :wq<CR>
nmap <leader>g   :LeaderfFunction<CR>
nmap <leader>v   :vsp .<CR>
nmap <leader>p   :set paste<CR>
nmap <leader>np   :set nopaste<CR>
" vmap <leader>y  :w !pbcopy<CR><CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
map <leader>t oimport pdb; pdb.set_trace()<esc>
nmap <leader>gb   :Gblame<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>F :Ag<CR>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


" YCM config
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'


" close preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
