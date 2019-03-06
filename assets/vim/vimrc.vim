" Enable cool not VI compatible features
set nocp

" Load the pathogen stuff
source ~/.bashrc.d/assets/vim/bundle/pathogen.vim/autoload/pathogen.vim
execute pathogen#infect()

" Include all configuration
for f in split(glob('~/.bashrc.d/assets/vim/config/*.vim'), '\n')
  exe 'source' f
endfor

" Theming
set background=dark 
source ~/.bashrc.d/assets/vim/themes/peaksea.vim
