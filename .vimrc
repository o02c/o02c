filetype off
filetype plugin indent off

set noswapfile     " スワップファイルを無効化
set number         " 行番号を表示
set cursorline     " カーソル行を強調表示
set incsearch      " 検索時に部分的な一致も表示
set hlsearch       " 検索文字列をハイライト
set showmatch      " 対応する括弧を表示
set matchtime=1    " 対応する括弧の表示時間（X/10秒）
set nowrap         " 折り返しを無効化
set nowrapscan     " 検索がファイルの終わりで停止
set ignorecase     " 検索時に大文字と小文字を区別しない
set smartcase      " 大文字が含まれる場合は区別する
set hidden         " 保存していないバッファを背景に隠す
set history=10000  " コマンド履歴を10000まで保持
set helplang=ja,en " ヘルプ言語の優先順位を日本語、英語に設定
set autoindent     " 新しい行のインデントを現在の行と同じにする
set breakindent    " 折り返し行のインデントを保持
set smarttab       " タブ挿入時の挙動を賢くする
set shiftwidth=2   " 自動インデント時の空白数
set tabstop=2      " タブの幅
set signcolumn=yes " サインカラムを常に表示

let mapleader = "\<Space>"

nnoremap <silent> Y y$
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" move window
nnoremap <right> <C-w>l
nnoremap <left> <C-w>h
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j

" use clipboard <Leader> + ~
nmap <Leader>y "+y
nmap <Leader>Y "+y$
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader>d "+d
nmap <Leader>D "+D
vmap <Leader>y "+y
vmap <Leader>p "+p
vmap <Leader>d "+d

" ==== PLUGIN ====
" Gitコマンドが存在するか確認
if executable('git')
  let plugin_base = '~/.vim/plugged/'
  " リポジトリと対応するGitHubリポジトリのリスト
  let repos = {
        \ 'fern.vim': 'https://github.com/lambdalisue/fern.vim',
        \ 'nerdfont.vim': 'https://github.com/lambdalisue/nerdfont.vim',
        \ 'glyph-palette.vim': 'https://github.com/lambdalisue/glyph-palette.vim',
        \ 'fern-renderer-nerdfont.vim': 'https://github.com/lambdalisue/fern-renderer-nerdfont.vim',
        \ 'fern-git-status.vim': 'https://github.com/lambdalisue/fern-git-status.vim',
        \ 'everforest': 'https://github.com/sainnhe/everforest',
        \ 'vim-commentary': 'https://github.com/tpope/vim-commentary',
        \ 'vim-surround': 'https://github.com/tpope/vim-surround',
        \ 'vim-colors-pencil': 'https://github.com/reedes/vim-colors-pencil',
        \ }
  
  " 各リポジトリに対して処理
  for [repo, url] in items(repos)
    let dir = plugin_base . '/' . repo
    " ディレクトリが存在しない場合にクローン
    if !isdirectory(expand(dir))
      " 親ディレクトリを作成
      call mkdir(fnamemodify(dir, ':h'), 'p')
      " git cloneを実行
      execute '!git clone ' . url . ' ' . dir
    endif
    " runtimepathに追加
    execute 'set runtimepath+=' . dir
  endfor

  let g:fern#renderer = "nerdfont"
  nnoremap <silent> <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

  set termguicolors
  colorscheme everforest
  set background=dark
  " colorscheme pencil
  " set background=light
endif

syntax on
filetype plugin indent on
