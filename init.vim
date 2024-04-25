" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" For plug-ins to load correctly.
filetype plugin indent on

syntax on
if(exists("+termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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

set mouse=a
" Display options
set showmode
set showcmd
call plug#begin('~/.config/nvim/plugged') 
" Github copilot
Plug 'github/copilot.vim'
"call plug#begin(stdpath('data') . '/plugged')
"Fugitive Vim Github Wrapper
"Plug 'tpope/vim-fugitive'
" Lisp
" ctrlp
"Plug 'git@github.com:kien/ctrlp.vim.git'

""AutoComplete
"Plug 'ycm-core/YouCompleteMe'
" Plug 'HiPhish/rainbow-delimiters.nvim'
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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'HerringtonDarkHolme/yats.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'maxmellon/vim-jsx-pretty'
"Plug 'peitalin/vim-jsx-typescript', {'for':  'typescriptreact'}
"color schemes
"Plug 'flazz/vim-colorschemes'
Plug 'kyoz/purify', {'rtp': 'vim'}
""Ruby for vim
Plug 'vim-ruby/vim-ruby'
"Typescript for vim
""JSX for vim
"Plug 'mxw/vim-jsx'
"Plug 'yuezk/vim-js'
"JSON highlighting
Plug 'elzr/vim-json'
"Markdown syntax
"Plug 'plasticboy/vim-markdown'
" Colorizor
Plug 'gko/vim-coloresque'
"Typescript syntax
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
"Plug 'morhetz/gruvbox'
"Plug 'ellisonleao/gruvbox.nvim'
Plug 'rafamadriz/gruvbox'
" One half light
Plug 'sonph/onehalf', { 'rtp': 'vim' }
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
"Plug 'kyazdani42/nvim-web-devicons'
" Tabs
Plug 'akinsho/bufferline.nvim'
""Linting
"Plug 'w0rp/ale'
" Ctags bar
Plug 'preservim/tagbar'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'APZelos/blamer.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TS syntax
"Plug 'HerringtonDarkholme/yats.vim'
Plug 'kovisoft/slimv'
"Plug 'skywind3000/vim-preview'
"Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }
Plug 'baeuml/summerfruit256.vim'
call plug#end()
" FZF
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
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

" Web icon
set termguicolors
lua << EOF
--require'nvim-web-devicons'.setup {
--default = true;
--}
require('bufferline').setup {
  options = {
    numbers = "none",
    --- @deprecated, please specify numbers as a function to customize the styling
    --number_style =  "" , -- buffer_id at index 1, ordinal at index 2
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,
    offsets = { filetype = "NERDTree", text = "File Explorer", text_align = "left" },
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style =  "thick" ,
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'tabs'
  } 
}
EOF
let g:blamer_enabled = 1
let g:blamer_delay = 500
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
let $FZF_DEFAULT_OPTS = "--layout=reverse --info=inline --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
nmap <silent> <C-P> :Files<CR>

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display

"let g:shades_of_purple_airline = 1
"let g:airline_theme='shades_of_purple'
"let g:airline_theme='base16_spacemacs'
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
" s{char}{label} to move to {char}
nmap s <Plug>(easymotion-overwin-f)
" Biderectional & within line 't' motion
map <Space>j <Plug>(easymotion-j)
" Biderectional word 
map <Space><Space>w <Plug>(easymotion-bd-w)
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

"set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
"syncing
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" Choose which autocomplete to use with which files
"autocmd BufWinEnter *.* silent loadview"

" higlighting for certain things
hi ReduxKeywords ctermfg=204 guifg=#c678dd
hi ReduxHooksKeywords ctermfg=204 guifg=#c176a7
hi ReactLifeCycleMethods ctermfg=204 guifg=#d19a66
hi ReactState guifg=#c176a7 
hi ReactProps guifg=#d19a66
hi tsxComponentName guifg=#F99575
hi tsxTagName guifg=#e06c75
hi tsxCloseComponentName guifg=#E06c75

" Call the .vimrc.plug file
" if filereadable(expand("~/.vimrc.plug"))
"    source ~/.vimrc.plug
" endif
" Do code action
nmap <Space>do <Plug>(coc-codeaction)

"conditionally enable eslint and prettier
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
"Auto diagnostic
"function! ShowDocIfNoDiagnostic(timer_id)
"  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
"    silent call CocActionAsync('doHover')
"  endif
"endfunction

"function! s:show_hover_doc()
"  call timer_start(500, 'ShowDocIfNoDiagnostic')
"endfunction

"autocmd CursorHoldI * :call <SID>show_hover_doc()
"autocmd CursorHold * :call <SID>show_hover_doc()
" Fix tmux rendering issues
if &term =~ '256color'
  set t_ut=
endif
let g:yats_host_keyword = 1
set re=0
"colorscheme materialtheme
set completeopt=menuone,preview
"set nocp
"let g:ctrlp_custom_ignore = 'node_modules\|/.git|PRjobs\|/platform\'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|java|groovy)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
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
set t_Co=256
set cursorline
"colorscheme onehalfdark
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
let g:airline_section_b= '%{strftime("%c")}'
"let g:airline#extensions#tabline#formatter = 'default'
"let g:lightline = { 'colorscheme': 'gruvbox' }
set background=dark
nnoremap <silent> <Space>bg :call BgToggle()<C-r>
"""
let g:rainbow_delimiters = {
    \ 'strategy': {
       \ '': rainbow_delimiters#strategy.global,
       \ 'vim': rainbow_delimiters#strategy.local,
    \ },
    \ 'query': {
       \ '': 'rainbow-delimiters',
       \ 'lua': 'rainbow-blocks',
    \ },
    \ 'priority': {
       \ '': 110,
       \ 'lua': 210,
    \ },
    \ 'highlight': [
       \ 'RainbowDelimiterRed',
       \ 'RainbowDelimiterYellow',
       \ 'RainbowDelimiterBlue',
       \ 'RainbowDelimiterOrange',
       \ 'RainbowDelimiterGreen',
       \ 'RainbowDelimiterViolet',
       \ 'RainbowDelimiterCyan',
    \ ],
\ }
"""
