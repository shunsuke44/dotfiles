if &compatible
  set nocompatible
endif

set backspace=indent,eol,start
set history=100
set ruler
set showcmd
set ttimeout
set ttimeoutlen=100
set display=truncate
set scrolloff=5
set laststatus=2
set number
set cursorline
set virtualedit=block
set showmatch
set matchtime=1
set updatetime=1000
set signcolumn=yes
set list
set listchars=eol:↵,trail:•,tab:>-
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent
set incsearch
set hlsearch
set ignorecase
set smartcase
set splitbelow
set splitright
set nobackup
set noswapfile
set encoding=utf-8
let g:mapleader=" "

syntax enable
filetype plugin indent on


" Keymappings
nnoremap <F2> :let @/=""<CR>

" window navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
" make undo checkpoint before using CTRL-u
inoremap <C-u> <C-g>u<C-u>

" terminal
tnoremap <ESC> <C-\><C-n>

map Q gq

" Autocommands
augroup RemoveWhiteSpaceOnSave
  au!
  au BufWritePre * :%s/\s\+$//e
augroup END

" Tab width configurations
augroup TabWidthConfig
  au!
  au FileType
    \ html,htmldjango,css,scss,yaml,vim,json,javascript,typescript,typescriptreact,lua,gohtmltmpl,cpp
    \ setlocal sw=2 ts=2
augroup END

" golang tab configuration
augroup GoTabConfig
  au!
  au FileType go setlocal noet
augroup END

" =====================
"     vim-plug
" =====================
call plug#begin()

" color schemes
Plug 'jacoborus/tender.vim'

" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" git
Plug 'tpope/vim-fugitive',
Plug 'airblade/vim-gitgutter',

" other tools
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" ===========================
"     Lsp Settings
" ===========================
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> <leader>k <plug>(lsp-hover)
endfunction

augroup lsp_setting
  au!
  au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ===========================
"     Completion Settings
" ===========================
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"

" ===========================
"     Plugin settings
" ===========================
" NERDTree
let g:NERDTreeShowHidden=1
let g:NERDTreeSortHIddenFirst=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>b :Buffers<CR>

" airline
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_modified=1

" emmet
let g:user_emmet_install_global=0

" vim-go
let g:go_code_completion_enabled=0
let g:go_def_mapping_enabled=1

colorscheme tender
