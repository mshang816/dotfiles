" Setup vim backup directory, have to create ~/vi_backup 
set backupdir=~/vi_backup/
set backup

set bs=2

"autocmd! bufwritepost .vimrc source %

syntax on

" /usr/share/vim/vim63/colors/desert.vim
highlight Search term=reverse ctermbg=4 ctermfg=7
highlight Normal ctermbg=black ctermfg=white
highlight Folded ctermbg=black ctermfg=darkcyan
hi Comment ctermbg=black ctermfg=darkcyan

" status bar
set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine ctermfg=blue ctermbg=white

" hilight found words during search
set hlsearch

filetype on
set number
set cindent
set autoindent
set smartindent

" replace \t with 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set wildmenu

set foldmethod=marker

"imap <C-n> <Esc>:w<CR><Esc>
"nnoremap <silent> <F9> :set paste<CR>
"nnoremap S diw"0P

let Tlist_Use_Right_Window = 1
"nnoremap <F2> :q!<CR> 
nnoremap <F2> :TlistToggle<CR> 
"nnoremap <F3> :bp<CR>
"nnoremap <F4> :bn<CR>
nnoremap <F8> :tnext<CR>
nnoremap <F7> :tprevious<CR>
nnoremap <F6> :tselect<CR>

"nnoremap <F5> :nohl<CR>
nnoremap <F3> <C-w>w

"map <F8> :set hls!<BAR>set hls?<CR>

nnoremap <F9> :tabprevious<CR>
nnoremap <F10> :tabnext<CR>

" return to last position
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

"set tags=/home/mike/p4/snapshot/main_20100713/datapower/tags
"set tags=./tags,tags,$WORKDIR/datapower/tags,$WORKDIR/third-party/install/include/tags,/usr/include/tags
set tags=$WORKDIR/build/tags

"set cscopequickfix=s-,c-,d-,i-,t-,e-
"cs a $WORKDIR/datapower/cscope.out $WORKDIR/datapower

let g:vimgdb_debug_file = ""
run macros/gdb_mappings.vim

set cursorline 
hi cursorline guibg=#333333     " highlight bg color of current line
hi CursorColumn guibg=#333333   " highlight cursor 
"hi CursorLine cterm=NONE ctermbg=darkblue

set makeprg=make

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

set tw=0
set ignorecase
set smartcase
set incsearch
set novisualbell
set nowrap
