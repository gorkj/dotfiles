"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'rking/ag.vim'
NeoBundle 'samsonw/vim-task'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'will133/vim-dirdiff'

NeoBundle 'DrawIt'

NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak', } }

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let mapleader = ","

syntax on

set expandtab shiftwidth=4 tabstop=4 nowrap
set noerrorbells visualbell showmatch ruler modeline
set autoindent smartindent backspace=2
set incsearch hlsearch ignorecase
set foldmethod=indent foldlevelstart=1 nofoldenable
set nocursorline nocursorcolumn wildmenu modeline startofline
"set virtualedit=all
set guioptions=
"set listchars=tab:»\ ,trail:·
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nolist linebreak
set number

nmap <Leader>, :bn<CR>
nmap <Leader>. :bp<CR>
nmap <Leader>b :buffers<CR>
nmap <Leader>d :bp\|bd #<CR>
nmap <Leader>e :e $MYVIMRC<CR>
nmap E :Eval<CR>
nmap <Leader>h :set hlsearch!<CR>
nmap <Leader>j :%!python -m json.tool<CR>
nmap <Leader>l :set list!<CR>
nmap <Leader>m :make<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>N :set number!<CR>
nmap <Leader>p :CtrlP<CR>
nmap <Leader>q :qa<CR>
nmap <Leader>s :source %<CR>
nmap <Leader>t :call ToggleShowTrailingWhitespace()<CR>
nmap <Leader>T :TW<CR>
nmap <Leader>w :w<CR>
nmap <Leader>W :set wrap!<CR>
nmap <Leader>x :%!tidy -q -i -xml -wrap 1000<CR>
nmap <Leader>g <Ctrl-]>
call togglebg#map("<Leader>c")
nnoremap Q gq}

nmap ,W :%s/\s\+$//g<CR>
nmap ,L :%s/\r//g<CR>

" Nicer font and colorscheme
set background=dark
if has("gui_running")
    colorscheme solarized
    if has("gui_gtk2")
        set guifont=Inconsolata\ 16
    else
        set guifont=Inconsolata:h16.00
    endif
endif

" Reload vimrc when it is changed
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

set formatprg=par\ w

" Custom filetype settings
"au FileType php set sw=4 ts=4 noet
"au FileType yaml set sw=2 ts=2 et

au BufNewFile,BufRead *.ad set filetype=asciidoc
au FileType asciidoc set tw=80 wm=80

au BufNewFile,BufReadPost *.md set filetype=markdown
au FileType markdown set tw=80 wm=80

" Identify trailing whitespace
let g:trailing_whitespace_shown = 0
function! ToggleShowTrailingWhitespace()
    highlight TrailingWhitespace ctermbg=darkred guibg=darkred
    if g:trailing_whitespace_shown
        let g:trailing_whitespace_shown = 0
        match TrailingWhitespace //
    else
        match TrailingWhitespace /\s\+$/
        let g:trailing_whitespace_shown = 1
    endif
endfunction

" allow for per folder customization
if filereadable(".vim.custom")
    so .vim.custom
endif
