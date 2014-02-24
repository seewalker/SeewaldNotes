"Global Variables
let g:notesExtension = ".swd"
let g:notesNumColors = &t_Co
let g:notesAutocomplete = 1
"color change has linear relationship with parenthesis depth.
let g:notesParenthesis1 = 250
let g:notesParenthesisIncr = 12
let g:bgColor = #e2e1b3

"Overridden Settings
set matchpairs+=`:'
set matchpairs+=<:>  "this is for BNF stuff
"how should the identation setting be done?

"Highlight Group Definitions
python << endpython
highlight notesUnresolvedQuestion ctermfg=1 guifg=#1a2355 guibg=#e2e1b3
highlight notesResolutionAnswer ctermfg=2   guifg=#b5d25b guibg=#e2e1b3
highlight notesSubjectivity ctermfg=3       guifg=#707a46 guibg=#e2e1b3
highlight notesCode ctermfg=4               guifg=#168487 guibg=#e2e1b3
highlight notesDefinition ctermfg=5      guifg=#36801b guibg=#e2e1b3
highlight notesReference ctermfg=6          guifg=#0f0f40 guibg=#e2e1b3
highlight notesLowLocality ctermfg=7        guifg=#f7932a guibg=#e2e1b3
highlight notesJargon ctermfg=8             guifg=#b44d8b guibg=#e2e1b3
"xterm has 8 colors, so that amount must be handled. There do, however,
"exist terminal emulators with more colors, so the color method should
"branch at this point.

"Since vim highlighting works with a finite number of highlight groups,
"I must set a finite limit for distinctly highlighted parenthesis depths.
"10 is probably large enough.
if g:notesnumColors > 8:
    import vim
    vim.command(highlight notesAnalogy ctermfg=9 guifg=# guibg=#e2e1b3
    highlight notesParen0 ctermfg=10
    highlight notesParen1 ctermfg=11
    highlight notesParen2 ctermfg=12
    highlight notesParen3 ctermfg=13
    highlight notesParen4 ctermfg=14
    highlight notesParen5 ctermfg=15
    highlight notesParen6 ctermfg=16
    highlight notesParen7 ctermfg=17
    highlight notesParen8 ctermfg=18
    highlight notesParen9 ctermfg=19
    highlight notesParen10 ctermfg=20
else:
    highlight notesAnalogy ctermfg=8
    highlight notesParen0 ctermfg=3
    highlight notesParen1 ctermfg=3
    highlight notesParen2 ctermfg=3
    highlight notesParen3 ctermfg=3
    highlight notesParen4 ctermfg=3
    highlight notesParen5 ctermfg=3
    highlight notesParen6 ctermfg=3
    highlight notesParen7 ctermfg=3
    highlight notesParen8 ctermfg=3
    highlight notesParen9 ctermfg=3
    highlight notesParen10 ctermfg=3
endpython


if g:notesAutocomplete
    inoremap `? `??'<Left><Left>
    inoremap `! `!!'<Left><Left>
    inoremap `# `##'<Left><Left>
    inoremap `` ``''<Left><Left>
    inoremap `/ `//'<Left><Left>
    inoremap `~ `~~'<Left><Left>

function ParenthesisDepth()
python << endpython
    import vim
    import numpy
    workingBuffer = vim.current.buffer
    currentDepth, depthMap = 0, [[]]
    for line in range(len(workingBuffer)):
        for char in range(len(workingBuffer[l])):
            if (char == "("):
                currentDepth += 1
            elif (char == ")"):
                currentDepth -= 1
            depthMap[line].append(currentDepth)
        depthMap.append([])
    for line in depthMap:
        for char in line:
            vim.command("call matchadd(
endpython
endfunction

augroup notesHighlighting
    autocmd!
    autocmd BufWrite *g:extension match notesUnresolvedQuestion /`?.*?'/
    autocmd BufWrite *g:extension match notesResolutionAnswer /`!.*!'/
    autocmd BufWrite *g:extension match notesSubjectivity /`#.*#'/
    "If it turns out that the following regular expression for the match
    "does not work (or even if its just the highlighting) I should submit
    "a bug report when I find out which it is.
    autocmd BufWrite *g:extension match notesDefinition /`\/.*/'/
    autocmd BufWrite *g:extension match notesCode /``.*''/
    autocmd BufWrite *g:extension match notesReference /`[a-z]*[A-Z]*[0-9]*.*'/
    autocmd BufWrite *g:extension match notesLowLocality /[!*].*\*/
    autocmd BufWrite *g:extension match notesJargon /`~ ~'/
augroup END
