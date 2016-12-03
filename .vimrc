set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'yukunlin/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'elzr/vim-json'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-commentary'
Plugin 'edsono/vim-matchit'
Plugin 'SirVer/ultisnips'
Plugin 'ap/vim-css-color'
Plugin 'JulesWang/css.vim'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-surround'
Plugin 'osyo-manga/vim-anzu'
Plugin 'embear/vim-localvimrc'
Plugin 'jceb/vim-orgmode'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'elixir-lang/vim-elixir'
Plugin 'easymotion/vim-easymotion'
Plugin 'flowtype/vim-flow'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Basic vim settings
syntax on
set t_Co=256
set background=dark
colorscheme hybrid_reverse
set colorcolumn=80
set number
set backspace=indent,eol,start
set showcmd
set mouse=a
set hlsearch
set incsearch
set lazyredraw
set ttyfast
" succesive key press timeout
set timeoutlen=500 ttimeoutlen=0 " set listchars=eol:$,tab:»·,trail:·
set listchars=tab:»·,trail:·
set autoindent
set autoread
set hidden
set ignorecase
set list
set omnifunc=syntaxcomplete#Complete

" set default indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" update leader to \,\
let mapleader=","

" indentation
set foldmethod=indent
set foldlevel=20
set foldlevelstart=20

" fix spacing
map <F7> mzgg=G`z`

" map moving between windows
noremap <C-J> <C-W>w
noremap <C-K> <C-W>W
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h

" ----------

" less syntax
" autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS

" NERDTree file type highlight
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" open NERDTree with Ctrl + n
map <C-n> :NERDTreeToggle<CR>
map <C-n> <plug>NERDTreeTabsToggle<CR>

" ignore .swp files
let NERDTreeIgnore = ['\.swp$']

" show hidden files
let NERDTreeShowHidden=1
" " auto close NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" make NERDTree appear on left
let g:NERDTreeWinPos = "left"
let g:NERDTreeQuitOnOpen = 1

" airline settings
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_nr_show = 1

" json file type
au! BufRead,BufNewFile *.json set filetype=json
hi! def link jsonKeyword Identifier

" let g:cssColorVimDoNotMessMyUpdatetime = 1
" let g:ycm_filetype_specific_completion_to_disable = {"hbs":1, "html":1}
" let g:UltiSnipsExpandTrigger="<C-c>"

" Syntastic Settings
let g:syntastic_javascript_checkers = ['eslint']
" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

au FileType javascript :call SetLocalEslint()
fun! SetLocalEslint()
    let lcd = fnameescape(getcwd())
    silent! exec "lcd" expand('%:p:h')
    let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'

    if matchstr(local_eslint, "^\/\\w") == ''
        let local_eslint = fnameescape(getcwd()) . "/" . local_eslint
    endif

    if executable(local_eslint)
        let b:syntastic_javascript_eslint_exec = local_eslint
    endif

    exec "lcd" lcd
endfun


" tagbar settings
" nmap <F8> :TagbarToggle<CR>
" let g:airline#extensions#tagbar#enabled = 1
" let g:airline#extensions#tagbar#flags = 's'

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/dist/*,*/node_modules/*,*/fonts/*,*/build/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat\|.swp$'
  \}
let g:ctrlp_show_hidden = 1

function! JumpToCSS()
  let id_pos = searchpos("id", "nb", line('.'))[1]
  let class_pos = searchpos("class", "nb", line('.'))[1]

  if class_pos > 0 || id_pos > 0
    if class_pos < id_pos
      execute ":vim '#".expand('<cword>')."' **/*.less"
    elseif class_pos > id_pos
      execute ":vim '.".expand('<cword>')."' **/*.less"
    endif
  endif
endfunction

nnoremap <F9> :call JumpToCSS()<CR>

" Disable Arrow Keys To Learn Vim!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" map ;; to ESC
imap ;; <Esc>

" MatchTagAlways file types
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'html.handlebars' : 1
    \}

" Retab before saving file
autocmd BufWritePre * :retab

" Enable jsx inside js
let g:jsx_ext_required = 0

" Anzu Settings
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)


" statusline
set statusline=%{anzu#search_status()}

hi Search guibg=LightBlue
let g:user_emmet_settings = {
  \  'html' : {
  \    'indent_blockelement': 1,
  \  },
\}

" block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" auto source .lvimrc
let g:localvimrc_persistent = 2
let g:localvimrc_ask = 0

" SAVE SWAP FILES IN A BACKUP DIR
" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name/9528322#9528322
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup
" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.
" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

" Flow settings
let g:flow#autoclose=1
