"Always show status and tab line
set laststatus=2
set showtabline=2

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [  ]
  \ }
