" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" For plug-ins to load correctly.
filetype plugin indent on

syntax on
if(has("termguicolors"))
  set termguicolors
endif

"set termguicolors
syntax enable 
" Turn off modelines
set modelines=0
" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd
"call plug#begin('~/.config/nvim/plugged')
call plug#begin(stdpath('data') . '/plugged')
"Fugitive Vim Github Wrapper
"Plug 'tpope/vim-fugitive'
" ctrlp
Plug 'git@github.com:kien/ctrlp.vim.git'
""AutoComplete
"Plug 'ycm-core/YouCompleteMe'
" Format
Plug 'Chiel92/vim-autoformat'
" easymotion
Plug 'easymotion/vim-easymotion'
"File Tree
Plug 'scrooloose/nerdtree'
" File tree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
""rails-vim
Plug 'tpope/vim-rails'
"Golang for vim
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
""JavaScript vim support
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
"color schemes
"Plug 'flazz/vim-colorschemes'
Plug 'kyoz/purify', {'rtp': 'vim'}
""Ruby for vim
Plug 'vim-ruby/vim-ruby'
"Typescript for vim
"Plug 'leafgarland/typescript-vim'
""JSX for vim
Plug 'mxw/vim-jsx'
Plug 'yuezk/vim-js'
"JSON highlighting
Plug 'elzr/vim-json'
""Markdown syntax
"Plug 'plasticboy/vim-markdown'
" Colorizor
Plug 'gko/vim-coloresque'
"Typescript syntax
"Plug 'leafgarland/typescript-vim'
""Elixir config for vim
Plug 'elixir-lang/vim-elixir'
"Auto-format
"Plug 'chiel92/vim-autoformat'
""Allows for CSV files in vim
Plug 'chrisbra/csv.vim'
"Purple theme 
Plug 'Rigellute/shades-of-purple.vim'
""atom theme
Plug 'joshdick/onedark.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'flrnd/candid.vim'
" Spacevim theme
Plug 'liuchengxu/space-vim-theme'
Plug 'liuchengxu/space-vim-dark'
" Gruvbox
Plug 'morhetz/gruvbox'
" undo tree
Plug 'mbbill/undotree'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" vim icons
Plug 'ryanoasis/vim-devicons'
""Linting
"Plug 'w0rp/ale'
" Ctags bar
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TS syntax
Plug 'HerringtonDarkholme/yats.vim'
Plug 'kovisoft/slimv'
"Plug 'skywind3000/vim-preview'
"Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.tsx']}
Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }
Plug 'baeuml/summerfruit256.vim'
call plug#end()
" FZF
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
"let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags -R --options=C:\Users\pmorg\defaults.ctags'
"nnoremap <Space>g :Rg<CR>
nnoremap <F8> :Tags<CR>
nnoremap <Space>m :Marks<CR>
" hide object files
let g:netrw_list_hide='*\.o,*\.asm,*\.d'
" Function to toggle light/dark
let s:mybg = "dark"
fun! BgToggle()
  if (s:mybg ==? "light")
    set background=dark
    let s:mybg = "dark"
  else
    set background=light
    let s:mybg = "light"
  endif
endfun

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Opens the TagBar
nmap <Space>t :TagbarToggle<CR>

function! s:show_documentation()
  if(index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Auto fix to problem on current line
nmap <Space>qf <Plug>(coc-fix-current)

" Lower update time
set updatetime=300
" Give more space for displaying messages
set cmdheight=2
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset':0.5, 'highlight': 'Todo', 'border':'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

let g:shades_of_purple_airline = 1
"let g:airline_theme='shades_of_purple'
let g:airline_theme='base16_spacemacs'
" Encoding
set encoding=utf-8
set guicursor=n-v-c:block-Cursor
" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" FOR WINDOWS
" set fileformat=dos


" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" coc stuff
" This stops stupid highlighting
nnoremap <esc> :noh <return> <esc>
""""""""""""""""""""""""""""""
"   Easy motion stuff
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
map <Space>h <Plug>(easymotion-linebackward)
map <Space>l <Plug>(easymotion-lineforward)
let g:EasyMotion_smartcase = 1
""""""""""""""""""""""""""""""

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc Implementation 
let g:coc_global_extensions = ['coc-solargraph', 'coc-json', 'coc-git']
let g:coc_disable_startup_warning = 1
"fun! GoCoc()
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <buffer> <silent><expr> <C-space> coc#refresh()
"inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent><Space>gd <Plug>(coc-definition)
nmap <silent><Space>gy <Plug>(coc-type-definition)
nmap <silent><Space>gi <Plug>(coc-implementation)
nmap <silent><Space>gr <Plug>(coc-references)
"endfunction

" Automatically save and load folds
autocmd BufWinLeave *.* mkview

" Choose which autocomplete to use with which files
"autocmd BufWinEnter *.* silent loadview"

" Call the .vimrc.plug file
" if filereadable(expand("~/.vimrc.plug"))
"    source ~/.vimrc.plug
" endif

" Fix tmux rendering issues
if &term =~ '256color'
  set t_ut=
endif
let g:yats_host_keyword = 1
set re=0
"colorscheme materialtheme
set completeopt=menuone,preview
"set nocp
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"call pathogen#infect()
"call pathogen#helptags()
nnoremap <Space>f :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.o', '\.d', '\.asm', '\.sym', '^node_modules$']
"let g:ale_linters = {'javascript': ['eslint']}
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"colorscheme space-vim-dark
"let g:space_vim_dark_background = 233
"colorscheme summerfruit256
"colorscheme space_vim_theme
"colorscheme purify
"colorscheme onedark
"colorscheme xcodewwdc
"colorscheme shades_of_purple
"colorscheme candid
colorscheme gruvbox
let g:lightline = { 'colorscheme': 'candid' }
set background=dark
nnoremap <silent> <Space>bg :call BgToggle()<C-r>
