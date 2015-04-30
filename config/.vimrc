""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto reload vimrc
autocmd bufwritepost .vimrc source $MYVIMRC

" Be IMproved
set nocompatible

" file encodings
set fileencodings=utf-8,cp936,big5,gb2312,gbk,gb18030
" internal encoding
set encoding=utf-8

" Set wild menu & mode
set wildmenu

" set wild mode
set wildmode=longest:full,full

" Auto change current directory
set autochdir

set mouse=a

" Lines folding
" set foldenable
" set foldnestmax=1
" set foldmethod=syntax

set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme
colorscheme elflord

" Enable syntax highlight
syntax on

"show mode
set showmode

" Show ruler
set ruler

" Dynamic title
set title

" Display line number
set number
"set relativenumber

" Always have a status line
set laststatus=2

" Allow to display incomplete line
set display=lastline

" cursor line
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight search things
set hlsearch

" Ignore case when searching
set smartcase
set ignorecase

" Incremental match when searching
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart indet
set smartindent

" tab
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

filetype plugin indent on
"for xhtml
autocmd FileType xhtml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
"for python
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
"for c 
autocmd FileType c setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
"for wiki
autocmd FileType flexwiki setlocal expandtab tabstop=8 shiftwidth=4 softtabstop=4
"for mail
autocmd FileType mail set textwidth=72
"for markdown
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd

" Set auto-formating
set formatoptions+=mM
set nowrap

" Set go for gvim
set go=
set mousemodel=popup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move one line
noremap j gj
noremap k gk

" Tab naviation
nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap gf <C-W>gf

" Textwidth=78
noremap tw :set textwidth=78

" Move among windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-x> <C-W>x
noremap <C-W> <C-W><C-W>
noremap ^ <C-W>+
noremap & <C-W>-
noremap < <C-W><
noremap > <C-W>>
noremap ! <C-W>=
noremap _ <C-W>_
noremap \| <C-W>\|

" Line completion
inoremap <c-l> <c-x><c-l>
" Filename completion
inoremap <c-f> <c-x><c-f>

" write copy and paste
noremap <F2> :w<CR>
inoremap <F2> <esc>:w<cr>a

" f3 copy sesected to xsel
vmap <F3> :w !xsel -i -p<CR><CR>

" f4 paste through xsel
noremap <F4> :r!xsel -p<CR>
inoremap <F4> <ESC>:r!xsel -p<CR>

"insert [time]
noremap <F5> :read !date +"\%a \%b \%d, \%Y"<cr>o- - -<esc>o<esc>
inoremap <F5> <esc>:read !date +"\%a \%b \%d, \%Y"<cr>o- - -<esc>o<esc>

" NERDTreeToggle
nnoremap <silent> <F6> :NERDTreeToggle<CR>
inoremap <silent> <F6> <ESC>:NERDTreeToggle<CR>

" Quickfix window
nnoremap <F7> :call ToggleList("Quickfix List", 'c')<CR>
inoremap <F7> <ESC>:call ToggleList("Quickfix List", 'c')<CR>

" Toggle Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
inoremap <silent> <F8> <ESC>:TagbarToggle<CR>

" Grep search tools
nnoremap <F9> :Rgrep<CR>

" Save & Make
nnoremap <F10> :w<CR>:make! %< CC=gcc CFLAGS="-g -Wall"<CR>:!./%<<CR>
inoremap <F10> <ESC>:w<CR>:make! %< CC=gcc CFLAGS="-g -Wall"<CR>:!./%<<CR>

" quickfix, cn cp
nnoremap <silent> <F11> :cprev<CR>
inoremap <silent> <F11> <ESC>:cprev<CR>
nnoremap <silent> <F12> :cnext<CR>
inoremap <silent> <F12> <ESC>:cnext<CR>

" Cscope mappings
nmap <C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <S-s> :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <S-g> :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <S-c> :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <S-e> :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <S-f> :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <S-i> :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <S-d> :scs find d <C-R>=expand("<cword>")<CR><CR>

" change leader key to ,
let mapleader = ","
" vim-EasyMotion_leader_key 
let g:EasyMotion_leader_key = '<Leader>'

" Use <space> to toggle fold
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au FileType c,cpp so ~/.vim/c.vim

" Ctrl - \ inputmethod
let g:vimim_map='c-bslash'

" Set Tagbar width
let tagbar_width = 35

" Super tab completion type
let g:SuperTabDefaultCompletionType = "context"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Quickfix function
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

"nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
"nmap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Align'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Tagbar'
Bundle 'vim-scripts/fcitx.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'snipMate'
" Bundle 'SuperTab--Van-Dewoestine'
Bundle 'grep.vim'
Bundle 'DrawIt'
Bundle 'xml.vim'
Bundle 'git://github.com/plasticboy/vim-markdown.git'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'taglist.vim'
Bundle 'winmanager'
"let g:solarized_termcolors=256
colorscheme solarized
set background=dark

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

set nocscopeverbose " suppress 'duplicate connection' error

function! AutoLoadCScope()
    let max = 20
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'cscope.out') 
            execute 'cs add ' . dir . 'cscope.out'
            let break = 1
        endif
        if break == 1
            execute 'lcd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endf

call AutoLoadCScope()

filetype plugin on
filetype plugin indent on
