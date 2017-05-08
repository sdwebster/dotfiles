" This is my ~/.vimrc , which configures my settings for vim.


"""" Maintenance notes
" Actually, my home ~/.vimrc simply sources this shared file:
    " source $DOTFILE_HOME/vimrc

"""" Attribution
" Thanks to Philip Thrasher's well-commented beginner vimrc:
"   https://gist.github.com/pthrasher/3933522
" for getting me started.
"
" Also owes a lot to Drew Neil -- I highly recommend his
"   Practical Vim
"   Pragmatic Programmers, 2012
" (there's a newer edition now)

" Plugins managed by Vundle (https://github.com/VundleVim/Vundle.vim)
" Vundle installation:
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" ----- VUNDLE START ------

" A few required pre-vundle lines
set nocompatible              " be iMproved (non-VI-compatible), required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle itself
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" ----- MY VUNDLE PLUGINS -----
"
" ----- General -----

" A ton of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Bundle 'flazz/vim-colorschemes'

" Fuzzy finder -- absolutely must have.
Bundle 'kien/ctrlp.vim'

" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Netrw enhancements
Plugin 'tpope/vim-vinegar'

" Shortcuts w/ [ and ]
Plugin 'tpope/vim-unimpaired'

" ae, ie
"Plugin 'kana/vim-textobj-entire'

" ----- Language / Filetype Support -----

" Catch-all for many languages
Plugin 'sheerun/vim-polyglot'
" let g:polyglot_disabled = []

" has better indentation than built-in JS support (may already be installed
" via polyglot)
Plugin 'pangloss/vim-javascript'

" Proper JSON filetype detection, and support. (polyglot may have its own)
" Bundle 'leshill/vim-json'

" has better indentation than built-in HTML support
Plugin 'indenthtml.vim'

" Good syntax for markdown
Plugin 'tpope/vim-markdown'

" LessCSS
Plugin 'groenewege/vim-less'

" All of your vundle Plugins must be added before the following line

call vundle#end()            " required

" A few required post-vundle lines
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ----- VUNDLE END ------

syntax on
set autoindent
set number

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " lets tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" " don't nag me when hiding buffers
" set hidden " allow me to have buffers with unsaved changes.
" set autoread " when a file has changed on disk, just load it. Don't ask.

" leader is a key that allows you to have your own "namespace" of keybindings.
" " You'll see it a lot below as <leader>
let mapleader = " "
" TODO: figure out if there's a need to remap space...usually it's
" just a synonym for "l"
" " Allow to use "en" for "e" as in end
" noremap <leader>n e

" " Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
"" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
set gdefault " use the `g` flag by default.

" Drew Neil's "visual-star"
" xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
" xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" function! s:VSetSearch()
"   let temp = @s
"   norm! gv"sy
"   let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
"   let @s = temp
" endfunction

" Consider, for bash-like tabbing:
" set wildmode=longest, list
" Or for zsh-like:
" set wildmenu
" set wildmode=full

" longer history for ex mode history scrollback
set history=200
" filter your history scrollback by your partial input
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

set shell=bash\ --login



" Help out with tpope/vim-unimpaired, because [ and ] are far away on Dvorak
nmap <leader>k [
nmap <leader>j ]
omap <leader>k [
omap <leader>j ]
xmap <leader>k [
xmap <leader>j ]

" Also to move quickly w/o vim-unimpaired
nnoremap <silent> <leader>h :bprevious<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>H :bfirst<CR>
nnoremap <silent> <leader>L :blast<CR>
" [t]oggle
nnoremap <silent> <leader>t :b#<CR>
nnoremap <silent> <leader>x :bdelete<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>w :w<CR>

nnoremap <silent> <leader>r :source $MYVIMRC<CR>
nnoremap <silent> <leader>n :Rexplore<CR>
nnoremap <silent> <leader>o :Explore<CR>
" similar to C-z
nnoremap <silent> <leader>e :suspend<CR>

" promote whatever's on internal clipboard to external clipboard,
" usefuly after accidentally omitting "* (or "+)
nnoremap <silent> <leader>* :let @*=@"<CR>
" put from external clipboard
nnoremap <silent> <leader>+ :put *<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Open tests in vertical split
    "  vsp expand('%:r') . Spec.groovy


" Get a visual on misbehaved/trailing whitespace
set list listchars=tab:»·,trail:·,nbsp:·

"" Motions
" move to beginning/end of line (Doug Black)
nnoremap B ^
nnoremap E $

" [e]xit process
nnoremap <C-e> <C-z>
" scroll so slow that you fall asleep...[z]zzzz
nnoremap <C-z> <C-e>

" Searching
" have grep exclude certain dirs, filetypes by default
" set grepprg=grep\ -nr\ $*\ /dev/null
set grepprg=grep\ -nr\ --exclude-dir={node_modules,bower_components,dist,dist_bundle,.git,.tmp,logs,web-app,target}\ --exclude={\*.jck,\*.min.js,\*.min.css,index_compiled.css}\ $*\ /dev/null

" Configure gf
set suffixesadd=.groovy


" ----- Other suggestions from pthrasher/beginner.vimrc.vim that I may adopt soon: -----

" So we don't have to reach for escape to leave insert mode.
" inoremap uh <esc>eader><space> :noh<cr>:call clearmatches()<cr>

" bindings for easy split nav
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" " Use sane regex's when searching
" nnoremap / /\v
" vnoremap / /\v

" " Quick buffer switching - like cmd-tab'ing
" nnoremap <leader><leader> <c-^>

" " Visual line nav, not real line nav
" " If you wrap lines, vim by default won't let you move down one line to the
" " wrapped portion. This fixes that.
" noremap j gj
" noremap k gk
" " allow the cursor to go anywhere in visual block mode.
" set virtualedit+=block

augroup vimrcEx
    " clear & recreate this group each time .vimrc is re-sourced
    autocmd!
    " ----- From Will Butt -----
    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") &&
        \ !(expand('%:t') == "COMMIT_EDITMSG" && expand('%:p:h:t') == ".git") |
        \   exe "normal! g`\"" |
        \ endif
    " Delete trailing white space on save, useful for Python and CoffeeScript ;)
    autocmd BufWritePre * :%s/\s\+$//e
    " Looser rule: if entire line is whitespace, delete whitespace, useful for vim
    " paragraph jumps
    " autocmd BufWritePre * :%s/^\s\+$//e
augroup END

" Pull in work-in-progress vim tool
source $DOTFILE_HOME/vim-loggerhythm.vim

augroup filetypes
    autocmd!

    autocmd BufNewFile,BufRead *.io set filetype=io

    " Help vim-commentary out w/ some filetypes
    autocmd FileType groovy setlocal commentstring=//\ %s
    autocmd FileType io setlocal commentstring=#\ %s

    " Save + <compile +> run, in various languages
    autocmd filetype python
    \ nnoremap <leader>c :w <bar>
    \ exec '!python '.shellescape('%')<CR>

    autocmd filetype groovy
    \ nnoremap <leader>c :w <bar>
    \ exec '!groovy '.shellescape('%')<CR>

    autocmd filetype io
    \ nnoremap <leader>c :w <bar>
    \ exec '!io '.shellescape('%')<CR>

    autocmd filetype clojure
    \ nnoremap <leader>c :w <bar>
    \ exec '!lein exec '.shellescape('%')<CR>

    autocmd filetype haskell
    \ nnoremap <leader>c :w <bar>
    \ exec '!runhaskell '.shellescape('%')<CR>

    autocmd filetype elixir
    \ nnoremap <leader>c :w <bar>
    \ exec '!elixir '.shellescape('%')<CR>

    autocmd filetype rust
    \ nnoremap <leader>c :w <bar>
    \ exec '!rustc ' . shellescape('%') . ' && ./' . shellescape('%:r')<CR>

    autocmd filetype go
    \ nnoremap <leader>c :w <bar>
    \ exec '!go run ' . shellescape('%')<CR>

    autocmd filetype c
    \ nnoremap <leader>c :w <bar>
    \ exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

    autocmd filetype cpp
    \ nnoremap <leader>c :w <bar>
    \ exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

    autocmd filetype java
    \ nnoremap <leader>c :w <bar>
    \ exec '!javac '.shellescape('%')' && java '.shellescape('%:r')<CR>

    autocmd filetype javascript
    \ nnoremap <leader>c :w <bar>
    \ exec '!node '.shellescape('%')<CR>

    autocmd filetype javascript
    \ let @c=':call AddConsoleLog()' |
    \ let @w=':call AddWordLog()' |
    \ let @v=':call AddSelectionLog()' |
    \ let @j=':call WrapJsonStringify()'

    " " Certain Groovy config files indented at 2
    " autocmd filetype
augroup END

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Let CtrlP have up to 30 results.
let g:ctrlp_max_height = 30

" Examples of exclusions from CtrlP
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" My CtrlP exclusions
set wildignore+=*/.git/*,*/dist/*,*/target/*,*/.idea/*,*/.DS_Store,*.swp,*.class

" Finally the color scheme, chosen from the list at flazz link above.
colorscheme distinguished
