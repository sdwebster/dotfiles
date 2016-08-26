" This is my .vimrc , which configures my settings for vim.

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
let mapleader = ","
" Allow to use comma for reversing " by doubling up
noremap <leader>, ,

" " Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
"" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
set gdefault " use the `g` flag by default.

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

" In lieu of tpope/vim-unimpaired, because [ and ] are far away on Dvorak
nnoremap <silent> <leader>h :bprevious<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>H :bfirst<CR>
nnoremap <silent> <leader>L :blast<CR>
nnoremap <silent> <leader>x :bdelete<CR>

" Get a visual on misbehaved/trailing whitespace
set list listchars=tab:»·,trail:·,nbsp:·

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
    " autocmd BufWritePre * :%s/\s\+$//e
    " Looser rule: if entire line is whitespace, delete whitespace, useful for vim
    " paragraph navigation
    autocmd BufWritePre * :%s/^\s\+$//e
augroup END

" ----- Plugin settings -----

" Help vim-commentary out w/ some filetypes
augroup filetypes
    autocmd!
    autocmd FileType groovy setlocal commentstring=//\ %s
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
set wildignore+=*/.git/*,*/dist/*,*/.idea/*,*/.DS_Store,*.swp,*.class

" Finally the color scheme, chosen from the list at flazz link above.
colorscheme distinguished
