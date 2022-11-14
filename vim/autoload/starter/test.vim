
let s:starter_keymap = get(g:, 'starter_keymap', {})

let s:starter_keymap.b = {
			\ 'name' : '+buffer' ,
			\ '1' : ['b1'        , 'buffer 1']        ,
			\ '2' : ['b2'        , 'buffer 2']        ,
			\ 'd' : ['bd'        , 'delete-buffer']   ,
			\ 'f' : ['bfirst'    , 'first-buffer']    ,
			\ 'h' : ['Startify'  , 'home-buffer']     ,
			\ 'l' : ['blast'     , 'last-buffer']     ,
			\ 'n' : ['bnext'     , 'next-buffer']     ,
			\ 'p' : ['bprevious' , 'previous-buffer'] ,
			\ '?' : ['Buffers'   , 'fzf-buffer']      ,
			\ }

let s:starter_keymap.c = {
			\ 'name': '+comments',
			\ 'c': 'comment-lines',
			\ 'n': 'comment-lines-force-nesting',
			\ ' ': 'toggle-comment',
			\ 'm': 'comment-lines-with-block-comment',
			\ 'i': 'toggle-individual-line-comment',
			\ 's': 'comment-lines-documentation-style',
			\ 'y': 'yank-and-comment-lines',
			\ '$': 'comment-to-the-end',
			\ 'A': 'add-comment-to-end-of-line',
			\ 'a': 'switch-comment-delimiters',
			\ 'l': 'comment-left-aligned',
			\ 'b': 'comment-both-side-aligned',
			\ 'u': 'uncomment-lines'
			\ }

let s:starter_keymap.f = ['<Plug>(coc-smartf-forward)', 'coc-smartf-forward']
let s:starter_keymap.F = ['<Plug>(coc-smartf-backward)', 'coc-smartf-forward']
let s:starter_keymap[';'] = ['<Plug>(coc-smartf-repeat)', 'coc-smartf-repeat']
let s:starter_keymap[','] = ['<Plug>(coc-smartf-repeat-opposite)', 'coc-smartf-repeat-opposite']

let s:starter_keymap['g'] = {
			\ 'name': '+goto',
			\ 'd': ['<Plug>(coc-definition)', 'goto-definition'],
			\ 'i': ['<Plug>(coc-implementation)', 'goto-implementation'],
			\ 'k': ['<Plug>(coc-declaration)', 'goto-declaration'],
			\ 't': ['<Plug>(coc-type-definition)', 'goto-type-definition'],
			\ }

let s:starter_keymap['i'] = [':IndentLinesToggle', 'toggle-indent-line']

let s:starter_keymap['j'] = {
			\ 'name': '+any-jump',
			\ 'a': [':AnyJump', 'jump-to-definition'],
			\ 'b': [':AnyJumpBack', 'jump-back'],
			\ 'l': [':AnyJumpLastResults', 'retore-previous-search-window']
			\ }

let s:starter_keymap.l = {
			\ 'name' : '+lsp',
			\ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
			\ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
			\ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
			\ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
			\ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
			\ 'g' : {
			\ 'name': '+goto',
			\ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
			\ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
			\ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
			\ },
			\ }


let s:starter_keymap['p'] = {
			\ 'name': '+fuzzy-finder',
			\ ';': [':Leaderf command', 'find-commands'],
			\ 'C': [':Leaderf colorscheme', 'find-colors'],
			\ 'c': [':CocList commands', 'find-coc-commands'],
			\ 'd': [':Leaderf filer', 'show-file-tree'],
			\ 'e': [':CocList extensions', 'find-coc-extensions'],
			\ 'f': [':Leaderf file', 'find-files'],
			\ 'F': [':CocList folders', 'find-folders'],
			\ 'g': [':Leaderf rg', 'grep'],
			\ 'k': [':CocList links', 'list-links'],
			\ 'L': [':CocList locationlist', 'show-loclist'],
			\ 'l': [':Leaderf line', 'search-buffer-lines'],
			\ 'm': [':Leaderf marks', 'show-marks'],
			\ 'M': [':CocList maps', 'list-mappings'],
			\ 'H': {
			\     'name': '+history',
			\     'c': [':Leaderf cmdHistory', 'show-command-history'],
			\     'j': [':CocList location', 'list-jump-history']
			\ },
			\ 'h': [':Leaderf help', 'find-help'],
			\ 'o': [':Leaderf bufTag', 'search-buffer-tags'],
			\ 'P': [':CocList snippets', 'list snippets'],
			\ 'q': [':CocList quickfix', 'show-quickfix'],
			\ 'r': [':Leaderf mru', 'find-recent-files'],
			\ 's': [':CocList -I symbols', 'list-symbols'],
			\ 'S': [':CocList sessions', 'list-sessions']
			\ }

let s:starter_keymap.s = {
			\ 'name': '+search-replace',
			\ 'r': 'search-replace-to-the-end',
			\ 'g': 'search-replace-whole-file',
			\ 'R': 'search-replace-to-the-end-no-prompt',
			\ 'G': 'search-replace-whole-file-no-prompt'
			\ }


let s:starter_keymap.v = {
			\ 'name': '+version-control',
			\ 'a': [':CocCommand git.chunkStage', 'add-chunk'],
			\ 'b': [':CocList --normal branches', 'git-branches'],
			\ 'd': ['<Plug>(coc-git-chunkinfo)', 'show-chunk-diff'],
			\ 'c': ['<Plug>(coc-git-commit)', 'show-commit-log'],
			\ 'f': [':CocList --normal gfiles', 'list-git-files'],
			\ 'l': [':CocList --normal commits', 'git-log'],
			\ 'L': [':CocList --normal bcommits', 'file-commits'],
			\ 'i': [':CocList --normal issues', 'list-github-issues'],
			\ 'n': ['<Plug>(coc-git-nextchunk)', 'jump-next-chunk'],
			\ 'p': ['<Plug>(coc-git-prevchunk)', 'jump-previous-chunk'],
			\ 's': [':CocList --normal gstatus', 'git-status'],
			\ 'u': [':CocCommand git.chunkUndo', 'undo-chunk']
			\ }

let s:starter_keymap.w = {
			\ 'name': '+window',
			\ 'p': ['<C-w>p', 'jump-previous-window'],
			\ 'h': ['<C-w>h', 'jump-left-window'],
			\ 'j': ['<C-w>j', 'jump-belowing-window'],
			\ 'k': ['<C-w>k', 'jump-aboving-window'],
			\ 'l': ['<C-w>l', 'jump-right-window'],
			\ 'H': ['<C-w>H', 'move-window-to-left'],
			\ 'J': ['<C-w>J', 'move-window-to-bottom'],
			\ 'K': ['<C-w>K', 'move-window-to-top'],
			\ 'L': ['<C-w>L', 'move-window-to-right'],
			\ 'n': ['<C-w>n', 'new-window'],
			\ 'q': ['<C-w>q', 'close-window'],
			\ 'w': ['<C-w>w', 'jump-next-window'],
			\ 'o': ['<C-w>o', 'close-all-other-windows'],
			\ 'v': ['<C-w>v', 'vertically-split-window'],
			\ 's': ['<C-w>s', 'split-window'],
			\ '/': [':Leaderf window', 'search-for-a-window'],
			\ }

let s:starter_keymap.x = {
			\ 'name': '+lsp',
			\ 'a': ['<Plug>(coc-codeaction-selected)', 'do-code-action-on-region'],
			\ 'A': ['<Plug>(coc-codeaction)', 'do-code-action-on-line'],
			\ 'r': ['<Plug>(coc-references)', 'find-references'],
			\ 'R': ['<Plug>(coc-rename)', 'rename-current-symbol'],
			\ 'f': ['CocAction("format")', 'format-buffer'],
			\ '=': ['<Plug>(coc-format-selected)', 'format-region'],
			\ 'k': ["CocAction('doHover')", 'show-documentation'],
			\ 'q': ['<Plug>(coc-fix-current)', 'fix-line'],
			\ 'l': {
			\     'name': '+lists',
			\     'a': [':CocList --normal actions', 'list-code-actions'],
			\     'e': [':CocList --normal diagnostics', 'list-errors']
			\ },
			\ }

function! starter#test#demo_keymap()
	return deepcopy(s:starter_keymap)
endfunc


