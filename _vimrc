" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
winpos 10 10
set nowrap
set mouse=
set clipboard^=unnamed,unnamedplus
set noundofile
set nobackup
set noswapfile
set rnu
set tabstop=4
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[2 q"
"设置WindowsTerminal光标
nnoremap <Space> : 
nnoremap <CR> o<Esc>
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" 水平滚动
noremap <F7> 10zh
inoremap <F7> <ESC>10zhi
noremap <F8> 10zl
inoremap <F8> <ESC>10zli
inoremap <c-d> <ESC>ddi
nnoremap <esc>h <c-w>h
nnoremap <esc>k <c-w>k
nnoremap <esc>j <c-w>j
nnoremap <esc>l <c-w>l
nnoremap <c-w> a<c-w><ESC>
nnoremap <c-j> <c-d>
nnoremap <c-k> <c-u>
:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>

let g:plug_url_format='https://git::@github.com.cnpmjs.org/%s.git'
call plug#begin('~/.vim/plugged')

" Plug 'Valloric/YouCompleteMe'
Plug 'itchyny/lightline.vim'   

Plug 'lervag/vimtex'
   
 let g:vimtex_view_general_viewer = 'SumatraPDF'
 let g:vimtex_view_general_options
     \ = '-reuse-instance -forward-search @tex @line @pdf'
 let g:vimtex_view_general_options_latexmk = '-reuse-instance'

 let g:tex_flavor='latex'
 let g:vimtex_quickfix_mode=0
 let g:vimtex_flavor='latex'
 let g:vimtex_compiler_latexmk_engines={'_':'-xelatex'}
 let g:vimtex_compiler_latexrun_engines={'_':'-xelatex'}
 let g:vimtex_quickfix_mode=1
 let g:tex_conceal='abdmg'
 set conceallevel=1

Plug 'SirVer/ultisnips'

 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsJumpForwardTrigger="<tab>"
 let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
 let g:UltiSnipsEditSplit="vertical"

Plug 'KeitaNakamura/tex-conceal.vim'

 set conceallevel=1
 let g:tex_conceal='abdmg'
 hi Conceal ctermbg=none
 
Plug 'preservim/nerdtree'

 nnoremap <C-n> : NERDTreeToggle<CR>		

Plug 'kien/ctrlp.vim'

 let g:ctrlp_dont_split = 'NERD'

Plug 'FelikZ/ctrlp-py-matcher'

Plug 'tpope/vim-surround'

" Plug 'kana/vim-textobj-entire'

" Plug 'mhinz/vim-startify'
"

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 let g:airline_theme='base16_brushtrees_dark'

call plug#end()






function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

