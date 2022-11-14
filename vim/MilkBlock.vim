
" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim
so ~/.vim/vim/init.vim
so ~/.vim/vim/skywind.vim

vmap "+y y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap "+p:call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
nmap <C-s> :w !sudo tee %<CR>

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
set nowrap
set tabstop=4
"colo industry
set mouse=
set timeoutlen=500
" set clipboard^=unnamed,unnamedplus
set noundofile
set nobackup
set noswapfile
set rnu
set ignorecase
" set tabstop=4
 "   let &t_SI = "\<Esc>[6 q"
 "   let &t_SR = "\<Esc>[3 q"
 "   let &t_EI = "\<Esc>[2 q"
"设置WindowsTerminal光标

" inoremap jk <ESC>
nnoremap <space> :
vnoremap <space> :
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" 水平滚动
noremap <F7> 10zh
inoremap <F7> <ESC>10zhi
noremap <F8> 10zl
nnoremap g\ 2g;a
inoremap <F8> <ESC>10zli
nnoremap <esc>h <c-w>h
nnoremap <esc>k <c-w>k
nnoremap <esc>j <c-w>j
nnoremap <esc>l <c-w>l
" nnoremap <c-w> a<c-w><ESC>
nnoremap <c-j> <c-d>
nnoremap <c-k> <c-u>
inoremap <c-c> <esc>dF\s

:nn <F1> 1gt
:nn <F2> 2gt
:nn <F3> 3gt
:nn <F4> 4gt
:nn <F12> :tablast<CR>

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi'

Plug 'dense-analysis/ale'   
"nnoremap <F1> :ALEGoToImplementation -tab<cr>
"nnoremap <F2> :ALEGoToTypeDefinition -tab<cr>
"nnoremap <F3> :ALEFindReferences -tab<cr>
nnoremap <F4> :ALEToggle<cr>
" Plug 'Valloric/YouCompleteMe'
Plug 'itchyny/lightline.vim'   

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_math=1
Plug 'mzlogin/vim-markdown-toc'
let g:vmt_auto_update_on_save=0
Plug 'SirVer/ultisnips',{'for':'markdown'}
Plug 'honza/vim-snippets'
Plug 'ivalkeen/nerdtree-execute'
Plug 'ferrine/md-img-paste.vim' 
let g:mdip_imgdir = 'pic'
let g:mdip_imgname= 'image'
autocmd FileType markdown nnoremap <silent> <M-p> : call mdip#MarkdownClipboardImage()<CR>F%i

Plug 'tpope/vim-eunuch'

Plug 'lervag/vimtex'
   
 let g:vimtex_view_general_viewer = 'zathura'
 let g:vimtex_view_general_options
     \ = '-reuse-instance -forward-search @tex @line @pdf'

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
 nnoremap <A-c> : NERDTreeFind<cr>

Plug 'PhilRunninger/nerdtree-visual-selection'


Plug 'kien/ctrlp.vim'

 let g:ctrlp_dont_split = 'NERD'

Plug 'FelikZ/ctrlp-py-matcher'

Plug 'tpope/vim-surround'

" Plug 'kana/vim-textobj-entire'

" Plug 'mhinz/vim-startify'
"

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
