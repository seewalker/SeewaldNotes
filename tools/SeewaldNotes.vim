"Global Variables
let g:notesAutocomplete = 1

"Overridden Settings
set matchpairs+=`:'
set matchpairs+=<:>  "this is for BNF stuff

"Autocompletion. This may be turned on and off.
if g:notesAutocomplete
    inoremap `? `??'<Left><Left>
    inoremap `! `!!'<Left><Left>
    inoremap `# `##'<Left><Left>
    inoremap `` ``''<Left><Left>
    inoremap `/ `//'<Left><Left>
    inoremap `~ `~~'<Left><Left>
endif


"highlighting
highlight notesUnresolvedQuestion ctermfg=1 guifg=#cf4444
highlight notesResolutionAnswer ctermfg=2   guifg=#44cf44
highlight notesSubjectivity ctermfg=3       guifg=#707a46
highlight notesCode ctermfg=4               guifg=#eeeeee
highlight notesDefinition ctermfg=5      guifg=#ab7aba
highlight notesJargon ctermfg=6             guifg=#b44d8b
highlight notesToken ctermfg=6             guifg=#41bfc4
highlight notesEmphasis ctermfg=7          guifg=#fdad00

augroup notesHighlighting
    autocmd!
    autocmd BufEnter * syntax spell notoplevel
    autocmd BufEnter * syntax region notesUnresolvedQuestion start="`?" end="?'" contains=ALL
    autocmd BufEnter * syntax region notesResolutionAnswer start="`!" end="!'" contains=ALL
    autocmd BufEnter * syntax region notesSubjectivity start="`#" end="#'" contains=ALL
    autocmd BufEnter * syntax region notesDefinition start="`/" end="/'" contains=ALL
    autocmd BufEnter * syntax region notesCode start="``" end= "''" contains=ALL
    autocmd BufEnter * syntax region notesEmphasis start="`$" end= "$'" contains=ALL
    autocmd BufEnter * syntax match notesToken '!\=e\=\(/ord\)\=\(/proc\)\=:$'
    autocmd BufEnter * syntax match notesToken '^\s*\*'
    autocmd BufEnter * syntax match notesToken '@'
    autocmd BufEnter * syntax match notesToken '{'
    autocmd BufEnter * syntax match notesToken '}'
augroup END
