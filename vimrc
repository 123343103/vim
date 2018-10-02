"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundel Plugin Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible          
filetype off             
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai' "主题
Plugin 'scrooloose/nerdtree' "目录
Plugin 'jiangmiao/auto-pairs' "括号、引号等自动补全
call vundle#end()            
filetype plugin indent on 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin set
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'tomasr/molokai'
colorscheme molokai

" Plugin 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General set
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置显示行号
set number

"设置tab键
set tabstop=4 "set 1tab = 4space
set shiftwidth=4 "set 1Backspace = 4space 与tabstop同步设置

"设置自动缩进
set autoindent

"设置括号、引号等自动补全(注意要放在最下面)
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endf

