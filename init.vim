let mapleader=" "

call plug#begin()

" EASIER CODING
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'github/copilot.vim'
Plug 'dkprice/vim-easygrep'

" NERD TREE 
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
Plug 'ryanoasis/vim-devicons'

" MISC
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-gitgutter'
Plug 'KabbAmine/vCoolor.vim'

" THEMES
Plug 'morhetz/gruvbox'
Plug 'andreasvc/vim-256noir'
Plug 'nikolvs/vim-sunbather'
Plug 'jaredgorski/SpaceCamp'
Plug 'sainnhe/sonokai'
Plug 'romainl/Apprentice'
Plug 'ajmwagar/vim-deus'
Plug 'romainl/flattened'
Plug 'endel/vim-github-colorscheme'

call plug#end()

" colorscheme apprentice
colorscheme deus
set background=dark

syntax enable
filetype plugin indent on
set exrc
set autoindent
set smartindent
set nohlsearch
set hidden
set expandtab
set shiftround
set smarttab
set tabstop=2
set shiftwidth=2
set number
set relativenumber
set number
set incsearch
set ignorecase
set smartcase
set nowrap
set noerrorbells
set title
set encoding=utf-8
set noswapfile
set colorcolumn=80
set signcolumn=yes
set guicursor=a:block

" VIM REBINDS 
inoremap jk <Esc>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" PLUGIN REBINDS
noremap <leader><tab> :NERDTreeToggle<CR>
noremap <leader>p :Files<CR>
noremap <leader>rn <Plug>(coc-rename)
noremap <leader>f <Plug>(coc-definition)
noremap <leader>co :VCoolor<CR>
" noremap <leader>f :Prettier<CR>

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ kite#completion#autocomplete()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:vcoolor_disable_mappings = 1

let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print' " DISABLES FZF FROM SEARCHING NODE_MODULES AND .GIT 


" PRETTIER CONFIG
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

" let g:context#commentstring#table['javascript.jsx'] = {
" 			\ 'jsComment' : '// %s',
" 			\ 'jsImport' : '// %s',
" 			\ 'jsxStatment' : '// %s',
" 			\ 'jsxRegion' : '{/*%s*/}',
" \}
let g:vcoolor_lowercase = 1
let g:NERDTreeWinPos = "right"

