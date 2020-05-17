" Plugins
call plug#begin()
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox'
Plug 'benekastah/neomake'
Plug 'ciaranm/securemodelines'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'wincent/command-t'
Plug 'joonty/vdebug'
Plug 'rhysd/vim-clang-format'
" Plug 'tomasiser/vim-code-dark'
Plug 'majutsushi/tagbar'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'tpope/vim-fugitive'
Plug 'chiel92/vim-autoformat'
Plug 'sbdchd/neoformat'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'shougo/deoplete.nvim'
Plug 'sainnhe/forest-night'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
call plug#end()
"-----------------------------------------------------------------

" Editor options 
" [NIL] colorscheme base16-default

syntax enable

set number
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent

set showmatch
set showcmd
" set cursorline
set background=dark
set laststatus=2

set incsearch
set hlsearch
set smartcase

set background=dark
set signcolumn=yes
set relativenumber " Relative line numbers
set synmaxcol=512

"=================================================================

" Language Options
" let g:LanguageClient_settingsPath = $HOME . '/.config/nvim/settings.json'
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/predaking2612/.config/nvim/settings.json'
let g:LanguageClient_autoStart = 1
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

" =================================================================

" deal with colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

let base16colorspace=256

" =================================================================
" No arrow keys --- force yourself to use the home row
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" -----------------------------------------------------------------

let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark = 'hard'
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
colorscheme gruvbox

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <C-p> :GFiles<CR>

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

"-----------------------------------------------------------------

" CPP Options
" Cpp Enhanced Highlighting {{{
let g:cpp_class_scope_highlight = 1
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}



" ===============================================================
