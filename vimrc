set nocompatible " set uncompatibality with vi

	" setting mapleader here, in case I use them in Plugin mappings
let mapleader=","
let maplocalleader=";"

	" automatically install vim-plug, if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'	" added as plugin for vim help (https://github.com/junegunn/vim-plug/wiki/tips)

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'shougo/neocomplete'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'

Plug 'jiangmiao/auto-pairs'

Plug 'tweekmonster/braceless.vim'

Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'flazz/vim-colorschemes'

Plug 'AndrewRadev/switch.vim'

Plug 'KabbAmine/zeavim.vim'

" Plug 'mbbill/undotree'
Plug 'simnalamburt/vim-mundo'

" Plug 'sjl/gundo.vim'

" Plug 'ktvoelker/sbt-vim'

" Plug 'derekwyatt/vim-scala'

Plug 'lervag/vimtex'

Plug 'bronson/vim-trailing-whitespace'

Plug 'dodie/vim-fibo-indent'

Plug 'majutsushi/tagbar'

Plug 'junegunn/fzf.vim'

Plug 'rust-lang/rust.vim'

Plug 'alvan/vim-closetag'

call plug#end()

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
	"define dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
			\'default' : '',
			\'vimshell' : $HOME.'/.vimshell_hist',
			\'scheme' : $HOME.'/.gosh_completions',
			\'tex': '~/.vim/dictionaries/tex',
			\}
	"Define keyword
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '[a-zA-Z_äöüåÄÖÜÅß-][a-zA-Z0-9_äöüåÄÖÜÅß-]*' " match words starting with \h or umlauts/ß or -, and continues with \w, umlauts/ß and -
	"<TAB>: completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
	"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	"Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

autocmd FileType python setlocal omnifunc=python3complete#Complete

" NERDTree
" show hidden files
let NERDTreeShowHidden=1

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = 'python3'
" let g:syntastic_nasm_nasm_exec = 'nasm -f elf64 -lc'

let g:syntastic_python_checkers=["python", "flake8"]

" Utilsnips
let g:UltiSnipsExpandTrigger="<leader>e"
let g:UltiSnipsJumpForwardTrigger="<leader>u"
let g:UltiSnipsJumpBackwardTrigger="<leader>U"

let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsEnableSnipMate = 0

" GitGutter
let g:gitgutter_map_keys = 0

" Switch.vim
let g:switch_mapping="<leader>l"
let g:switch_reverse_mapping="<leader>h"
autocmd FileType java let b:switch_custom_definitions =
			\ [
			\	['private', 'public', 'protected']
			\ ]

" vim-numbertoggle
" manually set mapping as it got dropped in version 2.0
nnoremap <silent> <C-n> :set relativenumber!<CR>:set number<CR>


" vimtex
" disable for now
let g:vimtex_enabled = 0

" vim-fibo-indent
" disable
let g:FiboIndentDisable=1

" Tagbar
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1

" rust.vim
let g:rustfmt_autosave=1

" fzf
set rtp+=~/.fzf

" --------------------------------------------------
" settings
" --------------------------------------------------

set nowrap " one line in file is one line on scleen
set scrolloff=3 " Strart scrolling n lines before horizontal border of window
set sidescroll=1 " sidescroll one collumn at a time
set sidescrolloff=7 " Strart scrolling n collumns before vertical border of window

set mouse=a " enable mouse support

set backupdir=~/.vim/backups// " put all backups in a central location
set directory=~/.vim/swaps// " put all .swap files in a central location

set tabstop=4 " one tab = 4 spaces
set shiftwidth=4 " shift 4 spaces at autoindent
set softtabstop=4 " enter 4 spaces when pressing tab
set noexpandtab " keep tabs as tabs

set autoread " reload files when changed externally

set laststatus=2 " always show bottom line
set showtabline=1 " only show tablne when at least 2 tabs are present

set t_Co=256 " 256 color terminal
colorscheme molokai
syntax on " turn on syntax highlighting
highlight Normal ctermbg=NONE guibg=NONE

set cursorline
set cursorcolumn
set noerrorbells
set visualbell " sets visual bell to disable all sounds
set t_vb= " disables visual bells from the terminal

set updatetime=1000 " writes .swap files more often, updates GitGutter more often

set encoding=utf-8

set hidden " can put buffer to the background without writing to disk, will remember history/marks

set lazyredraw " don't redraw while executing macros
set ttyfast " send more characters at a given time

set hlsearch " highlight searches
set incsearch " show the 'best mach so far' as typed
set ignorecase smartcase " make searches case-insensitive, unless they contais upper-case letters
set gdefault " make default global (g flag) with :s, to make nonglobal add the g flag

set shortmess+=I " don't show intro on empty startup

set whichwrap+=<,>,[,] " allow arrowkeys to wrap lines

" set default latex filetype
let g:tex_flavor = "latex"

" adds as part of words
set iskeyword+=-,ä,ö,ü,Ä,Ö,Ü,ß

" sets a coloured column at 80 chars and 120 chars
set colorcolumn=80,120

set wildmenu " show possible completions of commandline commands over statusline
set wildignorecase " complete filenames and directories case insensitive

" find ctags in any parent .git directory
set tags+=./.git/tags;,./.git/TAGS;,.git/tags;,.git/TAGS;

" --------------------------------------------------
" functions
" --------------------------------------------------
function! TrimSave()
	FixWhitespace
	write
endfunction

" --------------------------------------------------
" nmappings
" --------------------------------------------------

" NERDTree
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :NERDTreeFind<CR>

" Windowing/buffer
noremap <F4> :bd<CR>
noremap <F5> :ls<CR>:b<Space>
noremap <F6> :bprevious<CR>
noremap <F7> :bnext<CR>
noremap <F8> <C-^>
noremap <F9> <C-w><C-w>

" Undotree
" noremap <F10> :UndotreeToggle<CR>

" vim-mundo
noremap <F10> :MundoToggle<CR>

" Tagbar
noremap <F11> :TagbarToggle<CR>

" UltiSnips
noremap <F12> :UltiSnipsEdit<CR>

" easier EX commands
noremap <Space> :

" format json
noremap =j :%!python3 -m json.tool<CR>

" Bubble line
noremap <C-up> ddkP
noremap <C-down> ddp

" duplicate line
noremap <C-S-up> yyP
noremap <C-S-down> yyp

" yank rest of line
noremap Y y$

" swap t and f (t is easier to hit than f on Dvorak)
"	(To char, aFter/beFore char)
noremap t f
noremap f t
noremap T F
noremap F T

" --------------------------------------------------
" imappings
" --------------------------------------------------

" auto esc, really uncommon to type jj, jk, uncommon to type kk
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kk <ESC>

" unusual to write ' ,' often meant as ', '
" inoremap <Space>, ,<Space>

" --------------------------------------------------
" cmappings/commands
" --------------------------------------------------

" force write/sudo write
silent! cnoremap w!! w !sudo tee % > /dev/null

" forgiving write commands
silent! command WQ wq
silent! command Wq wq
silent! command W exec TrimSave()
silent! command Q q


" --------------------------------------------------
" leader mappings
" --------------------------------------------------

" ----------set no----------
" 'no highlight', turns off search highlight until next search
noremap <leader>nh :nohlsearch<CR>

" 'no numbers', turns off line numbers
noremap <leader>nn :set norelativenumber<CR>:set nonumber<CR>

" 'no spell check', turns offf spell checking
noremap <leader>ns :setlocal nospell<CR>

" 'no background', removes background colour
noremap <leader>nb :highlight Normal ctermbg=NONE guibg=NONE<CR>

" 'no colorcolumns', turns off the columns at 80 and 120
noremap <leader>nc :set colorcolumn=0<CR>


"----------tabs----------
noremap <leader>tc :tabnew<CR>
noremap <leader>tn :tabnext<CR>
noremap <leader>tl :tabnext<CR>
noremap <leader>tp :tabprevious<CR>
noremap <leader>th :tabprevious<CR>
noremap <leader>tx :tabclose<CR>
noremap <leader>td :tabclose<CR>
noremap <leader>t0 :tabfirst<CR>
noremap <leader>t$ :tablast<CR>
noremap <leader>tt :tabs<CR>
noremap <leader>to :tabonly<CR>
noremap <leader>tmh :-tabmove<CR>
noremap <leader>tmp :-tabmove<CR>
noremap <leader>tml :+tabmove<CR>
noremap <leader>tmn :+tabmove<CR>
noremap <leader>tm0 :0tabmove<CR>
noremap <leader>tm$ :$tabmove<CR>


"----------reformat----------
noremap <leader>f mfgg=G'fzz

"----------whitespace----------
noremap <leader>w :FixWhitespace<CR>

"----------sppell checking----------
	" set spelllang uk
noremap <leader>sse :setlocal spelllang=en_gb<CR>
	\:set spellfile=~/.vim/spell/en.utf-8.add<CR>

	" set spelllang de
noremap <leader>ssd :setlocal spelllang=de_de<CR>
	\:set spellfile=~/.vim/spell/de.utf-8.add<CR>

	" spell toggle
noremap <leader>st :setlocal spell!<CR>
noremap <leader>ss :setlocal spell<CR>

	" goto next/prev bad word
noremap <leader>sn ]s
noremap <leader>sp [s

	" suggest alternate words
noremap <leader>sa z=

	" set word as good/wrong/wrong
noremap <leader>sg zg
noremap <leader>sb zw
noremap <leader>sw zw

	" unset word as good/wrong/wrong
noremap <leader>sug zug
noremap <leader>sub zuw
noremap <leader>suw zuw

"----------syntax/Syntastic----------
noremap <leader>xpycp :let g:syntastic_python_checkers=["python"]<CR>
noremap <leader>xpycf :let g:syntastic_python_checkers=["python", "flake8"]<CR>
noremap <leader>xpycl :let g:syntastic_python_checkers=["python", "pylint"]<CR>
noremap <leader>xpycb :let g:syntastic_python_checkers=["python", "flake8", "pylint"]<CR>

"----------location list/errors----------
"TODO

"----------Quickfix list----------
"TODO


" --------------------------------------------------
" AutoCmds
" --------------------------------------------------
autocmd VimResized * wincmd =
