set nocompatible
set encoding=utf-8
scriptencoding utf-8
filetype off

set rtp+=~/.fzf

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir        = '$HOME/.vim'
let &runtimepath .= ','.vimDir

" https://github.com/SirVer/ultisnips/issues/996
if has('python3')
  silent! python3 1
endif

call plug#begin('~/.vim/plugged')

" status line
Plug 'morhetz/gruvbox'
" emojis in gutter - not used?
Plug 'junegunn/vim-emoji'
" fuzzy filename search
Plug 'kien/ctrlp.vim'
" tagbar <f8>
Plug 'majutsushi/tagbar'
" automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
" ctrl-d - global regex search
"Plug 'rking/ag.vim'
" f2 - file browser
Plug 'scrooloose/nerdtree'
" extends % matching
Plug 'tmhedberg/matchit'
" search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'
" gcc to comment out a line (takes a count), gc to comment out the target of a
" motion (for example, gcap to comment out a paragraph), gc in visual mode to
" comment out the selection, and gc in operator pending mode to target a
Plug 'tpope/vim-commentary'
" wisely add end in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-endwise'
" git, see below
Plug 'tpope/vim-fugitive'
" CTRL+X / to close tag
Plug 'tpope/vim-ragtag'
" enhanced .
Plug 'tpope/vim-repeat'
" Readline style insertion
Plug 'tpope/vim-rsi'
" change surrounding things
" cs<value><repl> - replace
" ds<value> - delete
" ysiw<value> - add to text object
Plug 'tpope/vim-surround'
" doesn't work?
Plug 'junegunn/fzf.vim'
" :Tab /=
Plug 'godlygeek/tabular'
Plug 'mattn/calendar-vim'
" toggle display of quickfix and location-list
Plug 'Valloric/ListToggle'
" improved ansi escape sequences
Plug 'powerman/vim-plugin-AnsiEsc'
" shortcut shower
Plug 'sunaku/vim-shortcut'
Plug 'airblade/vim-gitgutter'
Plug 'lvht/tagbar-markdown'
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'JamshedVesuna/vim-markdown-preview'

" tabs
"Plug 'ervandew/supertab'
Plug 'neitanod/vim-clevertab'

" colors
"Plug 'liuchengxu/space-vim-dark'
"Plug 'AlessandroYorba/Alduin'
"Plug 'zacanger/angr.vim'
"Plug 'AlessandroYorba/Sierra'
"Plug 'rakr/vim-two-firewatch'
"Plug 'fatih/molokai'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'junegunn/seoul256.vim'

" php
Plug 'docteurklein/php-getter-setter.vim'
Plug 'joonty/vim-phpunitqf.git'
Plug 'tobyS/pdv'
Plug 'tobyS/vmustache'
Plug 'shawncplus/phpcomplete.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'vim-php/vim-composer'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'vim-scripts/smarty-syntax'
Plug 'lvht/phpcd.vim'
Plug 'ryanoasis/vim-devicons'
" my custom php stuff
Plug 'jasonrsmith/vim-phpthings'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" go
Plug 'fatih/vim-go'

" gS gJ
Plug 'AndrewRadev/splitjoin.vim'

" asynch lint engine
Plug 'w0rp/ale'

" automated bullet lists
Plug 'dkarter/bullets.vim'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'zchee/deoplete-go', { 'do': 'make'}

" <F4> test in tmux split
Plug 'benmills/vimux-golang'
Plug 'benmills/vimux'

" start screen
Plug 'mhinz/vim-startify'

" ,ww - todo list/wiki
" ,w,w - diary
Plug 'vimwiki/vimwiki'

Plug 'hashivim/vim-terraform'

Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

" typescript formatter
Plug 'leafgarland/typescript-vim'
" typescript ide stuff
Plug 'Quramy/tsuquyomi'

" gdscript
Plug 'calviken/vim-gdscript3'
Plug 'syskrank/vim-gdscript-ctags'

Plug 'phanviet/vim-monokai-pro'

Plug 'craigemery/vim-autotag'

" python docs and autocompletion
Plug 'davidhalter/jedi-vim'


" custom stuff
"Plug 'jasonrsmith/vim-custom'

call plug#end()

filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set background=dark
set mouse=nv
set shiftwidth=2
set tabstop=2
set expandtab
set cinoptions=g0,h1s,l1s,:1
set scrolloff=2
set wildignore=*.o,*.obj,*.bak,*.exe
set backupdir=~/tmp
set ttyfast                     " Indicate fast terminal conn for faster redraw
if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=3                 " Speedup scrolling
endif
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw

" disable press enter to continue messages
"set shortmess=a
set cmdheight=1
set verbose=0

" colors
syntax enable
set guicursor=

" let g:enable_bold_font = 1
" set background=dark
" colorscheme molokai

set t_Co=256
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256
set termguicolors
colorscheme monokai_semipro

let mapleader = ","

" function keys
nnoremap <F2> :call MyNerdTreeToggle()<CR>
"nmap <F4> :w<CR>:make<CR>:cw<CR>
set pastetoggle=<f5>
map <F6> :b#<CR>
nmap <F8> :TagbarToggle<CR>

" Tab between buffers
function! SkipJumpWindows()
  if &buftype ==# 'quickfix' || &filetype ==# 'nerdtree' || &filetype ==# 'tagbar'
    wincmd w
    call SkipJumpWindows()
  endif
endfunction
noremap <silent><tab> <c-w><c-w> :call SkipJumpWindows()<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"nnoremap ' `
"nnoremap ` '

command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort

nmap <C-d> :Ag 

" Remove search highlight
" nnoremap <leader><space> :nohlsearch<CR>
function! s:clear_highlight()
  let @/ = ""
  call go#guru#ClearSameIds()
endfunction
nnoremap <silent> <leader><space> :<C-u>call <SID>clear_highlight()<CR>

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

" loclist
nmap <leader>ll :lopen<cr> " Open it if there are "errors", close it otherwise
nmap <leader>ln :lnext<cr> " next error
nmap <leader>lp :lnext<cr> " next error

" quickfix always open full bottom
autocmd FileType qf wincmd J

" convert underscores to camel and back
nnoremap + /\w\+_<CR>
nnoremap _ f_x~

"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
let g:NERDTreeWinSize=35
nmap ,n :NERDTreeFind<cr>
nmap ,m :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! MyNerdTreeToggle()
  echom "filetype:" . &filetype . ":"
  if &filetype != "nerdtree" && expand('%:p') =~ getcwd()
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction

let g:ctrlp_dont_split = 'NERD'

if !exists("*s:InsertDI")
  function! s:InsertDI()
    let restorepos = line(".") . "normal!" . virtcol(".") . "|"
    let s:firstline = a:firstline
    let s:lastline = a:lastline
    call s:ProcessRegionForInsertDI(s:GetRangeAsString(a:firstline, a:lastline))

    execute restorepos
    redraw!
  endfunction
endif
if !exists(":InsertDI")
  command -range -buffer
    \ InsertDI
    \ :<line1>,<line2>call s:InsertDI
endif
if !exists("*s:ProcessRegionForInsertDI")
  function s:ProcessRegionForInsertDI(region)
    let startPosition = match(a:region, s:variable, 0)
    let endPosition = matchend(a:region, s:variable, 0)

    while startPosition != -1
      let result = strpart(a:region, startPosition, endPosition - startPosition)

      "call s:DebugParsing(result)
      call s:ProcessVariableForDI(result)

      let startPosition = match(a:region, s:variable, endPosition)
      let endPosition = matchend(a:region, s:variable, endPosition)
    endwhile

  endfunction
endif
if !exists("*s:ProcessVariableForDI")
  function s:ProcessVariableForDI(variable)
    let s:indent    = substitute(a:variable, s:variable, '\1', '')
    let s:varname   = substitute(a:variable, s:variable, '\4', '')
    let s:funcname  = toupper(s:varname[0]) . strpart(s:varname, 1)

    " If any getter or setter already exists, then just return as there
    " is nothing to be done.  The assumption is that the user already
    " made his choice.
    if s:AlreadyExists()
      return
    endif

    if s:getter
      call s:InsertGetter()
    endif

    if s:setter
      call s:InsertSetter()
    endif

  endfunction
endif

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsUsePythonVersion = 3

" auto reload vimrc
au! BufWritePost *.vim so %
au! BufWritePost .vimrc so %
"let maplocalleader = "<C-\>"

" rename vars
" For local replace
nnoremap <Leader>r gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap <Leader>R gD:%s/<C-R>///gc<left><left><left>

" press <tab> to align hilighted region
if exists(":Tabularize")
  vnoremap <Tab> :Tabularize /=<CR>
  nmap <Leader>a= :Tabularize /=>?<CR>
  vmap <Leader>a= :Tabularize /=>?<CR>
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
""""""" end undo

" ale
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
"highlight clear ALEErrorSign
"highlight clear ALEWarningSign
"let g:ale_sign_error = 'x'
"let g:ale_sign_warning = ''
"let g:airline#extensions#ale#enabled = 1
"let g:go_auto_type_info = 1

" color column
" set colorcolumn=81

" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
autocmd FileType vimwiki nnoremap cc :call ToggleCalendar()<CR>

" golang
" run :GoBuild or :GoTestCompile based on the go file
" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
" nmap <C-g> :GoDeclsDir<cr>
" imap <C-g> <esc>:<C-u>GoDeclsDir<cr>
function! GoTest()
  :GoTest
  :VimuxRunCommand "clear; go test -v ./..."
  :cclose
endfunction

" TODO fix testing funcs
function! GoTestFunc()
  :GoTest
  :VimuxRunCommand "clear; go test -v ./..."
  ":GoTestFunc
  ":VimuxRunCommand "clear; go test ./..."
  :cclose
endfunction

function! GoImportList()
  if !executable('gopkgs')
    return s:warn('ag is not found')
  endif
  call fzf#run(fzf#wrap({'source': 'gopkgs', 'sink': 'GoImport'}))
endfunction

function! GoImportAndWrite(pkg)
  :GoImport a:pkg
endfunction
command! -nargs=1 FzfSinkGoImportAndWrite GoImport <f-args>

augroup go
  autocmd!

  "let g:deoplete#enable_at_startup = 1

  autocmd FileType go nmap <leader><C-i> :call GoImportList()<CR>

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  autocmd FileType go nmap <F4>  :exec GoTest()<CR>

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  " auto-identify
  "let g:go_auto_type_info = 1
  " same ids hilights
  "let g:go_auto_sameids = 1

  " show referrers
  autocmd FileType go nmap <Leader>e <Plug>(go-referrers)

  " GoRename
  autocmd FileType go nmap <Leader><F6> <Plug>(go-rename)

  " GoImpl
  autocmd FileType go nmap <Leader><F4> :GoImpl<CR>

  " Debug
  "let g:go_debug = ['shell-commands', 'debugger-state', 'debugger-commands']
  let g:go_debug = ['debugger-state', 'debugger-commands']
augroup END

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

nnoremap <C-n> :cnext<CR>
nnoremap <C-v> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" fzf
noremap <silent> <Leader><Leader> :Commands<Return>
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" open vimrc
nmap <C-\> :e ~/.vimrc<CR>

" neovim
if !has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
end

" airline and ui stuff
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
autocmd FileType nerdtree setlocal nolist
let g:airline_theme='distinguished'
set fillchars+=vert:│
"let g:airline_powerline_fonts = 1
"let g:bufferline_echo = 0 
"let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#enabled = 1
"set fillchars+=stl:\ ,stlnc:\
hi VertSplit ctermbg=NONE ctermfg=DarkGrey
set noerrorbells visualbell t_vb=
let g:airline_section_z = '%3p%% %{g:airline_symbols.linenr} %#__accent_bold#%3l%#__restore__#:%3v 𝐁 %5o'

" deoplete
"set pyxversion=2
" XXX performance

" autosave
" let g:auto_save = 1
let g:auto_save_no_updatetime = 1
" let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" let g:auto_save_silent = 1

" ticks
"set updatetime=2000

let g:ale_sign_column_always = 1

nmap zx :wa<CR>
nmap zq :wqa<CR>

" select paragraph
nmap zv (V)

" macos only
function! CopyToClipboard() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| pbcopy')
endfunction
command! -range -nargs=0 CopyToClipboard :<line1>,<line2>call CopyToClipboard()

" run things
let g:runselection_file=".vimrunlog"
function! RunSelection() range
  let viz = join(getline(a:firstline, a:lastline), "\n")
  let result = system(viz)
  if bufwinnr(g:runselection_file) > 0
    silent execute 'drop' g:runselection_file
  else
    silent execute 'vnew' g:runselection_file
    setlocal buftype=nofile bufhidden=hide noswapfile
  endif
  let now = system('echo -n `date "+[%c]"`')
  execute 'normal! gg'
  silent put =''
  silent put =now
  silent put =viz
  silent put =result
  execute 'normal! gg'
endfunction
command! -range=% -nargs=0 RunSelection :<line1>,<line2>call RunSelection()
vnoremap zr :call RunSelection()<CR>
nnoremap <F3> {V}:call RunSelection()<CR>

" quick buf delete
nnoremap zd :bd<CR>

" dgraph
"augroup dgraph
"augroup END

" vimwiki
" disable tabs
nmap <Leader>wn <Plug>VimwikiNextLink
let g:vimwiki_table_mappings = 0

"=====================================================
"===================== STATUSLINE ====================

let s:modes = {
      \ 'n': 'NRML', 
      \ 'i': 'INS ', 
      \ 'R': 'REPLACE', 
      \ 'v': 'VISUAL', 
      \ 'V': 'V-LINE', 
      \ "\<C-v>": 'V-BLOCK',
      \ 'c': 'COMMAND',
      \ 's': 'SELECT', 
      \ 'S': 'S-LINE', 
      \ "\<C-s>": 'S-BLOCK', 
      \ 't': 'TERMINAL'
      \}

let s:prev_mode = ""
function! StatusLineMode()
  let cur_mode = get(s:modes, mode(), '')

  " do not update higlight if the mode is the same
  if cur_mode == s:prev_mode
    return cur_mode
  endif

  " if cur_mode == "NORMAL"
  "   exe 'hi! StatusLine ctermfg=236'
  "   exe 'hi! myModeColor cterm=bold ctermbg=237 ctermfg=8'
  " elseif cur_mode == "INS"
  "   exe 'hi! myModeColor cterm=bold ctermbg=23 ctermfg=231'
  " elseif cur_mode == "VISUAL" || cur_mode == "V-LINE" || cur_mode == "V_BLOCK"
  "   exe 'hi! StatusLine ctermfg=236'
  "   exe 'hi! myModeColor cterm=bold ctermbg=208 ctermfg=88'
  " endif

  let s:prev_mode = cur_mode
  return cur_mode
endfunction

function! StatusLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! StatusLinePercent()
  return (100 * line('.') / line('$')) . '%'
endfunction

function! StatusLineLeftInfo()
 let branch = fugitive#head()
 let filename = '' != expand('%:t') ? expand('%:t') : '[No Name]'
 if branch !=# ''
   return printf("%s | %s", branch, filename)
 endif
 return filename
endfunction

function! PasteForStatusline()
  let paste_status = &paste

  if paste_status == 1
      return " [paste] "
  else
      return ""
  endif
endfunction

exe 'hi! myInfoColor ctermbg=240 ctermfg=252'

" start building our statusline
set statusline=

" mode with custom colors
set statusline+=%#myModeColor#
set statusline+=%{StatusLineMode()}               
set statusline+=%*

" left information bar (after mode)
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineLeftInfo()}
set statusline+=\ %*

" go command status (requires vim-go)
set statusline+=%#goStatuslineColor#
set statusline+=%{go#statusline#Show()}
set statusline+=%*

" right section seperator
set statusline+=%=

" filetype, percentage, line number and column number
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineFiletype()}\ %{StatusLinePercent()}\ %l:%v
set statusline+=\ %*
set statusline+=%{PasteForStatusline()}       " paste flag

" modelines are vulnerable
" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set nomodeline

" gdscript
augroup gdscript3
  autocmd BufNewFile,BufRead *.gd setlocal noexpandtab tabstop=4 shiftwidth=4

  let g:tagbar_type_gdscript3 = {
        \'ctagstype' :'gdscript',
        \'kinds':[
        \'c:constants',
        \'e:exports',
        \'o:onready',
        \'p:preloads',
        \'s:signals',
        \'f:functions',
        \]
        \}
augroup END

set list
"set listchars=tab:
set listchars=tab:»\ ,trail:·,eol:¬,nbsp:_

