"----------------------------------------------------------------------
" detection
"----------------------------------------------------------------------
let s:windows = has('win32') || has('win16') || has('win95') || has('win64')
let g:asclib = get(g:, 'asclib', {})
let g:asclib#common#windows = s:windows
let g:asclib#common#unix = (s:windows == 0)? 1 : 0
let g:asclib#common#path = fnamemodify(expand('<sfile>:p'), ':h:h:h')


"----------------------------------------------------------------------
" error message
"----------------------------------------------------------------------
function! asclib#common#errmsg(text)
	redraw! | echo | redraw!
	echohl ErrorMsg
	echom a:text
	echohl None
endfunc


"----------------------------------------------------------------------
" class.word
"----------------------------------------------------------------------
function! asclib#common#class_word()
	let text = getline('.')
	let pre = text[:col('.') - 1]
	let suf = text[col('.'):]
	let word = matchstr(pre, "[A-Za-z0-9_.]*$") 
	let word = word . matchstr(suf, "^[A-Za-z0-9_]*")
	let cword = expand('<cword>')
	return (strlen(word) > strlen(cword))? word : cword
endfunc


"----------------------------------------------------------------------
" get visual selection
"----------------------------------------------------------------------
function! s:GetVisualSelection(mode)
	" call with visualmode() as the argument
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end]     = getpos("'>")[1:2]
	let lines = getline(line_start, line_end)
	let inclusive = (&selection == 'inclusive')? 1 : 2
	if a:mode ==# 'v'
		" Must trim the end before the start, the beginning will shift left.
		let lines[-1] = lines[-1][: column_end - inclusive]
		let lines[0] = lines[0][column_start - 1:]
	elseif  a:mode ==# 'V'
	" Line mode no need to trim start or end
	elseif  a:mode == "\<c-v>"
		" Block mode, trim every line
		let new_lines = []
		let i = 0
		for line in lines
			let lines[i] = line[column_start - 1: column_end - inclusive]
			let i = i + 1
		endfor
	else
		return ''
	endif
	return join(lines, "\n")
endfunction


"----------------------------------------------------------------------
" get selected text
"----------------------------------------------------------------------
function! asclib#common#get_selected_text(...)
	let mode = get(a:, 1, mode(1))
	return s:GetVisualSelection(mode)
endfunc


"----------------------------------------------------------------------
" keywords complete
"----------------------------------------------------------------------
function! asclib#common#complete(ArgLead, CmdLine, CursorPos, Keywords)
	let candidate = []
	for word in Keywords
		if asclib#string#startswith(word, a:ArgLead)
			let candidate += [word]
		endif
	endfor
	return candidate
endfunc



