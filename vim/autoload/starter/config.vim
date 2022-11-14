" vim: set ts=4 sw=4 tw=78 noet :
"======================================================================
"
" config.vim - 
"
" Created by skywind on 2022/09/07
" Last Modified: 2022/09/07 16:42:08
"
"======================================================================


"----------------------------------------------------------------------
" default config
"----------------------------------------------------------------------
let s:default_config = {
			\ 'icon_separator': '=>',
			\ 'icon_group': '+',
			\ 'icon_breadcrumb': '>',
			\ 'max_height': 20,
			\ 'min_height': 5,
			\ 'padding': [2, 0, 2, 0],
			\ 'spacing': 3,
			\ 'position': 'bottom',
			\ 'splitmod': '',
			\ }


"----------------------------------------------------------------------
" get config
"----------------------------------------------------------------------
function! starter#config#get(opts, key) abort
	if type(a:opts) == v:t_dict
		let opts = a:opts
	elseif type(a:opts) == v:t_none
		let opts = get(g:, 'quickui_starter', {})
	endif
	return get(opts, a:key, s:default_config[a:key])
endfunc


"----------------------------------------------------------------------
" visit tree node
"----------------------------------------------------------------------
function! starter#config#visit(keymap, path) abort
	let keymap = a:keymap
	let path = a:path
	if type(keymap) == v:t_none || type(path) == v:t_none
		return v:none
	endif
	for key in path
		if type(keymap) == v:t_func
			let keymap = call(keymap, [])
		endif
		if !has_key(keymap, key)
			return v:none
		endif
		let keymap = keymap[key]
	endfor
	return keymap
endfunc


"----------------------------------------------------------------------
" compile keymap into ctx
"----------------------------------------------------------------------
function! starter#config#compile(keymap, opts) abort
	let keymap = a:keymap
	let opts = a:opts
	let ctx = {}
	let ctx.items = {}
	let ctx.keys = []
	let ctx.strlen_key = 1
	let ctx.strlen_txt = 8
	for key in keylist
		if key == '' || key == 'name'
			continue
		endif
		let key_char = starter#charname#translate(key)
		if type(key_char) == v:t_none
			continue
		endif
		let ctx.keys += [key]
		let item = {}
		let item.key = key
		let item.key_char = key_char
		let item.key_display = starter#charname#display(key)
		let item.cmd = ''
		let item.text = ''
		let item.child = 0
		let ctx.items[key] = item
		let value = keymap[keyname]
		if type(value) == v:t_func
			value = call(value, [])
		endif
		if type(value) == v:t_str
			let item.cmd = value
			let item.text = value
		elseif type(value) == v:t_list
			let item.cmd = (len(value) > 0)? value[0] : ''
			let item.text = (len(value) > 1)? value[1] : ''
		elseif type(value) == v:t_dict
			let item.child = 1
			let item.text = get(value, 'name', '...')
		endif
		if len(item.key) > ctx.strlen_key
			let ctx.strlen_key = len(item.key)
		endif
		if len(item.text) > ctx.strlen_txt
			let ctx.strlen_text = len(item.text)
		endif
	endfor
	call sort(ctx.keys)
	return ctx
endfunc



