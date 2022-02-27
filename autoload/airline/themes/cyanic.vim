let s:cyanic = {}

let s:black  = [ '#000000', '0' ]
let s:yellow = [ '#808040', '3' ]
let s:blue   = [ '#404080', '4' ]
let s:cyan   = [ '#008080', '6' ]
let s:white  = [ '#A0A0A0', '7' ]

let s:black2   = [ '#202020', '8'  ]
let s:red2     = [ '#A04040', '9'  ]
let s:green2   = [ '#40A040', '10' ]
let s:yellow2  = [ '#A0A040', '11' ]
let s:magenta2 = [ '#A040A0', '13' ]
let s:cyan2    = [ '#00FFFF', '14' ]

" Always (fg, bg)
let s:warning = [ s:black, s:yellow2 ]
let s:error   = [ s:black, s:red2 ]

" Normal mode (fg, bg)
let s:N1 = [ s:black, s:cyan ]
let s:N2 = [ s:black, s:blue ]
let s:N3 = [ s:cyan2, s:black2 ]

" Insert mode (fg, bg)
let s:I1 = [ s:black, s:cyan2 ]
let s:I2 = [ s:black, s:blue ]
let s:I3 = [ s:cyan2, s:black2 ]

" Visual mode (fg, bg)
let s:V1 = [ s:black, s:magenta2 ]
let s:V2 = [ s:black, s:blue ]
let s:V3 = [ s:cyan2, s:black2 ]

" Replace mode (fg, bg)
let s:R1 = [ s:black, s:green2 ]
let s:R2 = [ s:black, s:blue ]
let s:R3 = [ s:cyan2, s:black2 ]

" Commandline mode (fg, bg)
let s:C1 = [ s:black, s:yellow ]
let s:C2 = [ s:black, s:blue ]
let s:C3 = [ s:cyan2, s:black2 ]

" Terminal mode (fg, bg) Disabled at bottom. Makes things look weird after
" exiting terminal mode
let s:T1 = [ s:cyan2, s:black2 ]
let s:T2 = [ s:cyan2, s:black2 ]
let s:T3 = [ s:cyan2, s:black2 ]

" Inactive mode (fg, bg)
let s:IA1 = [ s:white, s:black2 ]
let s:IA2 = [ s:black, s:blue ]
let s:IA3 = [ s:cyan2, s:black2 ]




function s:pairToQuad(pair)
	return [ a:pair[0][0], a:pair[1][0], a:pair[0][1], a:pair[1][1] ]
endfunction

function s:gen_color_map(pair1, pair2, pair3)
	let l:ret = airline#themes#generate_color_map(s:pairToQuad(a:pair1), s:pairToQuad(a:pair2), s:pairToQuad(a:pair3))

	let l:ret.airline_warning = s:pairToQuad(s:warning)
	let l:ret.airline_error = s:pairToQuad(s:error)

	return l:ret
endfunction

let s:cyanic.normal = s:gen_color_map(s:N1, s:N2, s:N3)
let s:cyanic.insert = s:gen_color_map(s:I1, s:I2, s:I3)
let s:cyanic.visual = s:gen_color_map(s:V1, s:V2, s:V3)
let s:cyanic.replace = s:gen_color_map(s:R1, s:R2, s:R3)
let s:cyanic.commandline = s:gen_color_map(s:C1, s:C2, s:C3)
"let s:cyanic.terminal = s:gen_color_map(s:T1, s:T2, s:T3)
let s:cyanic.inactive = s:gen_color_map(s:IA1, s:IA2, s:IA3)

" Accent color
let s:cyanic.accents = {
	\ 'red': s:pairToQuad([s:red2, s:black2])
	\ }


let g:airline#themes#cyanic#palette = s:cyanic
