set nocompatible
source $VIMRUNTIME/vimrc_example.vim
behave mswin

" java and xsl
au BufNewFile,BufReadPost *.java exe ":compiler ant"
au BufNewFile,BufReadPost *.xsl exe ":compiler xmllint"
au BufNewFile,BufReadPost *.xml exe ":compiler xmllint"

" actionscript
au BufNewFile,BufReadPost *.as exe ":set filetype=actionscript"

set background=dark
set mouse=nv
set shiftwidth=4
set tabstop=4
set expandtab
set ignorecase
set smartcase
set cinoptions=g0,h1s,l1s,:1
set scrolloff=2
map <F6> :b#<CR>
set pastetoggle=<f5>
set number
set wildignore=*.o,*.obj,*.bak,*.exe
map <leader>td <Plug>TaskList
map <F2> :NERDTreeToggle<CR>
nmap <F4> :w<CR>:make<CR>:cw<CR>
set backupdir=~/.tmp
set hidden
command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort

nnoremap ' `
nnoremap ` '

let g:solarized_contrast="high"
color solarized
set t_Co=256 
