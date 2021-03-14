set shell=/bin/bash

" Plugins
call plug#begin()
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
" Plug 'morhetz/gruvbox'
Plug 'benekastah/neomake'
Plug 'ciaranm/securemodelines'
Plug 'rust-lang/rust.vim'
" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
"Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

Plug 'dpelle/vim-LanguageTool'

" LaTeX
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lervag/vimtex'
"Plug 'sirver/ultisnips'
Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for VimPlug

" Syntax
Plug 'vim-syntastic/syntastic'
Plug 'honza/vim-snippets'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'wincent/command-t'
Plug 'mg979/vim-studio-dark'
"Plug 'joonty/vdebug'
Plug 'rhysd/vim-clang-format'
" Plug 'tomasiser/vim-code-dark'
" Plug 'ludovicchabant/vim-gutentags'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'tpope/vim-fugitive'
Plug 'chiel92/vim-autoformat'
Plug 'sbdchd/neoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'andymass/vim-matchup'
Plug 'shougo/deoplete.nvim'
Plug 'sainnhe/forest-night'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
Plug 'anned20/vimsence'
call plug#end()
"-----------------------------------------------------------------
" colorscheme vsdark
" Editor options 
" colorscheme base16-default
" let g:Vsd = {}

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
"
" set background=dark
set laststatus=2

set incsearch
set hlsearch
set smartcase

set background=dark
set signcolumn=yes
set relativenumber " Relative line numbers
set synmaxcol=512
" set colorcolumn=86 " and give me a colored column
set laststatus=2

"=================================================================

" Language Options
" let g:LanguageClient_settingsPath = $HOME . '/.config/nvim/settings.json'
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/predaking2612/.config/nvim/settings.json'
let g:LanguageClient_autoStart = 1
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

autocmd CursorHold * silent call CocActionAsync('highlight')

" =================================================================
" deal with colors

set t_Co=256
set termguicolors
" colorscheme naysayer88

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

" nnoremap <up> <nop>
" nnoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" -----------------------------------------------------------------

" let g:gruvbox_termcolors=16
" let g:gruvbox_contrast_dark = 'hard'
" nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
" nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
" nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

" nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
" nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
" nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
" colorscheme gruvbox

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <C-p> :GFiles<CR>

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

au BufRead,BufNewFile *.stc setfiletype ul

"-----------------------------------------------------------------

" LaTeX
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a zathura'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

let g:tex_conceal_frac=1
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
let conceallevel=1
let g:tex_conceal='abdmg'

"#let g:UltiSnipsExpandTrigger = '<tab>'
"#let g:UltiSnipsJumpForwardTrigger = '<tab>'
"#let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

nmap <F12> :LLPStartPreview<cr>

" CPP Options
" Cpp Enhanced Highlighting {{{
let g:cpp_class_scope_highlight = 1
" }}}

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~25%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Set mapleader
let mapleader = "\\"

" Buffer swap
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

" =====================================

map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" ===============================================================
"

" This is new style
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Coc-Explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Spelling
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Use preset argument to open it
nmap <space>ed :CocCommand explorer --preset .vim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>
" Tagbar
nmap <F8> :TagbarToggle<CR>

" List all presets
nmap <space>el :CocList explPresets

