" General Settings
set nocompatible          " Disable compatibility with old versions of Vim
filetype off              " Disable filetype detection for plugin loading

" Filetype plugins and indenting
filetype plugin indent on
syntax on                 " Enable syntax highlighting
set encoding=utf-8        " Ensure proper encoding
set fileencoding=utf-8

" Interface Customizations
set number                " Show line numbers
set relativenumber        " Show relative line numbers
set cursorline            " Highlight the current line
set showmatch             " Highlight matching parentheses
set wildmenu              " Enhanced command-line completion
set showcmd               " Show incomplete commands
set ruler                 " Show the cursor position
set background=dark       " Optimize for dark themes
colorscheme desert        " Set a color scheme (choose your favorite)

" Search Settings
set hlsearch              " Highlight all search results
set incsearch             " Show search matches as you type
set ignorecase            " Ignore case when searching
set smartcase             " Case-sensitive if uppercase is used

" Indentation Settings
set tabstop=4             " Number of spaces for a tab
set shiftwidth=4          " Spaces for autoindent
set expandtab             " Convert tabs to spaces
set autoindent            " Maintain indent of the previous line

" Performance
set lazyredraw            " Avoid redraws in macros for better performance
set updatetime=300        " Faster completion
set timeoutlen=500        " Faster key sequence recognition

