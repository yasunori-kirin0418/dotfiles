set noshowmode
let g:lightline = {}

" Colorscheme{{{
let g:lightline.colorscheme = 'iceberg'
" }}}


" Statusline{{{

" active
let g:lightline.active = {}
let g:lightline.active.left = [
    \ ['mode', 'paste', ], 
    \ ['git_branch', 'filename', 'modified'],
    \ ]
let g:lightline.active.right = [
    \ ['lineinfo'],
    \ ['percent'],
    \ ['fileformat', 'fileencoding', 'filetype'],
    \ ]

" inactive
let g:lightline.inactive = {}
let g:lightline.inactive.left = [
    \ ['filename']
    \ ]
let g:lightline.inactive.right = [
    \ ['lineinfo'],
    \ ['percent'],
    \ ]
" }}}


" Tabline{{{
let g:lightline.tabline = {}
let g:lightline.tabline.left = [
    \ ['tabs'],
    \ ]
let g:lightline.tabline.right = [
    \ ['close'],
    \ ]

let g:lightline.tab = {}
let g:lightline.tab.active = ['tabnum', 'filename', 'modified']
let g:lightline.tab.inactive = ['tabnum', 'filename', 'modified']
" }}}


" Separator{{{

if &ambiwidth =~ 'single'

    let g:lightline.separator = {}
    let g:lightline.separator.left = ' '
    let g:lightline.separator.right = ' '

    let g:lightline.subseparator = {}
    let g:lightline.subseparator.left = ' '
    let g:lightline.subseparator.right = ' '

endif

" }}}


" Component_default{{{
let g:lightline.component = {}
let g:lightline.component = {
    \ 'mode': '%{lightline#mode()}',
    \ 'absolutepath': '%F',
    \ 'relativepath': '%f',
    \ 'filename': '%t',
    \ 'modified': '%M',
    \ 'bufnum': '%n',
    \ 'paste': '%{&paste?"PASTE":""}',
    \ 'readonly': '%R',
    \ 'charvalue': '%b',
    \ 'charvaluehex': '%B',
    \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
    \ 'fileformat': '%{&ff}',
    \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
    \ 'percent': '%3p%%',
    \ 'percentwin': '%P',
    \ 'spell': '%{&spell?&spelllang:""}',
    \ 'lineinfo': '%3l:%-2c',
    \ 'line': '%l',
    \ 'column': '%c',
    \ 'close': '%999X X ',
    \ 'winnr': '%{winnr()}' }
" }}}


" Component{{{
" let g:lightline.component.git_branch = '%{FugitiveStatusline()}'
" }}}


" Component_function{{{
let g:lightline.component_function = {}
let g:lightline.component_function.git_branch = 'LightlineFugitive'
" }}}


" Component_expand{{{
let g:lightline.component_expand = {}
" }}}


" LightlineUpdate_Command{{{
command! -bar LightlineUpdate source ~/dotfiles/.vim/plugins/lightline.vim|
    \ call lightline#init()|
    \ call lightline#colorscheme()|
    \ call lightline#update()
" }}}


" Branch name{{{
function! LightlineFugitive() abort
    if &ft !~? 'help\|denite\|defx\|tagbar' && exists('*FugitiveHead')
        return '' . FugitiveHead()
    else
        return ''
    endif
endfunction
" }}}
