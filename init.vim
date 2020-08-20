" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @Tantao


" ====================
" ===   编辑器设定   ===
" ====================

" ===
" === System
" ===
"set clipboard=unnamed
let &t_ut=''
set autochdir


" ===
" === 编辑器行为
" ===
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=80
set updatetime=1000

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === 终端行为
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
let g:terminal_color_0   = '#000000'
let g:terminal_color_1   = '#FF5555'
let g:terminal_color_2   = '#50FA7B'
let g:terminal_color_3   = '#F1FA8C'
let g:terminal_color_4   = '#BD93F9'
let g:terminal_color_5   = '#FF79C6'
let g:terminal_color_6   = '#8BE9FD'
let g:terminal_color_7   = '#BFBFBF'
let g:terminal_color_8   = '#4D4D4D'
let g:terminal_color_9   = '#FF6E67'
let g:terminal_color_10  = '#5AF78E'
let g:terminal_color_11  = '#F4F99D'
let g:terminal_color_12  = '#CAA9FA'
let g:terminal_color_13  = '#FF92D0'
let g:terminal_color_14  = '#9AEDFE'


" ===
" === 基本映射
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
noremap S :w<CR>

" 随时打开vimrc文件
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
noremap <LEADER>st :Startify<CR>

" Undo operations

" Insert Key

" 使Y复制到行尾
nnoremap Y y$

" 复制到系统剪贴板
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" 搜索
noremap <LEADER><CR> :nohlsearch<CR>

" 相邻重复单词
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" 制表符
noremap <LEADER>tt :%s/    /\t/g

" 折叠
noremap <silent> <LEADER>o za


" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     e
" < h   i >
"     n
"     v
" l键输入

noremap n j
noremap i l
noremap e k
noremap l i
" U/E keys for 5 times u/e (faster navigation)
noremap <silent> E 5k
noremap <silent> N 5j

" N key: go to the start of the line
noremap <silent> H 0
" I key: go to the end of the line
noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'

" Ctrl + U或E将在不移动光标的情况下向上/向下移动视图端口
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" ===
" === 插入模式光标移动
" ===
inoremap <C-a> <ESC>A


" ===
" === Window management
" ===
" 使用<空格> +新的箭头键在窗口中移动光标
noremap <LEADER>w <C-w>w
noremap <LEADER>e <C-w>k
noremap <LEADER>n <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>i <C-w>l

" 禁用默认的s键
noremap s <nop>

" 将屏幕拆分为上(水平)、下(水平)、左(垂直)、右(垂直)
noremap se :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sn :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" 用箭头键调整分割的大小
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" 上下放置两个屏幕
noremap sh <C-w>t<C-w>K
" 将两个屏幕并排放置
noremap sv <C-w>t<C-w>H

" 旋转屏幕
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" 按<空格> + q关闭当前窗口下方的窗口
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === 标签管理
" ===
" 创建新标签
noremap tu :tabe<CR>
" 使用th和tl在标签之间移动
noremap th :-tabnext<CR>
noremap ti :+tabnext<CR>
" 使用tmh和tml移动选项卡
noremap tmh :-tabmove<CR>
noremap tmi :+tabmove<CR>


" ===
" === Markdown 设置
" ===
" Snippets
" 自动拼写
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" \p 显示当前缓冲区文件路径
nnoremap \p 1<C-G>

" 使用ctrl + 9将下一个字符移至行尾
inoremap <C-u> <ESC>lx$p

" 打开终端窗口
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>

" 按两次空格键跳到下一个'<++>'并进行编辑
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" 使用<space> sc进行拼写检查
noremap <LEADER>sc :set spell!<CR>

" 按`更改大小写（而不是〜)
noremap ` ~

noremap <C-c> zz

" 自动将目录更改为当前目录
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet

noremap <LEADER>- :lN<CR>
noremap <LEADER>= :lne<CR>

" 编译功能
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc
