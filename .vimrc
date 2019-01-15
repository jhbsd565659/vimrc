colorscheme dracula
set statusline=[%n]\ %t%m%r%h%w\ (%l,%v)\ [%P/%L]\ %=%{&fileencoding}%y
set shortmess+=I
set laststatus=2 
set fileformats=unix,dos,mac
set fileformat=unix
set autoread
set nobackup
set incsearch
set wrapscan
set backspace=indent,eol,start
set shiftwidth=0
set tabstop=4
set nohlsearch
set noswapfile
set history=1000
set ruler
set title
set cursorcolumn
set cursorline
set noundofile
set number
set nosmartindent
set noautoindent
set fileencoding=utf-8
set fileencodings=utf-8,cp932
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=T
set guioptions-=m
set guifont=MS_Gothic:h9
set iminsert=0
set imsearch=-1
set hlsearch
set autochdir
set list
set listchars=tab:\|\ ,trail:.
syntax on
nnoremap gr gT
nnoremap tt :<C-u>tabnew<cr>

"=========================================================================
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]
    let no = i
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'


nnoremap    [Tag]   <Nop>
nmap    t [Tag]
for n in range(1, 256)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
