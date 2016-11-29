let g:airline#themes#monokai#palette = {}

let g:airline#themes#monokai#palette.accents = {
      \ 'red': [ '#66d9ef' , '' , 81 , '' , '' ],
      \ }


" Normal mode
let s:N1 = [ '#080808' , '#e6db74' , 232 , 252 ] " mode
let s:N2 = [ '#f8f8f0' , '#232526' , 253 , 240 ] " info
let s:N3 = [ '#f8f8f0' , '#465457' , 253 , 240 ] " statusline

let g:airline#themes#monokai#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#monokai#palette.normal_modified = {
      \ 'airline_c': [ '#080808' , '#e6db74' , 253 , 240 , '' ] ,
      \ }


" Insert mode
let s:I1 = [ '#080808' , '#66d9ef' , 232 , 117 ]
let s:I2 = [ '#f8f8f0' , '#232526' , 253 , 240 ]
let s:I3 = [ '#f8f8f0' , '#465457' , 253 , 240 ]

let g:airline#themes#monokai#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#monokai#palette.insert_modified = {
      \ 'airline_c': [ '#080808' , '#66d9ef' , 253 , 240 , '' ] ,
      \ }


" Replace mode
let s:R1 = [ '#080808' , '#66d9ef' , 232 , 1 ]
let s:R2 = [ '#f8f8f0' , '#232526' , 253 , 240 ]
let s:R3 = [ '#f8f8f0' , '#465457' , 253 , 240 ]

let g:airline#themes#monokai#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#monokai#palette.replace_modified = {
      \ 'airline_c': [ '#080808' , '#ef5939' , 253 , 1 , '' ] ,
      \ }


" Visual mode
let s:V1 = [ '#080808' , '#fd971f' , 232 , 214 ]
let s:V2 = [ '#f8f8f0' , '#232526' , 253 , 240  ]
let s:V3 = [ '#f8f8f0' , '#465457' , 253 , 240  ]

let g:airline#themes#monokai#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#monokai#palette.visual_modified = {
      \ 'airline_c': [ '#080808' , '#fd971f' , 232 , 214 , '' ] ,
      \ }


" Inactive
let s:IA = [ '#1b1d1e' , '#465457' , 232 , 252 , '' ]
let g:airline#themes#monokai#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#monokai#palette.inactive_modified = {
      \ 'airline_c': [ '#f8f8f0' , ''        , 232 , ''  , '' ] ,
      \ }


" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#monokai#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#f8f8f0' , '#465457' , 253 , 243  , ''     ] ,
      \ [ '#f8f8f0' , '#232526' , 253 , 240  , ''     ] ,
      \ [ '#080808' , '#e6db74' , 253 , 240 , 'bold' ] )

