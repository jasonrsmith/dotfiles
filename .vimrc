set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/fzf

call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'bling/vim-airline'
Bundle 'brookhong/DBGPavim'
Bundle 'docteurklein/php-getter-setter.vim'
Bundle 'eshion/vim-sync'
Bundle 'flazz/vim-colorschemes'
Bundle 'jeroenbourgois/vim-actionscript'
Bundle 'junegunn/vim-emoji'
Bundle 'ctrlpvim/ctrlp.vim'
"Bundle 'Lokaltog/vim-powerline'
"Bundle 'm2mdas/phpcomplete-extended'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
"Bundle 'Shougo/unite.vim'
"Bundle 'Shougo/vimproc.vim'
Bundle 'tmhedberg/matchit'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-rsi'
"Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-surround'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/smarty-syntax'
" Bundle 'spf13/PIV'
Bundle 'honza/vim-snippets'

" php
Bundle 'joonty/vim-phpunitqf.git'
Bundle 'tobyS/pdv'
Bundle 'tobyS/vmustache'
Bundle 'shawncplus/phpcomplete.vim'

Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'

Bundle 'arnaud-lb/vim-php-namespace'
"Bundle 'craigemery/vim-autotag'

Bundle 'vim-php/vim-composer'
Bundle 'jasonrsmith/vim-phpthings'
"Bundle 'vim-scripts/php_localvarcheck.vim'

Bundle 'janko-m/vim-test'

Bundle 'kassio/neoterm'

" vim-scripts repos
" non github repos
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" end vundle

source $VIMRUNTIME/vimrc_example.vim
behave mswin

" actionscript
au BufNewFile,BufReadPost *.as exe ":set filetype=actionscript"

set background=dark
set mouse=a
set shiftwidth=2
set tabstop=2
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
set backupdir=~/tmp
set hidden
command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort
let mapleader = "\<Space>"

nnoremap ' `
nnoremap ` '

"let g:solarized_contrast="high"
"color solarized
set t_Co=256 
color Tomorrow-Night-Eighties
let g:Powerline_symbols = 'fancy'
set laststatus=2
"highlight LineNr ctermfg=8

" disable press enter to continue messages
set shortmess=a
set cmdheight=1
set verbose=0

" Tab between buffers
noremap <tab> <c-w><c-w>

" syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php']

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ack location
" let g:ackprg = "$HOME/bin/ack"

" tagbar
nmap <F8> :TagbarToggle<CR>

" ack
nmap <C-d> :Ag 

" vim-sync
autocmd BufWritePost * :call SyncUploadFile()
autocmd BufReadPre * :call SyncDownloadFile()

" fugitive
autocmd QuickFixCmdPost *grep* cwindow
nmap <leader>gau :Git add -u<cr>
nmap <leader>gaf :Git add %:p<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :silent! Glog<CR>:bot copen<CR>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Gpush<cr>

" quickfix
nmap <leader>qo :cw<cr> " Open it if there are "errors", close it otherwise
nmap <leader>qn :cn<cr> " next error
nmap <leader>qf :cnf<cr> " first error
nmap <leader>ql :ccl<cr> " close 


" ctrlp
nmap <C-k> :CtrlPCurFile<CR>

" fzf
" nmap <C-o> :FZF<CR>
" List of buffers
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" convert underscores to camel and back
nnoremap + /\w\+_<CR>
nnoremap _ f_x~

"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'rw'

let g:NERDTreeChDirMode       = 2
let g:NERDTreeWinSize=35
map <leader>r :NERDTreeFind<cr>

" DBGPavim
let g:dbgPavimPort = 9666

" spf13 php
let g:DisableAutoPHPFolding = 1

" phpunit
nmap <F9> :Test<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" php docblock snips
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-o> :call pdv#DocumentWithSnip()<CR>

" php exapnd
noremap <Leader>e :call PhpExpandClass()<CR>

noremap <Leader>u :call PhpInsertUse()<CR>

" " set tags
" set tags+=./tags.vendors,tags.vendors
" 
" function! DelTagOfFile(file)
"   let fullpath = a:file
"   let cwd = getcwd()
"   let tagfilename = cwd . "/tags"
"   let f = substitute(fullpath, cwd . "/", "", "")
"   let f = escape(f, './')
"   let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
"   let resp = system(cmd)
" endfunction
" 
" function! UpdateTags()
"   let f = expand("%:p")
"   let cwd = getcwd()
"   let tagfilename = cwd . "/tags"
"   let cmd = 'ctags -a -f ' . tagfilename . ' -R --fields=+aimS --languages=PHP --exclude=vendor/*test --exclude=vendor/*Test --exclude=*proxies ' . '"' . f . '"'
"   call DelTagOfFile(f)
"   let resp = system(cmd)
" endfunction
" autocmd BufWritePost *.php call UpdateTags()
" 

au! BufWritePost *.vim so %
au! BufWritePost .vimrc so %
"let maplocalleader = "<C-\>"

" terminal
tnoremap <F12> <C-\><C-n> 
set switchbuf+=useopen
function! TermEnter()
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, "term://") > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
        break
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches >= 1)
    execute ":sbuffer ". firstmatchingbufnr
    startinsert
  else
    execute ":terminal"
  endif
endfunction
map <F12> :call TermEnter()<CR>
function! PhpUnit()
  call TermEnter()
  normal i phpunit
endfunction
map <F11> :call PhpUnit()<CR>
