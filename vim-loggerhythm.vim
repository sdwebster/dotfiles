" Work-in-progress vim plugin

" thanks Bob Harris!
" http://newsgroups.derkeiler.com/Archive/Comp/comp.editors/2005-08/msg00226.html
function! TrimWhitespace(str)
    return substitute(a:str, "^\\s\\+\\|\\s\\+$", '', 'g')
endfunction

" thanks xolox!
" http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
function! GetVisualSelection()
    :echom 'doing GetVisualSelection'
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

function! AddLog(functionName, vars, indentation)
    let logLines = []
    let logLineStart = a:indentation . 'console.log("' . expand('%:t') . ': '
    let logLineEnd = ');'
    if (a:functionName != '')
        let fnMessage = logLineStart . "calling function '" . a:functionName . "'"
        if (a:vars == [])
            call add(logLines, fnMessage . '"' . logLineEnd)
        else
            call add(logLines, fnMessage . ' with ' . len(a:vars) . ' arguments: "' . logLineEnd)
        endif
    endif

    let singleQuote = "'"
    call map(a:vars, 'logLineStart . singleQuote . v:val . singleQuote . " is \" + " . v:val . logLineEnd')
    call extend(logLines, a:vars)

    if (logLines == [])
        " no functionName or variables. Use default line.
        let logLines = [logLineStart . '"' . logLineEnd]
    endif
    call append(line('.'), logLines)
endfunction

function! GetIndentation()
    let currentLine = getline(".")
    if (currentLine == '')
        return ''
    endif
    if (currentLine[0] =~ '\s')
        return split("A" . currentLine, '\S')[0]
    else
        return ''
    endif
endfunction

function! AddConsoleLog()
    let currentLine = getline(".")
    let indentation = GetIndentation()
    if currentLine =~ 'function'
        let parts = split(' ' . currentLine, 'function')
        let parenSplit = split(' ' . parts[1], '(')
        let functionName = TrimWhitespace(parenSplit[0])
        if (functionName == '')
            let beforePunct = split(' ' . parts[0], '=\|:')[0]
            let lastWord = split(beforePunct, ' ')[-1]
            let functionName = lastWord
        endif
        let withinParens = split(' ' . parenSplit[1], ')')[0]
        let arguments = map(split(withinParens, ','), 'TrimWhitespace(v:val)')
        call AddLog(functionName, arguments, indentation . '    ')
    elseif currentLine =~ '='
        let beforeEq = split(' ' . currentLine, '=')[0]
        let lastWord = split(beforeEq, ' ')[-1]
        call AddLog('', [lastWord], indentation)
    else
        call AddLog('', [], indentation)
    endif
endfunction

" function! GetVisual() range
"         let reg_save = getreg('"')
"         let regtype_save = getregtype('"')
"         let cb_save = &clipboard
"         set clipboard&
"         normal! ""gvy
"         let selection = getreg('"')
"         call setreg('"', reg_save, regtype_save)
"         let &clipboard = cb_save
"         return selection
" endfunction

function! AddWordLog()
    let indentation = GetIndentation()
    normal yaw
    call AddLog('', [ @" ], indentation)
endfunction

function! AddSelectionLog()
    let indentation = GetIndentation()
    " getVisualSelection()
    " normal `<y`>
    call AddLog('', [ GetVisualSelection() ], indentation)
endfunction

" Decide whether this belongs here or in another plugin
function! WrapJsonStringify()
    let highlighted = GetVisualSelection()
    " do the end-paren first, before the end-index gets outdated!
    normal! `>a)
    normal! `<iJSON.stringify(
endfunction

"" (controlled from main vimrc for now)
" augroup filetypes
"     autocmd!
"     autocmd filetype javascript
"     \ let @c=':call AddConsoleLog()' |
"     \ let @w=':call AddWordLog()' |
"     \ let @v=':call AddSelectionLog()' |
"     \ let @j=':call WrapJsonStringify()'
" augroup END
