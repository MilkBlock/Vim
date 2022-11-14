"======================================================================
"
" snipmate.vim - snipmate enhancement
"
" Created by skywind on 2022/09/05
" Last Modified: 2022/09/05 00:43:52
"
"======================================================================


"----------------------------------------------------------------------
" private
"----------------------------------------------------------------------
let s:has_snippet_dirs = 0
let s:has_searched = 0
let s:has_actived = 0
let s:rtp_paths = []


"----------------------------------------------------------------------
" new pool: based on runtimepath + g:snipMate.dirs
"----------------------------------------------------------------------
function! s:new_pool(scopes, trigger, result) abort
	let g:snipMate = get(g:, 'snipMate', {})
	if s:has_searched == 0
		let s:rtp_paths = []
		for rtp in split(&rtp, ',')
			let path = asclib#path#normalize(rtp . '/snippets')
			if isdirectory(path)
				let s:rtp_paths += [rtp]
			endif
		endfor
		let s:has_searched = 1
	endif
	let dirs = deepcopy(s:rtp_paths)
	if has_key(g:snipMate, 'dirs')
		if type(g:snipMate.dirs) == type([])
			for path in g:snipMate.dirs
				let t = asclib#path#normalize(path)
				let dirs += [t]
			endfor
		elseif type(g:snipMate.dirs) == type('')
			let t = asclib#path#normalize(g:snipMate.dirs)
			let dirs += [t]
		endif
	endif
	let g:snipMate.snippet_dirs = dirs
	" echom "NewPool: " . printf("%s", dirs)
	call snipMate#DefaultPool(a:scopes, a:trigger, a:result)
endfunc


"----------------------------------------------------------------------
" deactive enhancement
"----------------------------------------------------------------------
function! module#snipmate#deactive()
	if exists('g:snipMate')
		if s:has_snippet_dirs
			let g:snipMate.snippet_dirs = s:backup_dirs
		else
			if has_key(g:snipMate, 'snippet_dirs')
				unlet g:snipMate['snippet_dirs']
			endif
		endif
	endif
	let g:snipMateSources = get(g:, 'snipMateSources', {})
	" Default source: get snippets based on runtimepath
	let g:snipMateSources['default'] = function('snipMate#DefaultPool')
	let s:has_actived = 0
endfunc


"----------------------------------------------------------------------
" active enhancement
"----------------------------------------------------------------------
function! module#snipmate#active()
	let s:has_snippet_dirs = 0
	if exists('g:snipMate')
		if has_key(g:snipMate, 'snippet_dirs')
			let s:backup_dirs = g:snipMate.snippet_dirs
			let g:snipMate.snippet_dirs = []
			let s:has_snippet_dirs = 1
		endif
	endif
	let s:has_searched = 0
	let g:snipMateSources = get(g:, 'snipMateSources', {})
	" Default source: get snippets based on runtimepath + g:snipMate.dirs
	let g:snipMateSources['default'] = function('s:new_pool')
	let s:has_actived = 1
endfunc




