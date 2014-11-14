call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

set rtp+=/usr/lib/google-golang/misc/vim

" Indentation settings, WebKit style
fun! UseWebKitStyle()
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
  set textwidth=0
  if version >= 730
    set colorcolumn=
  else
    if exists("w:m2")
      call matchdelete(w:m2)
      unlet w:m2
    endif
  endif
endfun
command! Wks call UseWebKitStyle()

" Indentation settings, Chromium style
fun! UseChromiumStyle()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set textwidth=80
  if version >= 730
    set colorcolumn=80
  else
    if exists("w:m2")
      call matchdelete(w:m2)
      unlet w:m2
    endif
    let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif
endfun
command! Crs call UseChromiumStyle()

" *.cc default to chromium style
autocmd BufWinEnter *.cc call UseChromiumStyle()
autocmd BufWinEnter *.gyp call UseChromiumStyle()
autocmd BufWinEnter *.gypi call UseChromiumStyle()
autocmd BufWinEnter *.gn call UseChromiumStyle()
autocmd BufWinEnter *.gni call UseChromiumStyle()
autocmd BufWinEnter *.h call UseChromiumStyle()
" *.cpp default to chromium style
autocmd BufWinEnter *.cpp call UseWebKitStyle()

" general / code settings
syntax on
set cindent
set expandtab
set wildmode=longest,list,full
set ruler
set linebreak
autocmd BufEnter * lcd %:p:h
set tags=./tags;
set history=100
set autoread
set incsearch
set hlsearch
filetype plugin on
set backspace+=indent,eol,start

" Capslock is mapped to 'Help', so map it to Esc
map <Help> <Esc>
map! <Help> <Esc>
map <Insert> <Esc>
map! <Insert> <Esc>

nnoremap gp "+p
nnoremap gP "+P
vnoremap gy "+y

" Be quiet and don't make crap files
set noerrorbells
set nobackup
set nowb
set noswapfile

" Persistent undo (7.3+ only)
if version >= 730
    set undodir=~/.vim_runtime/undodir
    set undofile
endif

" a.vim for obj-c and obj-c++
let g:alternateExtensions_mm = "h,ccc"
let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "cc,cpp,c,cxx,mm,m"

" quickopen
noremap <silent> <C-O> <Esc>:O<CR>

" map Ctrl-<direction> to move between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

if !has("gui_running")
  set background=dark
endif

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'fatih/vim-go'

"source /usr/share/vim/google/google.vim
"Glug youcompleteme-google

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

so /hd2/chrome/src/tools/vim/ninja-build.vim
