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

" deplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

" 缩进设置
set shiftwidth=4
set tabstop=4
set expandtab

" 高亮设置
set hlsearch

" 当前行设置
set cursorline  
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE

" 行号设置
set nu
hi LineNr ctermfg=237

autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

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
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8', 'pylint']}
" Fix Python files with autopep8 and yapf.
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'python':['autopep8', 'yapf']}
" Disable warnings about trailing whitespace for Python files.
let g:ale_warn_about_trailing_whitespace = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
noremap <leader>p :ALEFix<cr>

" 缓冲区切换设置
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" 主题设置
let g:airline_theme='one'
colorscheme one
set background=dark
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum


" 自动补全
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
let g:deoplete#enable_at_startup = 1
